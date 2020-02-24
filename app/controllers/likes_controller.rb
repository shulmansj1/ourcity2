class LikesController < ApplicationController
  def index
    @likes = Like.all

    render("like_templates/index.html.erb")
  end

  def show
    @like = Like.find(params.fetch("id_to_display"))

    render("like_templates/show.html.erb")
  end

  def new_form
    @like = Like.new

    render("like_templates/new_form.html.erb")
  end

  def create_row
    @like = Like.new

    @like.fan_id = params.fetch("fan_id")
    @like.article_id = params.fetch("article_id")

    if @like.valid?
      @like.save

      redirect_back(:fallback_location => "/likes", :notice => "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @like = Like.find(params.fetch("prefill_with_id"))

    render("like_templates/edit_form.html.erb")
  end

  def update_row
    @like = Like.find(params.fetch("id_to_modify"))

    @like.fan_id = params.fetch("fan_id")
    @like.article_id = params.fetch("article_id")

    if @like.valid?
      @like.save

      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
    else
      render("like_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_fan
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/users/#{@like.fan_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_article
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/articles/#{@like.article_id}", notice: "Like deleted successfully.")
  end

  def destroy_row
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/likes", :notice => "Like deleted successfully.")
  end
end
