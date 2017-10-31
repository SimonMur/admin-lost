class Lostitem < ApplicationRecord
  belongs_to :type
  belongs_to :county
  belongs_to :user
 def self.search(search)
  if search
     where('id_number LIKE ?', "%#{search}%")
  else
    all
  end
end
end
