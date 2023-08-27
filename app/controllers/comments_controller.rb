# frozen_string_literal: true

# The CommentsController handles user interactions related to comments on various content.
# It provides actions for creating, reading, updating, and deleting comments.
# This controller communicates with the Comment model and ensures proper association between
# comments and the content they are related to.
class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'nguyenduong', password: 'nguyenduong', only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
