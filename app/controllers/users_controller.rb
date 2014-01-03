class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @my_public_facts = Fact.where(user_id: current_user.id).where(private_fact: false)
    @my_private_facts = Fact.where(user_id: current_user.id).where(private_fact: true)
  end

end
