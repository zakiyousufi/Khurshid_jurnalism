class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.all

    render json: posts, status: :ok
  end

  # GET /posts/1
  def show
    post = Post.find(params[:id])

    if post
      render json: post, status: :ok
    else
      render json: post.errors, status: :bad_request
    end
  end

  # POST /posts/1/rservation
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: {
        status: { success: true, message: 'Post created successfully' }
      }
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: { success: true, message: 'post deleted successfully' }, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :image)
  end
end
