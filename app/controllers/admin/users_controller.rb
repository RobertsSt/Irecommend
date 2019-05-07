module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin!
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    # GET /users.json
    def authorize_admin!
      if current_user.admin == false
        redirect_to root_path
      end
    end

    def index
      @users = User.all
    end

    def tweets
      @tweets = Tweets.all
    end


    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_back fallback_location: root_path, notice: 'Lietotājs tika veiksmīgi rediģēts.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'Lietotājs tika izdzēsts.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        _user_params = params.require(:user).permit(:name, :username, :password, :bio, :avatar, :email, :admin)
        if _user_params[:password].blank?
          _user_params.delete("password")
        end
        _user_params
      end
  end
end
