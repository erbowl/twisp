class User < ApplicationRecord
  has_many :tweets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable,:omniauthable
end
