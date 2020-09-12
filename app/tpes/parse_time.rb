class ParseTime < ActiveRecord::Type::String
    def cast(value)
      if !value.nil?
        if value.tr('^0-9', '').length == 6  
            value = value.tr('^0-9', '').scan(/.{2}/).join(":")
        end
        
        super(value)
      else
        super
      end
    end
  end