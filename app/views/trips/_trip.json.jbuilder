json.extract! trip, :id, :correspondance_id, :host_id, :duration, :start_date, :created_at, :updated_at
json.url trip_url(trip, format: :json)
