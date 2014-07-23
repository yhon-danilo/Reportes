class User < ActiveRecord::Base
  has_many :reportes
	attr_accessor :password, :password_confirmation
	validates :usuario, :presence => true, :uniqueness => true, :length => {:in =>2..20}
	validates :password, :confirmation => true
	validates_length_of :password, :in => 6..20, :on => :create
	before_save :encrypt_password
	#after_save :clear_password
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	def self.authenticate(username_or_email="", login_password="")

    	if EMAIL_REGEX.match(username_or_email)
    	#if username_or_email
     	 user = User.find_by(email: username_or_email)
     	# 
    	else
      	  user = User.find_by(usuario: username_or_email)
      	  
      	  puts user
    	end
    	
    	if user && user.match_password(login_password)
      		return user
    	else
    	  return false
    	end
  	end

  	def match_password(login_password="")
  		
    	encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  	end

	def encrypt_password
		
		if password.present?
			self.salt=BCrypt::Engine.generate_salt
			self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
		end

	end	
  
	#def clear_password
		#self.password = nil
	#end


end
