module Parse
  module Files

    class ParseFile

        def initialize(file, model)
            @file = file
            @model = model
          end
        
          def parse
            read_file
            @items
          end
        
          private
          def read_file
            @items = Array.new

            File.open(@file).each do |line|
                object = Hash.new
                
                @model.each do |key, value|
                  object[key] = line[value]
                end
                
                @items << object
            end
          end
    end
    
  end  
end