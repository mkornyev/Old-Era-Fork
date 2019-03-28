json.extract! resource, :id, :name, :startDate, :endDate, :phone, :email, :address, :image, :desc, :webpage, :created_at, :updated_at
json.url resource_url(resource, format: :json)
