class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    
    @fls = Follow.select('following_id').where(:user_id => current_user.id, :status => true)
    @blgs = Array.new
    @fls.each do |blg|
      @blgs = Blog.where(:user_id => blg.following_id)
    end
    @blogs = Blog.all
    respond_with(@blogs)
  end

  def show
    respond_with(@blog)
  end

  def new
    @blog = Blog.new
    respond_with(@blog)
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.save
    respond_with(@blog)
  end

  def update
    @blog.update(blog_params)
    respond_with(@blog)
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
