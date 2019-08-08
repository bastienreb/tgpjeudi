class UserController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city], age: params[:age], description: params[:description], password: params[:password])
      if @user.save
        redirect_to gossip_index_path
      else
        render user_new_path
      end
  end

end

