files = Dir.glob("#{Dir.pwd}**/*/*/*/*.*").inject({}) do |hsh, file|
  file_exten = file.split(".")[-1]
  hsh[file_exten] ||=[0,0]
  hsh[file_exten][0] +=1
  hsh[file_exten][1] += File.size(file)
  hsh
end
files.each do |key, value|
  puts "extension:#{key} \t files_number:#{value[0]} \t total_file_size:#{value[1]}"
end
