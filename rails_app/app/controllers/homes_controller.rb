class HomesController < ApplicationController
  protect_from_forgery
  before_filter :load_tweets
  
  def index
    @authentication = Authentication.where(:user_id => current_user.id) 
    if @authentication.count <= 0
      render "_twee"
    end
  end

  def load_tweets
    @authentications = Authentication.all
    @tweets = Twitter.user_timeline[0..5]
  end

  def admin_user
    arr = Array.new()

    User.all.each do |user|
      temp_arr = Array.new()
      exits = Authentication.where(:user_id => user.id)
      value = (exits.count <=  0)? "": Authentication.find(user.id)
      temp_arr << user << value
      arr << temp_arr

    end
    @users = arr
  end

   def destroy_user
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to "/homes/admin_user" }
      format.json { head :ok }
    end
  end
end
