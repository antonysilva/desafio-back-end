FactoryBot.define do
    factory :financial_transaction do
        transaction_date { Faker::Date.between(from: '2019-01-01', to: '2020-12-31') }
        transaction_time { "172300" }
        amount { Faker::Number.number(digits: 6) }
        social_security { Faker::IDNumber.brazilian_citizen_number }
        card_number { Faker::Finance.credit_card(:mastercard, :visa) }
        store
        transaction_type
    end
end
