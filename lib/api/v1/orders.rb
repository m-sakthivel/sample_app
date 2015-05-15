module API
  module V1
    class Orders < Grape::API
      version 'v1'
      format :json

      resource :orders do
        desc "Return list of recent posts"
        get do
          Orders.all
        end
      end
    end
  end
end