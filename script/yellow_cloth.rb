# Copyright (c) 2008 Topfunky Corporation
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

unless RedCloth
  require 'RedCloth'
end

class YellowCloth < RedCloth

  def initialize(*args)
    @figure_counter = ?A
    super
  end

  ##
  # Take a block starting with ruby. and add proper tags for styling.
  #
  #   ruby. def blah()

  def textile_ruby( tag, atts, cite, content )
    %(<pre><code class="ruby">#{content}</pre></code>)
  end

  ##
  # Standard code block.
  #
  #   code. git-svn clone foo

  def textile_code( tag, atts, cite, content )
    %(<pre><code>#{content}</pre></code>)
  end


  ##
  # Styles a caption and image url.
  #
  #   figure(class_name). caption | url
  #
  #   figure(lg). George Washington, First President of the USA | http://example.com/gw.jpg

  def textile_figure(tag, atts, cite, content)
    span_class = ""
    if atts =~ /class="([^\"]+)"/
      span_class = $1
    end
    (caption, img_url) = content.split("|").map { |w| w.strip! }

    figure_name = "Figure " + @figure_counter.chr
    figure_id   = figure_name.downcase.gsub(" ", "-")
    @figure_counter += 1

    %Q(<div class="figure #{span_class}" id="#{figure_id}"><img src="#{img_url}" alt="#{caption}" title="#{figure_name}" /><div><strong>#{figure_name}</strong> #{caption}</div></div>)
  end

end