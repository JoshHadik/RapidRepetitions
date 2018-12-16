class Api::V1::ApiController < ApplicationController
  def json_response(resource)
    render json: resource
  end
end
