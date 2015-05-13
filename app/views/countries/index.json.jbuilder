json.array!(@countries) do |country|
  json.extract! country, :id, :country_name
  json.url country_url(country, format: :json)
end
