require_relative '../config/environment.rb'

class Record
    @@all=[]
    attr_accessor :lastname, :firstname, :gender, :date_of_birth, :favorite_color, :bday

    def initialize(lastname: "Being", firstname: "Human", gender: "N/A", date_of_birth: "1/1/1010", favorite_color:"Void Black")
        @lastname = lastname
        @firstname = firstname
        @favorite_color = favorite_color
        gender == "F" || gender == "Female" ? @gender = "Female" : @gender = "Male"

        if date_of_birth.include?("-")
            dob = date_of_birth.split("-")
     
            @date_of_birth = Time.new(dob[2].to_i,dob[0].to_i,dob[1].to_i)
            @bday = dob.join("/")
        else
            dob = date_of_birth.split("/")
            @date_of_birth = Time.new(dob[2].to_i,dob[0].to_i,dob[1].to_i)
            @bday = date_of_birth
      
    
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