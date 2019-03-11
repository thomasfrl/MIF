json.extract! ticket, :id, :object, :category, :content, :status, :user_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
