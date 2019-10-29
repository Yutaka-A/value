class InstallsController < ApplicationController
    
    def create
        @install = Install.new(
            user_id: @current_user.id,
            post_id: params[:post_id],
            )
        @install.save
        redirect_to("/posts/#{params[:post_id]}")
    end
    
    def destroy
        @install = Install.find_by(
            user_id: @current_user.id,
            post_id: params[:post_id],
            )
        @install.destroy
        redirect_to("/posts/#{params[:post_id]}")
        
    end
end