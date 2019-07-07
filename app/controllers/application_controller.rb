class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

   # INDEX
   get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # NEW
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :new
  end

  # CREATE
  post '/recipes' do
    @recipe = Recipe.create(recipe_params)
    redirect_to '/recipes'
  end

  # SHOW
  get '/recipes/:id' do
    find_art
    erb :show
  end

  # EDIT

  get '/recipes/:id/edit' do
    find_art
    erb :edit
  end

  # UPDATE
  patch '/recipes/:id' do
    find_art
    @recipe.update(recipe_params)
    redirect_to '/recipes/:id'
  end

  # DELETE
  delete '/recipes/:id' do
    find_art
    @recipe.delete
    redirect_to '/recipes'
  end 

  private

  def find_art
    @recipe = Recipe.find(params[:id])
  end


  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :cook_time)
  end

end
