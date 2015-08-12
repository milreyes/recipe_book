class RecipesController < ApplicationController
	before_action :all_recipes, only: [:index, :create]
	before_action :set_recipe, only: [:show, :destroy, :update]
	respond_to :html, :js

	def index
	end

	def new
		@recipe = Recipe.new

		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@recipe = Recipe.create(recipe_params)
		respond_to do |format|
			format.js { render :create }
			# format.js do
			# 	if @recipe.valid?
			# 	else
			# 	end
			# end

			# if @recipe.save
			# 	format.html { redirect_to recipes_url }
			# 	format.js
			# 	format.json { render action: 'show', status: :created, location: @recipe }
			# 	redirect_to 'index'
			# else
			# 	format.html {render action: 'new' }
			# 	# format.json { render json: @recipe.errors, status :unprocessable_entity }
			# end
		end
	end

	def show
	end

	private
		def all_recipes
			@recipes = Recipe.all
		end

		def recipe_params
			params.require(:recipe).permit(:title, :description, :ingredients, :instructions)
		end

		def set_recipe
			@recipe = Recipe.find(params[:id])
		end

end
