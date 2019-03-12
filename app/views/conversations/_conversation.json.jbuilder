json.extract! conversation, :id, :user_one_id, :user_two_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
