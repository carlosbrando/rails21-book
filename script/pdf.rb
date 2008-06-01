desc 'Cria um arquivo pdf à partir do html gerado'
task :pdf => :html do
  prince = Prince.new()
  prince.add_style_sheets 'layout/coderay.css', 'layout/default.css'
  
  html_string = File.new("output/index.html").read
  
  File.open('output/book.pdf', 'w') do |f|
    f.puts prince.pdf_from_string(html_string)
  end
  
  `open output/book.pdf`
end