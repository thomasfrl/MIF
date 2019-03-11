json.extract! flat, :id, :user_id, :adress, :description, :has_wifi, :created_at, :updated_at
json.url flat_url(flat, format: :json)
