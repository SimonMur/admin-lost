class User < ApplicationRecord
  acts_as_easy_captcha
 
  before_create :build_default_account 
 belongs_to :plan
 has_many :lostitems
 belongs_to :county
 belongs_to :area
 has_many :histories
  has_many :usersfoundid_contacts
 has_one :account
 has_many :notifications, dependent: :destroy
 validates :first_name, presence: true
  validates :second_name, presence: true
  validates :idnumber, presence: true
  validates :email, presence: true
  validates :county_id, presence: true
  validates :area_id, presence: true
  validates :terms, presence: true
  validates :mobilenumber, presence: true, length: {minimum: 10, maximum: 10} 
  mount_uploader :picture, PictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable, :confirmable, :lockable
          attr_accessor :raw_address
geocoded_by :raw_address
after_validation -> {
  self.address = self.raw_address
  geocode
}, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }

after_validation :reverse_geocode, unless: ->(obj) { obj.raw_address.present? },
                 if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
                  
before_create do
  o = [('1'..'9'), ('A'..'Z')].map(&:to_a).flatten
    self.user_code ||=  (0...5).map { o[rand(o.length)] }.join

  end



def build_default_account  
  build_account
  true
end  
end
