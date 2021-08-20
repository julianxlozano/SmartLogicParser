require_relative '../config/environment.rb'
describe CLI do
    describe "The CLI class" do
        context "self.sort_by_gender" do
            it "should sort Record objects by gender & lastname ascending." do 
                Record.destroy_all
                Parser.load_raw_data
                output_1 = <<HEREDOC
                Hingis Martina Female 4/2/1979 Green
Kelly Sue Female 7/12/1959 Pink
Kournikova Anna Female 6/3/1975 Red
Seles Monica Female 12/2/1973 Black
Abercrombie Neil Male 2/13/1943 Tan
Bishop Timothy Male 4/23/1967 Yellow
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Smith Steve Male 3/3/1985 Red
HEREDOC
                expect{CLI.sort_by_gender}.to output().to_stdout
            end
        end
        context "self.sort_by_birthdate" do
            it "should sort Record objects by birthdate." do 
                Record.destroy_all
                Parser.load_raw_data
                output_2 =<<HEREDOC
Abercrombie Neil Male 2/13/1943 Tan
Kelly Sue Female 7/12/1959 Pink
Bishop Timothy Male 4/23/1967 Yellow
Seles Monica Female 12/2/1973 Black
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Kournikova Anna Female 6/3/1975 Red
Hingis Martina Female 4/2/1979 Green
Smith Steve Male 3/3/1985 Red
HEREDOC
                expect{CLI.sort_by_birthdate}.to output(output_2).to_stdout
                
            end
        end
        context "self.sort_by_lastname_desc" do
            it "should sort Record objects by lastname decending." do 
                Record.destroy_all
                Parser.load_raw_data
                output_3 = <<HEREDOC 
Smith Steve Male 3/3/1985 Red
Seles Monica Female 12/2/1973 Black
Kournikova Anna Female 6/3/1975 Red
Kelly Sue Female 7/12/1959 Pink
Hingis Martina Female 4/2/1979 Green
Bouillon Francis Male 6/3/1975 Blue
Bonk Radek Male 6/3/1975 Green
Bishop Timothy Male 4/23/1967 Yellow
Abercrombie Neil Male 2/13/1943 Tan
HEREDOC
                expect{CLI.sort_by_lastname_desc}.to output(output_3).to_stdout
             
            end
        end
    end
end
