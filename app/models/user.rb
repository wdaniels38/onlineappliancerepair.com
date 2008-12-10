class User < ActiveRecord::Base
	attr_accessor :email_confirmation, :password_confirmation, :password
	attr_protected :hashed_password, :salt
	
	validates_presence_of :user_id, :email, :password
	validates_uniqueness_of :user_id
	validates_confirmation_of :password, :message => "Passwords do not match"
	validates_confirmation_of :email, :message => "should match email"
	
	#creates salt using user_id and then hashes password with salt before it creates the entry
	def before_create
		self.salt = User.make_salt(self.user_id)
		self.hashed_password = User.hash_password_with_salt(@password, self.salt)
	end
	
	def before_update
		if !@password.blank?
		self.hashed_password = User.hash_password_with_salt(@password, self.salt)
		end
	end	
	
	def after_save
		@password = nil
	end
	
	# Checks to see if user exist in database and if so verifies password against salty password
	def self.authenticate(user_id = "", password = "")
		user = self.find(:first, :conditions => ["user_id = ?" , user_id])
		return (user && user.authenticated?(password)) ? user : nil
	end
	
	def authenticated?(password = "")
		self.hashed_password == User.hash_password_with_salt(password, self.salt)
	end
	
	
	private  #---------Method to Hash the password and create the salt. Private so no one tries to steal the salt lol.
	def self.make_salt(string)
		return Digest::SHA1.hexdigest(string.to_s + Time.now.to_s)
	end	   
	
	def self.hash_password_with_salt(password, salt)
		return Digest::SHA1.hexdigest("I love #{salt} with my #{password}")
	end
  
end
