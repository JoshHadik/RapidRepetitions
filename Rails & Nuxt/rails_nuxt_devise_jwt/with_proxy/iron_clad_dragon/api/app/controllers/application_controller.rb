class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json
  
  def render_json(resource)
    render json: resource
  end
end
