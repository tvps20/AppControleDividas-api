require 'api_version_constraint'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Subdomain troca o www por api, path troca o /api por outra nome do namespace ex: api.sites.com/controle...
  namespace :api, defaults: { format: :json }, constraints: {subdomain: 'api'}, path: "/" do
    namespace :v1, path: "/", constraints: ApiVersionConstraint.new(version: 1, default: true) do

    end
  end


end
