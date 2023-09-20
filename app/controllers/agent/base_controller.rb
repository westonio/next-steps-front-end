class Agent::BaseController < ApplicationController

  def require_agent
    render file: "/public/404.html" unless current_agent?
  end
end