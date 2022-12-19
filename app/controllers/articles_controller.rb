# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_articles_with_id, only: %i[edit update show destroy]
  def new
    @article = Article.new
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated'
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity

    end
  end

  def index
    @displayAll = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = 'The article was saved successfully'
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @article.destroy
    flash[:notice] = 'Article deleted!'
    redirect_to article_path
  end

  private

  def set_articles_with_id
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
