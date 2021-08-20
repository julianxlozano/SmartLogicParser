require_relative '../config/environment.rb'


class Parser 

    def self.load_raw_data
        file_0 = File.open("./raw_data_space.txt")
        file_1 = File.open("./raw_data_comma.txt")
        file_2 = File.open("./raw_data_pipe.txt")
        raw_data = [file_0.read,file_1.read,file_2.read]
        self.slice_and_dice(raw_data)
        raw_data

    end


    def self.slice_and_dice(raw_data)
        raw_data.each do |raw_dataset|
            if raw_dataset.include?("|")
                people_data = raw_dataset.split("\n")

                people_data.each do |person_data|
                    details = person_data.split("|")
                    self.create_new_record(details)
                end
              
            elsif raw_dataset.include?(",")
                people_data = raw_dataset.split("\n")
                people_data.each do |person_data|
                    details = person_data.split(",")
                    self.create_new_record(details)
                end
            else
                people_data = raw_dataset.split("\n")
                people_data.each do |person_data|
                    details = person_data.split(" ")
                    self.create_new_record(details)
                end
            end
        end 

    end

    def self.create_new_record(details)
        case 
        when details[-1].include?("/")  
            person = Record.new(
                firstname: details[1].strip,
                lastname: details[0].strip,
                gender: details[2].strip,
                date_of_birth: details[4].strip,
                favorite_color: details[3].strip
                )
        when details[-1].include?("-")
            person = Record.new(
                firstname: details[1].strip,
                lastname: details[0].strip,
                gender: details[3].strip,
                date_of_birth: details[5].strip,
                favorite_color: details[4].strip
                )
        else
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