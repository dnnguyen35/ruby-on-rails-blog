# frozen_string_literal: true

# The ArticlesController handles all interactions related to the Article model.
# It provides actions for creating, reading, updating, and deleting articles.
# This controller communicates with the Article model and renders views to display article-related content to users.
class ArticlesController < ApplicationController
  require 'pagy/extras/bootstrap'

  http_basic_authenticate_with name: 'nguyenduong', password: 'nguyenduong', except: %i[index show]

  before_action :set_article, only: %i[show edit update destroy]

  def index
    @pagy, @articles = pagy(Article.all, items: 5)
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

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
