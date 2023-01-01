class SessionsController < ApplicationController
    def new
    end
    def create 
       user=user.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:email][:password])
        session[:user_id]=user.id
        flash[:notoce]="Logged in successfully"
        redirect_to user_path(user)
       else
        flash.now[:danger]="There was something wrong with your information"
        render :new, status: :unprocessable_entity
       end
    end 
    def destroy 
    end
end