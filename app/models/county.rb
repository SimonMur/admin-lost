class County < ApplicationRecord
	belongs_to :user
	has_many :areas
end
