class ApplicationController < Sinatra::Base

  belongs_to :bakery
  has_many :baked_goods

  # add routes

    get '/bakeries' do
      content_type 'application/json'
      bakeries = Bakery.all
      bakeries.to_json
    end
  
    get '/bakeries/:id' do
      content_type 'application/json'
      bakery = Bakery.find(params[:id])
      bakery.to_json(include: :baked_goods)
    end
  end
  
