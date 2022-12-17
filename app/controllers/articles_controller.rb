# frozen_string_literal: true

class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = 'Article was successfully updated'
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

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
