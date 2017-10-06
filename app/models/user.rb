class User < ApplicationRecord
  acts_as_easy_captcha
  validate :valid_captcha?, :on => :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable, :confirmable, :lockable

end
