require 'rails_helper'

RSpec.describe "StoresController", type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: "/stores/3").to be_routable
    end

    it 'routes to #show, check params' do
      expect(get: "/stores/3").to route_to(
        controller: "stores",
        action: "show",
        id: "3"
      )
    end
  end

end