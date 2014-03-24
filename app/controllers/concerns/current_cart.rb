module CurrentCart
  extend ActiveSupport::Concern

  private
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def set_counter
    if session[:counter].nil?
      @counter = 0
      session[:counter] = @counter
    else
      @counter = session[:counter] + 1
      session[:counter] = @counter
    end
  end

  def reset_counter
    @counter = 0
    session[:counter] = @counter
  end
end