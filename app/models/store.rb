class Store < ApplicationRecord
    attribute :name, :valid_string
    attribute :owner, :valid_string
    
    validates_presence_of :name, :owner
    validates_uniqueness_of :name, scope: :owner

    has_many :financial_transactions, dependent: :destroy

    def total_amount
        Utils::NumberUtil.new(
            self.financial_transactions.map(&:real_ammount).reduce(:+)
        ).integer_to_money
    end
end
