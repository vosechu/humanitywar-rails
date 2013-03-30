HumanitywarRails::Application.routes.draw do
  match 'static/:action', :controller => "static"

  resources :entries, :only => [:new, :create, :index, :show] do
    collection do
      get 'winning'
      get 'losing'
      get 'newest'
      put 'win'
      put 'draw'
    end
  end

  root :to => 'static#age_gate'
end
