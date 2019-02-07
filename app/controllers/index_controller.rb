class IndexController < ApplicationController
  def show
    @grossip = Gossip.all
  end
end
