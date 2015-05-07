json.array!(@employees) do |employee|
  json.extract! employee, :id, :employee_name, :employee_id, :employee_address
  json.url employee_url(employee, format: :json)
end
