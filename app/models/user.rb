class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [ :facebook ]

  has_many :user_word_sets
  has_many :word_sets, through: :user_word_sets
  has_many :learnts
  has_many :search_tabs

  attr_accessible :first_name, :last_name, :email, :learnt_threshold, :password, :password_confirmation
end
