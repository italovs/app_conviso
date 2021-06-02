class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true
  #where(conditions).where(['username = :value OR lower(email) = lower(:value)', { value: login }]).first

  attr_writer :login

  def login
    @login || username || email
  end
end
