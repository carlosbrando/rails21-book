require 'RedCloth'
require 'coderay'

desc 'Transforma o arquivo em HTML'
task :textilize => :merge do
  if File.exists?('output/full_book.texttile')
    output = File.new('output/full_book.texttile').read
    output = RedCloth.new(output).to_html

    File.open('output/index.html', 'w') do |f|
      html_template = File.new("layout/pdf_template.html").read
      html_template.gsub!("#body", output)
      f.puts html_template
    end
  end
end

class RedCloth
  ##
  # Take a block starting with ruby. and add proper tags for styling.
  #
  #   ruby. my_code.rb
  def textile_ruby(tag, atts, cite, content)
    # %(<pre><code class="ruby">#{content}</pre></code>)
    ret = if content =~ /#(.+)/
      tag = $1
      file_name = content.gsub("##{tag}", '')

      tmp, find_end = '', false
      File.new("code/#{file_name}").readlines.each do |line|
        unless find_end
          find_end = true if line =~ /BEGIN #{tag}/
        else
          break if line =~ /END #{tag}/
          tmp += line
        end
      end
      CodeRay.scan(tmp, :ruby).html.div
    else
      code_file = File.new("code/#{content}").read
      CodeRay.scan(code_file, :ruby).html.div
    end

    ret.gsub!('&quot;', '"')
    # ret.gsub!('    ', '  ')
    ret.gsub('&gt;', '>')
  end

  ##
  # Standard code block.
  #
  #   code. git-svn clone foo
  def textile_code(tag, atts, cite, content)
    %(<pre><code>#{content}</pre></code>)
  end
end
