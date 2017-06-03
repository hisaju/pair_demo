Rails.application.routes.draw do
  root 'pairs#index'
  get '/', to: 'pairs#index', as: 'pairs'

  resources :pairs, only: [:index]
  # ここにmoviesのindex,new,createアクションのroutesを書こう！
end
