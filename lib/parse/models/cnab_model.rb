module Parse
    module Models
        module CnabModel
            extend self

            def get
                {
                    transaction_type: 0,
                    transaction_date: 1..8,
                    amount: 9..18,
                    social_security: 19..29,
                    card_number: 30..41,
                    transaction_time: 42..47,
                    store_owner: 48..61,
                    store_name: 62..80
                }
            end

        end
    end
end
