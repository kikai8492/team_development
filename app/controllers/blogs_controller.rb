class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを投稿しました"
    else
      render :new, notice: "投稿に失敗しました"
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.save
      redirect_to blogs_path, notice: "ブログを編集しました"
    else
      render :new, notice: "編集に失敗しました"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "ブログが削除されました"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
