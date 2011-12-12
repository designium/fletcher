require 'spec_helper'

describe Fletcher::Data do
  describe "open-uri" do
    it "tells me how long it taks to open an uri file" do 
      #puts benchmark{ file = open(Factory(:valid_item).url)}.to_s  
    end 
  end
  
  describe "read" do 
    it "should return a valid document" do 
      doc = Fletcher::Data.read(Factory(:valid_item).url)
    end
    
    # This is just a rough indicator of how long a data should take to download
    it "shouldn't take too long" do 
      benchmark{ doc = Fletcher::Data.read(Factory(:valid_item).url)}.should_not be_slower_than(3.0)
    end    
  end
end  