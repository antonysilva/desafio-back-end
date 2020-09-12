module StoreService
  class CurrentBalance

    def initiaalize(store)
      raise "Store can't be nil" if store.nil?
      @store = store
    end

    def execute
      @store.financial_transactions.map(&:real_ammount).reduce(:+)
    end

  end
end