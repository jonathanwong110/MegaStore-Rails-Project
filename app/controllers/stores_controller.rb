class StoresController < ApplicationController
  
  def index
    @stores = Store.all
  end
  
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.valid?
      @store.save
      redirect_to new_store_path
    else
      render 'new'
    end
  end

  private

  def store_params
    params.require(:store).permit(:username, :email, :password_digest)
  end

end
