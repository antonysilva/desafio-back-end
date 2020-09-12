module FinancialTransactionService
    class Create

        def initialize(parsed_file)
            @parsed_file = parsed_file
        end

        def execute
            ActiveRecord::Base.transaction do
                saved_lines = 1

                save_store = proc{|name, owner|
                    store = ::Store.new({name: name, owner: owner}) 
                    ::Store.find_or_create_by!(name: store.name, owner: store.owner)
                }

                @parsed_file.each do |transaction|
                    transaction_type = ::TransactionType.find_by_id(transaction[:transaction_type].to_i)
                    store = save_store.call(transaction[:store_name], transaction[:store_owner])
                    
                    f_transaaction = ::FinancialTransaction.new({
                        transaction_date: transaction[:transaction_date],
                        transaction_time: transaction[:transaction_time],
                        amount: transaction[:amount],
                        social_security: transaction[:social_security],
                        card_number: transaction[:card_number],
                        transaction_type: transaction_type,
                        store: store
                    }) 
                    ::FinancialTransaction.find_or_create_by!(f_transaaction.attributes.except(:id))
                    
                    saved_lines += 1
                end

                return saved_lines
            rescue StandardError => e
                raise "Saved file error at line: #{saved_lines}"
            end
        end

    end    
end