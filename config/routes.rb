Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Subdomain troca o www por api, path troca o /api por outra nome do namespace ex: api.sites.com/controle...
  namespace :api, defaults: { format: :json }, constraints: {subdomain: 'api'}, path: "/" do

  end

end
