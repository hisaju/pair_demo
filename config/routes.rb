Rails.application.routes.draw do
  root 'pairs#index'
  get '/', to: 'pairs#index', as: 'pairs'
  get 'show', to: 'pairs#show', as: 'pair'
  post 'upload', to: 'pairs#upload', as: 'upload_pairs'
end
