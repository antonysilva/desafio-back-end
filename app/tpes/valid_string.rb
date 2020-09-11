class ValidString < ActiveRecord::Type::String
    def cast(value)
      if !value.nil?
        value = value.to_s.strip.gsub(/[^a-zA-Z0-9áàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\-.+_=,:(){} ]/,"")
        super(value)
      else
        super
      end
    end
  end