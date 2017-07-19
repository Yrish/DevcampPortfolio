class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_page_title, only: [:show, :edit, :update]
  access all: [:show, :index, :topic_search], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all
  layout "blog"

  # GET /blogs
  # GET /blogs.json
  def index
    if logged_in?(:site_admin)
      @blogs = Blog.set_order.page(params[:page]).per(5)
    else
      @blogs = Blog.published.set_order.page(params[:page]).per(5)
    end
    @page_title = "#{@name} | Blogs"
    @topics = Topic.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    
    if ! logged_in?(:site_admin) && @blog.status == "draft"
      flash[:alert] = "You are not allowed to view that blog"
      redirect_to blogs_path
    end
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @page_title = "#{@name} | New Blog"
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def topic_search
    if logged_in?(:site_admin)
      @blogs = Topic.friendly.find(params[:id]).blogs.set_order.page(params[:page]).per(5)
    else
      @blogs = Topic.friendly.find(params[:id]).blogs.published.set_order.page(params[:page]).per(5)
    end
    puts @blogs
    render :index
    @topics = Topic.all
  end


  def toggle_status
    if @blog.draft?
      @blog.published!
    else
      @blog.draft!
    end
    redirect_to blogs_url, notice: "Post status has been updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id)
    end
    
    def set_page_title
      @page_title = "#{@name} | #{@blog.title}"
    end
end
