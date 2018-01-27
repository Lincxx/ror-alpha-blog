class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #puts params.inspect
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Artilce was successfully update"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      #class the new template
      render 'new'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path(@article)
  end

  private 
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end