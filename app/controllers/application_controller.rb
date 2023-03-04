class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'
  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: { baked_goods: { only: [:name, :price] } })
  end
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.order(price: :desc)
    baked_goods.to_json
  end
  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.order(price: :desc).first
    baked_good.to_json
  end
end
