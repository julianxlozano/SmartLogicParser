require_relative '../config/environment.rb'

class Poem
    @@all=[]
    attr_accessor :name, :text

    def initialize(name="untitled",text)
        @name = name
        @text = text 
        save 
    end

    def save 
        @@all << self 
    end

    def self.all
        @@all 
    end 


end