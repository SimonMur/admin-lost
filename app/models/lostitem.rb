class Lostitem < ApplicationRecord
  belongs_to :type
  belongs_to :county
  belongs_to :user
   mount_uploader :picture_front, PictureUploader
    mount_uploader :picture_back, PictureUploader
 def self.search(search)
  if search
     where('id_number LIKE ?', "%#{search}%")
  else
    all
  end
end
end
