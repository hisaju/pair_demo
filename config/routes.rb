Rails.application.routes.draw do
  root 'pairs#index'
  get '/', to: 'pairs#index', as: 'pairs'
  get 'show', to: 'pairs#show', as: 'pair'
  post 'upload', to: 'pairs#upload', as: 'upload_pairs'

  get 'telephones', to: 'telephones#index', as: 'telephones'
  post 'call', to: 'telephones#call', as: 'call'
  post 'record', to: 'telephones#record', as: 'record'
end
