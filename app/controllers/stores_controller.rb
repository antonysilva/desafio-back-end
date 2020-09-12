class StoresController < ApplicationController
  before_action :get_store, only: %w(show)
 
  def show
    @store
  end

  private 
  def get_store
    @store = Store.find_by_id(params[:id])
  end
end
