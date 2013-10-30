class User < ActiveRecord::Base
  include Clearance::User
  validates_presence_of :encrypted_password

  attr_accessible :email

  def logged_in?
    true
  end

  def set_password(new_password)
    if new_password.present?
      self.password = new_password
    end
  end


end
