class WelcomeController < ApplicationController
	before_action :authenticate_admin!, only: [:dashboard]

	def dashboard
		user = params[:user_search]
		category = params[:category_search]

		@articleas = Article.paginate(page: params[:articles_page], per_page: 5).search(params[:article_search])
		@useras = User.paginate(page: params[:users_page], per_page: 1).search(user)
		@categorieas = Category.paginate(page: params[:categories_page], per_page: 5).search(category)
		@article = Article.new
	end
end