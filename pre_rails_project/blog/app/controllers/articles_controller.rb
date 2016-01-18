class ArticlesController < ApplicationController
	def index
	@article = Article.all 
	end
	def new
		@article = Article.new 
	end
	def create
	@article = Article.new(validation_syntax)
		if @article.save 
			redirect_to @article
		else 
			render 'new'
		end
	end
	def show 
	@article = Article.find(params[:id])
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end
	def update 
		@article = Article.find(params[:id])
		if @article.update(validation_syntax)
			redirect_to @article
		else
			render 'edit'
		end
	end
	def edit
		@article = Article.find(params[:id]) 
	end
	private 
	def validation_syntax 
		 params.require(:article).permit(:title,:text)
	end
end
