module Utils
  class NumberUtil
  
    def initialize(value)
      @value = value
    end
  
    def integer_to_money
      @value.to_i.fdiv(100)
    end
  
  end
end