Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]

end
