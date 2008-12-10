class HomeController < ApplicationController
  def index
    @title = "Online appliance repair - Appliance repair videos online"
    
    @appliance = Appliance.find(:all, :order => "appliance")
  end
end
