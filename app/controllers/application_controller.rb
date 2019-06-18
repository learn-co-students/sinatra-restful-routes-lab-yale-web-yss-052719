require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    #binding.pry
    redirect to ('/recipes')
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
   #binding.pry
    @recipe.update(name: params[:name],ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to ("/recipes/#{@recipe.id}")
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name],ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to ("/recipes/#{@recipe.id}")
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id/edit' do
    #binding.pry
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  

end
