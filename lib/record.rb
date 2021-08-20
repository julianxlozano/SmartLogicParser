require_relative '../config/environment.rb'

class Record
    @@all=[]
    attr_accessor :lastname, :firstname, :gender, :date_of_birth, :favorite_color

    def initialize(lastname: "Being", firstname: "Human", gender: "Non Binary", date_of_birth: "1/1/1010", favorite_color:"Void Black")
        @lastname = lastname
        @firstname = firstname
        @favorite_color = favorite_color
        gender == "F" ? @gender = "Female" : @gender = "Male"
        if date_of_birth.include?("-")
            dob = date_of_birth.split("-")
            @date_of_birth = dob.join("/")
        end
        save 
    end

    def save 
        @@all << self 
    end

    def self.all
        @@all 
    end 


end