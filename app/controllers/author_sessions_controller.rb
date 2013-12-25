class AuthorSessionsController < ApplicationController
  # rendering the related form
  def new
  end

  # accepts the submission of the form
  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(articles_path, message: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, message: 'Logged out!')
  end
end
