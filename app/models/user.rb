class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [ :facebook ]

  attr_accessible :email, :password, :password_confirmation

  has_many :user_word_sets
  has_many :word_sets, through: :user_word_sets
  has_many :learnts
end
