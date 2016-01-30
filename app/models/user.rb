require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	# This is Sinatra! Remember to create a migration!

	attr_accessor :password
    attr_writer :password_hash

	validates :username, presence: true, uniqueness: true
	validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i ,
    :message => "Email wrong format" }
    validates :email, uniqueness: true,presence: true
    validates :encrypted_password, presence: true

    def password
        @password ||= Password.new(encrypted_password)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.encrypted_password = @password
    end

    def list
        User.all
    end

    def self.authenticate(email,password)
        
    end

    # def self.password_convert(password_ori)
    #     p_p = Password.create(password_ori)
    #     p_h ||= Password.new(p_p)
    #     return p_h
    # end

    #before_validation :checking_confirm_password

    # def initialize(signup = {})
    # 	#@signup = signup
    # 	super()
    # 	@username = signup["username"]
    # 	@email = signup["email"]
    # 	@password = signup["password"]
    # 	@confirm_password = signup["confirm_password"]
    # end

	# def create_user
	# 	p_p = Password.create(@password)
	# 	p_h ||= Password.new(p_p)
	# 	user_hash = {:username => @username,:email => @email, :encrypted_password => p_h}

	# 	User.create(user_hash)

	# end

    # def list
    # 	User.all
    # end

end
