class LikesController < ApplicationController
    before_action :set_post
    def create
        @post.likes.create(user: current_user)
        render turbo_stream: turbo_stream.replace("like-section-#{@post.id}", partial: "posts/like_section", locals: {post: @post})
    end

    def destroy
        @post.likes.find_by(user: current_user)&.destroy
        render turbo_stream: turbo_stream.replace("like-section-#{@post.id}", partial: "posts/like_section", locals: {post: @post})
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
end
