class HomeController < ApplicationController

  def gem_test

    redirect_to TwitterAuthenticate.login_to_twitter_account
  end

  def callback
    user = TwitterAuthenticate.twitter_callback(params)
    @user = User.create_from_provider_data(user , 'twitter')
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end
end
