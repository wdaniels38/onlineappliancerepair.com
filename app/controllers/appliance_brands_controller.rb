class ApplianceBrandsController < ApplicationController
  
    def new
    @appliance = Appliance.find(1)
    @brand_list = Brand.find(:all)
    @brand = ApplianceBrand.new
  end
  
  def create
    @brand = ApplianceBrand.new(params[:appliance_brand])
    @brand.save
    flash[:notice] = 'Story submission succeeded'
    redirect_to appliance_brands_path
  end
  
  
end
