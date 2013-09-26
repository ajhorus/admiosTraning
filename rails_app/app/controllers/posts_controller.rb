class PostsController < ApplicationController
  respond_to :json
  def create
    res = Twitter.update(params['post']['body'])    
    render :layout => false
  end
end
