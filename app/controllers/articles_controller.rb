class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end




    private
  def articles_params
   params.require(:article).permit(:title, :body)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
