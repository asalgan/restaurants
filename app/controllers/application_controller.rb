class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # before_action :authenticate_user

  private

  def not_found
    return api_error(404, errors: 'Not found')
  end

  def authenticate_user
    authenticate_token || reject_token
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_key: token)
    end
  end

  def reject_token(realm = "Application")
    # self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: { message: 'No soup for you', status: 401 }
  end

  def api_error(status, errors: [])
    render json: { errors: errors, status: status }
  end

end
