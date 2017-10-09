class User < ApplicationRecord
 
 validates :first_name, presence: true
  validates :second_name, presence: true
  validates :idnumber, presence: true
  validates :email, presence: true
  validates :county_id, presence: true
  validates :area_id, presence: true
  validates :terms, presence: true
  validates :mobilenumber, presence: true, length: {minimum: 10, maximum: 10} 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable, :confirmable, :lockable
before_create do
  o = [('1'..'9'), ('A'..'Z')].map(&:to_a).flatten
    self.user_code ||=  (0...8).map { o[rand(o.length)] }.join

  end

end
