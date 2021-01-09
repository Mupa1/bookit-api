class User < ApplicationRecord
  acts_as_token_authenticatable
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      [
        'lower(username) = :value OR lower(email) = :value',
        { value: login.strip.downcase }
      ]
    ).first
  end

  def generate_new_authentication_token
    token = User.generate_unique_secure_token
    update_attributes authentication_token: token
  end
end
