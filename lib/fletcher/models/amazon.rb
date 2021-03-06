module Fletcher
  module Model
    class Amazon < Fletcher::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /amazon\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.css("h1.parseasinTitle").first_string
           
          # Get Description
          self.description = doc.css("div#productDescriptionWrapper").first_string    
                
          # Get description from meta title if not found
          self.description = doc.xpath("//meta[@name='description']/@content").first_string if description.nil?
          
          # Get Price
          parse_price(doc.css("b.priceLarge").first_string)
          
          # Get Images
          self.images = doc.xpath("//table[@class='productImageGrid']//img").attribute_array
          self.image = images.first
        end            
      end
    end
  end
end