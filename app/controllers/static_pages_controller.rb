class StaticPagesController < ApplicationController

  def home
   @gossipall = Gossip.all
 end

 def contact
 end

 def team
end

  def error
  end
end
