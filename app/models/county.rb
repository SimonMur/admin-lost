class County < ApplicationRecord
	has_many :users
	has_many :areas
end
