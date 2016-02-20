module Save_load
 def load_file
   puts "enter the file name"
   file_name = "saved_game/#{gets.chomp}.yaml"
   if File.exist?(file_name)
     assign_data(YAML.load_file(file_name))
   else
     puts "incorrect file name"
     load_file
   end
 end

 def assign_data(data)
   @turns_number = data[:turns_number]
   @final_answer = data[:final_answer]
   @user_input_collection = data[:user_input_collection]
   @grid_container = data[:grid_container]
 end
 def save_file(name)
   hash = { player_name:name,
            final_answer:@final_answer,
            turns_number:@turns_number,
            grid_container: @grid_container,
            user_input_collection: @user_input_collection
    }
   Dir.chdir("#{Dir.pwd}/saved_game")
   File.open("#{name}.yaml", "w") {|x| x.puts hash.to_yaml }
 end

end
