class AdminController < ApplicationController
  
  layout 'admin'
  before_filter :admin_logged_in?, :except => [:login, :send_login] 
  
  def index
  end


#----------------- Settings section ----------
  def settings
    
  end


#----------------- Appliances section ----------
  def appliances
   @appliance = Appliance.find(:all, :order => "appliance")
   @new_appliance = Appliance.new
   @update_appliance = Appliance.new
  end
 
 def add_appliance
   @new_appliance = Appliance.new(params[:appliance])
   @new_appliance.save
   redirect_to(:back)
 end
 
 def delete_appliance
   Appliance.find(params[:id]).destroy
   redirect_to(:back)
 end
 
 def update_appliance
   @update_appliance = Appliance.find(params[:id])
   @update_appliance.update_attributes(params[:appliance])
   redirect_to(:back)
 end
 
#---------- Appliance Options section
 
 def appliance_options
   @appliance = Appliance.find_by_slug(params[:id])
   #-------brands
   @brand = @appliance.appliance_brands
   @new_appliance_brand = ApplianceBrand.new
   @brands = Brand.find(:all)
   #-------problems
   @appliance_problem = @appliance.appliance_problems
   @new_appliance_problem = ApplianceProblem.new
   @update_appliance_problem = ApplianceProblem.new
   #-------tools
   @appliance_tools = @appliance.appliance_tools
   @new_appliance_tool = ApplianceTool.new
   @update_appliance_tool = ApplianceTool.new 
 end

#Brands (add : delete)

def add_appliance_brand
   @new_appliance_brand = ApplianceBrand.new(params[:appliance_brand])
   @new_appliance_brand.save
   redirect_to(:back)
 end
 
 def delete_appliance_brand
   ApplianceBrand.find(params[:id]).destroy
   redirect_to(:back)
 end
 
#Problems (add : delete : update)
 
def add_appliance_problem
   @new_appliance_problem = ApplianceProblem.new(params[:appliance_problem])
   @new_appliance_problem.save
   redirect_to(:back)
 end
 
 def delete_appliance_problem
   ApplianceProblem.find(params[:id]).destroy
   redirect_to(:back)
 end
 
  def update_appliance_problem
   @update_appliance_problem = ApplianceProblem.find(params[:id])
   @update_appliance_problem.update_attributes(params[:appliance_problem])
   redirect_to(:back)
 end 
 
 #Tools (add : delete : update)
 
def add_appliance_tool
   @new_appliance_tool = ApplianceTool.new(params[:appliance_tool])
   @new_appliance_tool.save
   redirect_to(:back)
 end
 
 def delete_appliance_tool
   ApplianceTool.find(params[:id]).destroy
   redirect_to(:back)
 end
 
  def update_appliance_tool
   @update_appliance_tool = ApplianceTool.find(params[:id])
   @update_appliance_tool.update_attributes(params[:appliance_tool])
   redirect_to(:back)
 end 
 
 
#----------------- Brands section ----------
def brands
  @brand = Brand.find(:all)
  @update_brand = Brand.new
  @new_brand = Brand.new
end

def add_brand
   @new_brand = Brand.new(params[:brand])
   @new_brand.save
   redirect_to(:back)
 end
 
 def delete_brand
   Brand.find(params[:id]).destroy
   redirect_to(:back)
 end
 
  def update_brand
   @update_brand = Brand.find(params[:id])
   @update_brand.update_attributes(params[:brand])
   redirect_to(:back)
 end
 
 #----------------- Videos section ----------
def videos
  @appliance = Appliance.find(:all, :order => "appliance")
end

def videos1
  @appliance = Appliance.find(params[:appliance])
  @brand = @appliance.appliance_brands
  render :partial => 'videos1'
end

def videos2
  @appliance = Appliance.find(params[:appliance])
  @appliance_problem = @appliance.appliance_problems
  @find_video = Video.new
  render :partial => 'videos2'
end

def video_settings
  @video = Video.find_all_by_appliance_id_and_brand_id_and_appliance_problem_id(params[:appliance_id], params[:brand_id], params[:appliance_problem_id])
  @appliance = Appliance.find(params[:appliance_id])
  @brand = ApplianceBrand.find(params[:brand_id])
  @problem = ApplianceProblem.find(params[:appliance_problem_id])
  @new_video = Video.new
end


# PROBLEM IS WHEN RENDERING PARTIAL IT IS NOT SENDING DATA TO PARTIAL
def add_video
   @new_video = Video.new(params[:video])
   @new_video.save
   @video = Video.find_all_by_appliance_id_and_brand_id_and_appliance_problem_id(params[:video][:appliance_id], params[:video][:brand_id], params[:video][:appliance_problem_id])
   render(:partial => 'video', :collection => @video)
 end


#------------ Login & Log out section
  def login
    #@login = Setting.new
  end
  
  def send_login
    found_user = Setting.authenticate(params[:username], params[:password])    
    #marked user as logged in
    if found_user
      flash[:notice] = "You are now logged in"
      session[:admin] = found_user.username
      redirect_to(:action => 'index')
    else
    #if password is wrong send back to login page
      flash[:notice] = "Username/Password combination incorrect"
      render (:action => 'login')
    end
      
  end
  
  def log_out
    reset_session
    redirect_to(:action => 'index')
  end
  
  
end
