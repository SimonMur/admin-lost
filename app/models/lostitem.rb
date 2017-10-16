class Lostitem < ApplicationRecord
  belongs_to :type
  belongs_to :county
  belongs_to :user
 
end
