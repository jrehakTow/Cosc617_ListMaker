json.array!(@items) do |item|
  json.extract! item, :id, :name, :quantity, :list_id
  json.url item_url(item, format: :json)
end
