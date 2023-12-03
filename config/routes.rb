Rails.application.routes.draw do
  devise_for :users

  resource :user, only: [:edit, :update]

root "users#index"


  get("/profile", { :controller => "users", :action => "profile" })

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy"})

  post("/insert_photo", { :controller => "photos", :action => "create" })

  post("/update_photo/:modify_id", { :controller => "photos", :action => "update" })

  post("/insert_user", { :controller => "users", :action => "create" })

  post("/update_user/:modify_id", { :controller => "users", :action => "update" })

  post("/insert_comment/:modify_id", { :controller => "photos", :action => "create_comment" })

end
