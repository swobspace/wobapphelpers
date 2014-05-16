class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  def index
    @blogs = Blog.all
    respond_with(@blogs)
  end

  # GET /blogs/1
  def show
    respond_with(@blog)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    respond_with(@blog)
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    @blog.save
    respond_with(@blog)
  end

  # PATCH/PUT /blogs/1
  def update
    @blog.update(blog_params)
    respond_with(@blog)
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    respond_with(@blog)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:subject, :body, :user, :release)
    end
end
