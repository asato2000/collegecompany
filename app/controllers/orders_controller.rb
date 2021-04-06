class OrdersController < ApplicationController
    require 'payjp' #前回と同じくpayjpのメソッドを使用するために使います。

  def new
    @post = Post.find(params[:id])
    @order = Order.new
  end

end
