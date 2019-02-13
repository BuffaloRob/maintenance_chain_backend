class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :items

  has_many :access_grants, class_name: "Doorkeeper::AccessGrant",
    dependent: :delete_all

  has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
    dependent: :delete_all
end
