class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :comments
has_many :pins 
validates :name, presence: true 
acts_as_followable
acts_as_follower
acts_as_liker
end



