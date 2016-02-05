require 'yaml'
hash = {x: "string1", Y: "string2", Z:"string3"}
#File.open("test.yaml", "w") {|x| x.puts hash.to_yaml }
data = YAML.load_file("test.yaml")
puts "done"
