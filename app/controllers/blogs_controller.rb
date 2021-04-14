class BlogsController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index] #show,indexアクション以外はログイン状態か確認する

  def index
    @blogs = Blog.published #status =publishedのみ表示　blogモデルにてenmu型として定義した
    # @blogs = Blog.where(status: :published) ↑と同意義
    @tags = Blog.tag_counts_on(:tags) #全タグ取得 tags_on(:tags) gem メソッド
    if @tag = params[:tag] #タグ検索用
      @blog = Blog.tagged_with(params[:tag]) #タグに紐付く投稿
    end
  end

  def confirm
    @blogs = Blog.draft #同index
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.admin_id = current_admin.id
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
    redirect_to confirm_blogs_path
  end


  private
  def blog_params
    params.require(:blog).permit(:content, :title, :image, :status, :tag_list)
  end
end