class User < ActiveRecord::Base 
  has_secure_password

  has_many :projects, dependent: :destroy

  validates :name, presence: true 
  validates :name, uniqueness: true 
  validates :password, presence: true
  

end