desc 'Agrupa todos os arquivos em um único arquivo'
task :merge do
  File.open('output/full_book.texttile', 'w') do |f|
    directory "text", f
  end
end

def directory(dir_name, output)
  dir = Dir.new(dir_name)
  dir.sort.each do |file_name|
    unless file_name =~ /^\./
      file = "#{dir_name}/#{file_name}"
      if File.stat(file).directory?
        directory(file, output)
      else
        merge_output(file, output)
      end 
    end
  end
end

def merge_output(file, output)
  output.puts File.new(file).read + "\n\r"
end
