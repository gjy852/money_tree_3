Rails.application.routes.draw do
  # Routes for the Asset_type resource:
  # CREATE
  get "/asset_types/new", :controller => "asset_types", :action => "new"
  post "/create_asset_type", :controller => "asset_types", :action => "create"

  # READ
  get "/asset_types", :controller => "asset_types", :action => "index"
  get "/asset_types/:id", :controller => "asset_types", :action => "show"

  # UPDATE
  get "/asset_types/:id/edit", :controller => "asset_types", :action => "edit"
  post "/update_asset_type/:id", :controller => "asset_types", :action => "update"

  # DELETE
  get "/delete_asset_type/:id", :controller => "asset_types", :action => "destroy"
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get "/users/new", :controller => "users", :action => "new"
  post "/create_user", :controller => "users", :action => "create"

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
  get "/users/:id/edit", :controller => "users", :action => "edit"
  post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
  get "/delete_user/:id", :controller => "users", :action => "destroy"
  #------------------------------

  # Routes for the Net_worth resource:
  # CREATE
  get "/net_worths/new", :controller => "net_worths", :action => "new"
  post "/create_net_worth", :controller => "net_worths", :action => "create"

  # READ
  get "/net_worths", :controller => "net_worths", :action => "index"
  get "/net_worths/:id", :controller => "net_worths", :action => "show"

  # UPDATE
  get "/net_worths/:id/edit", :controller => "net_worths", :action => "edit"
  post "/update_net_worth/:id", :controller => "net_worths", :action => "update"

  # DELETE
  get "/delete_net_worth/:id", :controller => "net_worths", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
