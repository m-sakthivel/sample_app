module API
  module V1
    class Employees < Grape::API
      version 'v1'
      format :json

      resource :employees do
        desc "Return list of authors"
        get do
          Employees.all
        end
      end
    end
  end
end