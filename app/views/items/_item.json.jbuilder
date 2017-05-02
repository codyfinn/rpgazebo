json.extract! item, :id, :name, :price, :description, :rule_set_id, :created_at, :updated_at
json.url item_url(item, format: :json)
