Rails.application.routes.draw do
  root to: 'index#index'

  get '/' => 'index#index', as: 'index'
  get '/:trap_id/requests/:id' => 'index#show_single', as: 'show_single'
  get '/:trap_id/requests' => 'index#show_group', as: 'show_group'
  match '/:trap_id(/:requested_url)' => 'index#url_catcher', :requested_url => /.*/, as: 'url_catcher', via: [:get, :head, :post, :patch, :put, :delete, :options]

  mount ActionCable.server => '/cable'
end
