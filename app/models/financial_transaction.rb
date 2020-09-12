class FinancialTransaction < ApplicationRecord
  attribute :transaction_date, :date
  attribute :transaction_time, :valid_time
  attribute :amount, :integer
  attribute :social_security, :valid_string
  attribute :card_number, :valid_string
  
  validates_presence_of :transaction_date, :transaction_time, :amount, :social_security, :card_number

  belongs_to :transaction_type
  belongs_to :store

  def real_ammount
    instance_eval "#{self.transaction_type.signal}1 * #{self.amount}"
  end
end
