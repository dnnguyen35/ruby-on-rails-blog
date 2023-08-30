# frozen_string_literal: true

# The ArticlesController handles all interactions related to the Article model.
# It provides actions for creating, reading, updating, and deleting articles.
# This controller communicates with the Article model and renders views to display article-related content to users.
class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'nguyenduong', password: 'nguyenduong', except: %i[index show]
  def index
    require 'pagy/extras/bootstrap'
    @pagy, @articles = pagy(Article.all, items: 1, size: [2, 2, 2, 2])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
