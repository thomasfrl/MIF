json.extract! trip, :id, :start_date, :duration, :correspondance_id, :host_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
