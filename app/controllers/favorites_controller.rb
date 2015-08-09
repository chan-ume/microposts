class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @micropost = Micropost.find(params[:favoritepost_id])
        current_user.favor(@micropost)
    end
    
    def destroy
        @micropost = current_user.favorite_relations.find(params[:id]).favoritepost
        current_user.unfavor(@micropost)
    end
end
