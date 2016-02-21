class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    if favorite.save
      redirect_to [@post.topic, @post], notice: "Favorite was saved"
    else
      flash[:error] = "There was an error."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite
    if favorite.destroy
      flash[:success] = "Favorite was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Favorite couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end
end
