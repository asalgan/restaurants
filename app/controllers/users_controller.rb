class UsersController < ApplicationController
  # before_action :authenticate_passcode

  # PASSCODE = "feed me"

  # def create_user
  #   user = User.create(api_key: SecureRandom.base64(32))
  #   render text:
  # end


  # private

  #   def authenticate_passcode
  #     authenticate || reject
  #   end

  #   def authenticate
  #     params[:passcode] == PASSCODE
  #   end

  #   def reject
  #     self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
  #     render json: 'Bad credentials', status: :unauthorized
  #   end

end
