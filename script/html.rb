require 'rubygems'
require 'discount'
# require "ruby-debug"
# require 'coderay'
# require "script/tm_syntax_highlighting"
require "uv"

desc 'Transforma o arquivo em HTML'
task :html => :merge do
  if File.exists?('output/full_book.texttile')
    output = File.new('output/full_book.texttile').read
    output = Discount.new(output).to_html

    File.open('output/index.html', 'w') do |f|
      html_template = File.new("layout/pdf_template.html").read
      # html_template = Uv.parse( html_template, "xhtml", "ruby", false, "mac_classic")
      
      html_template.gsub!("#body", output)
      
      html_template.gsub! /<pre><code>.*?<\/code><\/pre>/m do |code|
        code = code.gsub('<pre><code>', '').gsub('</code></pre>', '').gsub('&lt;', '<').gsub('&gt;', '>').gsub('&amp;', '&')
        Uv.parse(code, "xhtml", "ruby", false, "mac_classic")
      end
      
      # debugger
      #       html_template.gsub!("<pre><code>", "<pre name=\"code\" class=\"ruby\">")
      #       html_template.gsub!("</code>", "")
      f.puts html_template
    end
  end
end

# class RedCloth
#   ##
#   # Take a block starting with ruby. and add proper tags for styling.
#   #
#   #   ruby. my_code.rb
#   def textile_ruby(tag, atts, cite, content)
#     # %(<pre><code class="ruby">#{content}</pre></code>)
#     ret = if content =~ /#(.+)/
#       tag = $1
#       file_name = content.gsub("##{tag}", '')
# 
#       tmp, find_end = '', false
#       File.new("code/#{file_name}").readlines.each do |line|
#         unless find_end
#           find_end = true if line =~ /BEGIN #{tag}/
#         else
#           break if line =~ /END #{tag}/
#           tmp += line
#         end
#       end
#       CodeRay.scan(tmp, :ruby).html.div
#     else
#       code_file = File.new("code/#{content}").read
#       CodeRay.scan(code_file, :ruby).html.div
#     end
# 
#     ret.gsub! '&quot;', '"'
#     ret.gsub  '&gt;'  , '>'
#   end
# 
#   ##
#   # Take a block starting with ruby. and add proper tags for styling.
#   #
#   #   html. my_code.rb
#   def textile_html(tag, atts, cite, content)
#     ret = if content =~ /#(.+)/
#       tag = $1
#       file_name = content.gsub("##{tag}", '')
# 
#       tmp, find_end = '', false
#       File.new("code/#{file_name}").readlines.each do |line|
#         unless find_end
#           find_end = true if line =~ /BEGIN #{tag}/
#         else
#           break if line =~ /END #{tag}/
#           tmp += line
#         end
#       end
#       CodeRay.scan(tmp, :html).html.div
#     else
#       code_file = File.new("code/#{content}").read
#       CodeRay.scan(code_file, :html).html.div
#     end
# 
#     ret.gsub! '&quot;', '"'
#     # ret.gsub! '&lt;p&gt;'  , '|p|'
#     # ret.gsub! '&lt;/p&gt;'  , '[/p|'
#     # ret.gsub! '&lt;'  , '&#60;'
#     # ret.gsub! '&gt;'  , '&#60;'
#     # ret.gsub  '&amp;', '&'
#     # ret.gsub '&amp;', '&'
#     # ret.gsub! '<p>', '<code><p></code>'
#     ret.gsub! '<', '&lt;'
#     ret.gsub! '>', '&gt;'
#     # "<pre><code>#{ret}</code></pre>"
#     ret
#   end
# 
#   ##
#   # Standard code block.
#   #
#   #   code. git-svn clone foo
#   def textile_code(tag, atts, cite, content)
#     %(<pre><code>#{content}</pre></code>)
#   end
# end
