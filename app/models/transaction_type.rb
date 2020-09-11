class TransactionType < ApplicationRecord
    attribute :name, :valid_string
    attribute :signal, :valid_string

    validates_presence_of :name, :signal
    validates_uniqueness_of :name, scope: :signal

    has_many :financial_transactions
end
