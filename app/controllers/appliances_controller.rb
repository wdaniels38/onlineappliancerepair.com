class AppliancesController < ApplicationController
 def view
   @appliance = Appliance.find_by_slug(params[:id])
   #-------brands
   @brand = @appliance.appliance_brands
 end
end
