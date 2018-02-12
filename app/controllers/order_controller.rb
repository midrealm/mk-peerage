class OrderController < ApplicationController
  def index
    @order = Peer.subclass(peerage)
  end
end
