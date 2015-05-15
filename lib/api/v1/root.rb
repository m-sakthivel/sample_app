module API
  module V1
    class Root < Grape::API
     # prefix 'api'
      mount API::V1::Orders
      mount API::V1::Employees
    end
  end
end