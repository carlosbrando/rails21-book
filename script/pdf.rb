# def get_css(html_string)
#   css = []
#   html_string.each do |line|
#     if line =~ /.*<link.*href="..(\/layout\/.*\.css)".*type="text\/css".*\/>.*/
#       css << "'#{$1}'"
#     end
#   end
#   css.join(", ")
# end

desc 'Cria um arquivo pdf à partir do html gerado'
task :pdf => :html do
  prince = Prince.new()
  html_string = File.new("output/index.html").read
  prince.add_style_sheets 'layout/default.css'
  # get_css(html_string) 
  
  File.open('output/book.pdf', 'w') do |f|
    f.puts prince.pdf_from_string(html_string)
  end
  
  `open output/book.pdf`
end


