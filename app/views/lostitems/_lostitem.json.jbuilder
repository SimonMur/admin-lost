json.extract! lostitem, :id, :type_id, :name, :id_number, :pp_number, :reg_number, :other_number, :date_of_birth, :county_id, :location, :date_found, :description, :user_id, :created_at, :updated_at
json.url lostitem_url(lostitem, format: :json)
