Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graph", graphql_path: "graph#index"
  end
  
  post "/graph", to: "graph#index"
end
