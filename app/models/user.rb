# require 'brcrypt'

class User < ActiveRecord::Base
  has_many :recipes
  has_one :kitchen_list
  has_many :ingredients, through: :kitchen_list

  validates :email, :presence => true, :uniqueness => true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end