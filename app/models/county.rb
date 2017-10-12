class County < ApplicationRecord
	belongs_to :users
	belongs_to :areas
end
