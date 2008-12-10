class Setting < ActiveRecord::Base
	
	attr_accessor :password
	attr_protected :hash_password
	
	validates_presence_of :username, :password
	
	def before_create
		self.hashed_password = Setting.hashed_password(self.password)
	end
	
	def after_create
		@password = nil
	end
    
  def self.authenticate(username, password)
	  hashed_password = self.hash_password(password || "")
	  user = self.find(:first, :conditions => ["username = ? AND hashed_password = ?" , username, hashed_password])
	  return user
  end
 

   
   private #---------Method to Hash the password! Don't worry the salt is coming lol
   
  def self.hash_password(password)
	  return Digest::SHA1.hexdigest(password)
  end    
end
