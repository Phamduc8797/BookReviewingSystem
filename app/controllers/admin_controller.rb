class AdminController < ApplicationController
  def manage_user
    @manage_users = User.page(params[:page]).per Settings.per_page
  end
end
