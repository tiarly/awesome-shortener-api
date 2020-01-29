# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def handle_not_found
    render text: 'Are you sure you create your Link first?', status: '404'
  end
end
