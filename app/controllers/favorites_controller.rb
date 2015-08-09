class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @favoritepost = Micropost.find(params[:favoritepost_id])
        current_user.favor(@favoritepost)
    end
    
    def destroy
        @favoritepost = current_user.favorite_relations.find(params[:id]).favoritepost
        current_user.unfavor(@favoritepost)
    end
end
