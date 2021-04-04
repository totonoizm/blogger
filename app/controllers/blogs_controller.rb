class BlogsController < ApplicationController
  # before_action = authenticate_user #登録Userのみconfirm,edit,destroy,update

  def index
    @blogs = Blog.published #status =publishedのみ表示　blogモデルにてenmu型として定義した
    # @blogs = Blog.where(status: :published) ↑と同意義
  end

  def confirm
    @blogs = Blog.draft #同index
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    redirect_to blogs_path
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end


  private
  def blog_params
    params.require(:blog).permit(:content, :title, :image, :status)
  end
end