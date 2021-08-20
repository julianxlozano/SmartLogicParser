require_relative '../config/environment.rb'


class Parser 
    def self.slice_and_dice
        file_0 = File.open("./raw_data_space.txt")
        file_1 = File.open("./raw_data_comma.txt")
        file_2 = File.open("./raw_data_pipe.txt")
        raw_data = [file_0.read,file_1.read,file_2.read]
    
        raw_data.each do |raw_dataset|
            if raw_dataset.include?("|")
                people_data = raw_dataset.split("\n")

                people_data.each do |person_data|
                    details = person_data.split("|")
                    
                    person = Record.new(
                        firstname: details[1].strip,
                        lastname: details[0].strip,
                        gender: details[3].strip,
                        date_of_birth: details[5].strip,
                        favorite_color: details[4].strip
                        )
                end
              

            elsif raw_dataset.include?(",")
                people_data = raw_dataset.split("\n")

                people_data.each do |person_data|
                    details = person_data.split(",")
  
                    person = Record.new(
                        firstname: details[1].strip,
                        lastname: details[0].strip,
                        gender: details[2].strip,
                        date_of_birth: details[4].strip,
                        favorite_color: details[3].strip
                        )
                end
            else
                people_data = raw_dataset.split("\n")

                people_data.each do |person_data|
                    details = person_data.split(" ")
                    
                    person = Record.new(
                        firstname: details[1].strip,
                        lastname: details[0].strip,
                        gender: details[3].strip,
                        date_of_birth: details[4].strip,
                        favorite_color: details[5].strip
                        )
                end
            end
        end 

    end
end 