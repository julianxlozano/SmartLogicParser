require_relative '../config/environment.rb'
describe Record do
    describe "The record class" do
            context "initialize method" do
                it "should break down the raw data into usable strings for creating objects." do
                    person = Record.new(
                    firstname: "Anna",
                    lastname: "Kournikova",
                    gender: "F",
                    date_of_birth: "6-3-1975",
                    favorite_color: "Red"
                    )

                    expect(person.bday).to eq("6/3/1975")
                    expect(person.favorite_color).to eq("Red")
                    expect(person.firstname).to eq("Anna")
                    expect(person.lastname).to eq("Kournikova")
                    expect(person.gender).to eq("Female")
                end
            end

            context "initialize method" do
                it ",upon receiving an gender acronym, set attribute as male or female." do
                    person_0 = Record.new(
                        gender: "F"
                    )

                    person_1 = Record.new(
                        gender: "M"
                    )
                    expect(person_0.gender).to eq("Female")
                    expect(person_1.gender).to eq("Male")
                end

            context "initialize method" do
                it "creates a Time object based on the date_of_birth_input" do
                    person_0 = Record.new(
                    date_of_birth: "6-3-1975"
                    )
                    expect(person_0.date_of_birth.to_s).to eq("1975-06-03 00:00:00 -0500")
                    end
                end

            context "initialize method" do
                it "populates default values if instantiated with no arguments." do
                    person = Record.new
                    expect(person.bday).to eq("1/1/1010")
                    expect(person.favorite_color).to eq("Void Black")
                    expect(person.firstname).to eq("Human")
                    expect(person.lastname).to eq("Being")
                    expect(person.gender).to eq("Female")
                    end
                end
            end
    end
end