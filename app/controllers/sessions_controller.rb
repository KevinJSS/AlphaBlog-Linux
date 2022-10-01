class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        respond_to do |format|
            if @user && @user.authenticate(params[:session][:password])
                session[:user_id] = @user.id
                format.html { redirect_to @user, notice: "You have successfully logged in!" }
                format.json { render :show, status: :created, location: @user }
            else
                @user = nil # This is to tell the view that the user was not authenticated because of wrong password.
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        #byebug
        session[:user_id] = nil
        respond_to do |format|
            format.html { redirect_to root_path, notice: "You have successfully logged out!" }
            format.json { head :no_content }
        end
    end
end