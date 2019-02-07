class CityController < ApplicationController
  def show
    @grossip = Gossip.all
    @userall = User.all
  end
end
