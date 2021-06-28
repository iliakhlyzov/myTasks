class ProjectController < ApplicationController
  def index
    render json: { "message": "OK" }
  end
end
