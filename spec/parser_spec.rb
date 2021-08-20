require_relative '../config/environment.rb'

describe Parser do 
    describe "In the Parser class" do
        context "the load_raw_data method" do
            it "should successfully load raw data." do
                expect(Parser.load_raw_data).to eq(["Kournikova Anna F F 6-3-1975 Red\nHingis Martina M F 4-2-1979 Green\nSeles Monica H F 12-2-1973 Black", "Abercrombie, Neil, Male, Tan, 2/13/1943\nBishop, Timothy, Male, Yellow, 4/23/1967\nKelly, Sue, Female, Pink, 7/12/1959", "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"])
            end
        end

        context "the slice_and_dice method" do
            it "should break down the raw data into usable strings for creating objects." do
                raw_data = Parser.load_raw_data
                
                expect(Parser.slice_and_dice(raw_data)).to eq([["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"],
                ["Hingis", "Martina", "M", "F", "4-2-1979", "Green"],
                ["Seles", "Monica", "H", "F", "12-2-1973", "Black"],
                ["Abercrombie", " Neil", " Male", " Tan", " 2/13/1943"],
                ["Bishop", " Timothy", " Male", " Yellow", " 4/23/1967"],
                ["Kelly", " Sue", " Female", " Pink", " 7/12/1959"],
                ["Smith ", " Steve ", " D ", " M ", " Red ", " 3-3-1985"],
                ["Bonk ", " Radek ", " S ", " M ", " Green ", " 6-3-1975"],
                ["Bouillon ", " Francis ", " G ", " M ", " Blue ", " 6-3-1975"]])
            end
        end   
    end

end