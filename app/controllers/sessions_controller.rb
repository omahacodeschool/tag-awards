class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]
  skip_before_action :not_logged_in?

  def new
  end

  def create
    session = Session.new(params[:session])

   if session.valid?
     log_in(session.user)
     params[:session][:remember_me] == '1' ? remember(session.user) : forget(session.user)
     redirect_to user_plays_path(session.user)
   else
     flash.now[:danger] = session.error_summary
     render 'new'
   end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

end
