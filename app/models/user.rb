include BCrypt

class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  validates :name, :email, :password, presence: true
  validates :email, :format => {:with =>/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }
  validates :email, uniqueness: true

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end

  def self.authenticate(email,password)
  	p email
  	p password
  	@user = User.find_by_email(email)
  	if @user.password == password
  		return @user
  	end
  end

end
