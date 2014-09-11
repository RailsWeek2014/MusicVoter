Rails.application.routes.draw do

  #joined_users
  get "joined_users/joined" => "joined_users#joined", as: "joined"

  #moderators
  get "moderators/playlist_moderators/:playlist_id" => "moderators#playlist_moderators", as: "playlist_moderators"
  post "moderators/create" => "moderators#create"
  get "moderators/destroy/:id" => "moderators#destroy", as: "destroymoderator"

  #vote_track
  get "vote_track/:user_id/:track_id" => "vote_tracks#create", as: "voting"

  #player
  get "players/choice/:playlist_id" => "players#choice", as: "choice"
  post "players/set_votes" => "players#set_votes", as: "set_votes"
  get "player/play/:playlist_id" => "players#play", as: "playmusic"
  get "players/:playlist_id/:dj_id" => "players#set_dj", as: "set_dj"
  #tracks
  get "tracks/destroy/:id" => "tracks#destroy", as: "destroytrack"
  get "tracks/suggest/:title/:youtube_id/:playlist_id" => "tracks#suggest", as: "suggest"
  get "tracks/accept/:id" => "tracks#accept", as: "accept"

  #users
  devise_for :users

  #playlist
  get "playlists/waitlist/:id" => "playlists#waitlist", as: "waitlist"
  get "playlists/tracklist/:id" => "playlists#tracklist", as: "tracklist"
  get "playlists/top5/:id" => "playlists#top5", as: "top5"
  post "playlists/list_tracks" => "playlists#list_tracks"
  get "playlists/list_tracks/:id" => "playlists#list_tracks", as: "list_tracks"
  resources :playlists


  #home
  root to: "pages#home", as: "root"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
