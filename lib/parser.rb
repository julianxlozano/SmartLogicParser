require_relative '../config/environment.rb'


class Parser 
    def self.slice_and_dice
        file_0 = File.open("./raw_data_space.txt")
        file_1 = File.open("./raw_data_pipe.txt")
        file_2 = File.open("./raw_data_space.txt")
        raw_data = [file_0.read,file_1.read,file_2.read]

        
        raw_data.each do |raw_dataset|
            if raw_dataset.include?("|")
                people_data = raw_dataset.split("\n")

                people_data.each do |person_data|
                    details = person_data.split("|")
                    
                    person = Record.new(
                        firstname: details[1],
                        lastname: details[0],
                        gender: details[3],
                        date_of_birth: details[5],
                        favorite_color: details[4]
                        )
                        binding.pry
                        p"t"
                end
              

            elsif raw_dataset.include?(",")
            else
            end
        end 

    end
end 