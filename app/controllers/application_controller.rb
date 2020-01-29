# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_404

  def handle_404
    render text: 'Are you sure you create your Link first?', status: '404'
  end
end
