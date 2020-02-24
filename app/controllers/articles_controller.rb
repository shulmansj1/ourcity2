class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    render("article_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @article = Article.find(params.fetch("id_to_display"))

    render("article_templates/show.html.erb")
  end

  def new_form
    @article = Article.new

    render("article_templates/new_form.html.erb")
  end

  def create_row
    @article = Article.new

    @article.restaurant_yelp_id = params.fetch("restaurant_yelp_id")
    @article.author_name = params.fetch("author_name")
    @article.city = params.fetch("city")
    @article.date_published = params.fetch("date_published")
    @article.image_address = params.fetch("image_address")
    @article.publication = params.fetch("publication")
    @article.title = params.fetch("title")
    @article.webaddress = params.fetch("webaddress")

    if @article.valid?
      @article.save

      redirect_back(:fallback_location => "/articles", :notice => "Article created successfully.")
    else
      render("article_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @article = Article.find(params.fetch("prefill_with_id"))

    render("article_templates/edit_form.html.erb")
  end

  def update_row
    @article = Article.find(params.fetch("id_to_modify"))

    @article.restaurant_yelp_id = params.fetch("restaurant_yelp_id")
    @article.author_name = params.fetch("author_name")
    @article.city = params.fetch("city")
    @article.date_published = params.fetch("date_published")
    @article.image_address = params.fetch("image_address")
    @article.publication = params.fetch("publication")
    @article.title = params.fetch("title")
    @article.webaddress = params.fetch("webaddress")

    if @article.valid?
      @article.save

      redirect_to("/articles/#{@article.id}", :notice => "Article updated successfully.")
    else
      render("article_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @article = Article.find(params.fetch("id_to_remove"))

    @article.destroy

    redirect_to("/articles", :notice => "Article deleted successfully.")
  end
end
