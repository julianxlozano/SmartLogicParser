require_relative '../config/environment.rb'

class Record
    @@all=[]
    attr_accessor :name, :text

    def initialize(lastname, firstname, gender, date_of_birth, favorite_color)
        @lastname = @lastname
        @firstname = @firstname
        @gender = @gender
        @date_of_birth = @date_of_birth
        @favorite_color = @favorite_color
        save 
    end

    def save 
        @@all << self 
    end

    def self.all
        @@all 
    end 


end