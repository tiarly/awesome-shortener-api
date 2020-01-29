# frozen_string_literal: true

module Api
  module V1
    class ShortenerLinksController < ApplicationController
      def create
        link = ShortenerLink.new(create_params)

        if ::ShortenerLinks::Creator.call(link)
          render json: ShortenerLinkSerializer.new(link).attributes
        else
          render json: { errors: { **link.errors } }, status: :unprocessable_entity
        end
      end

      def show
        link = ::ShortenerLinks::Finder.call(params[:token])
        redirect_to link.original_url
      end

      private

      def create_params
        params.require(:shortener_link).permit(:original_url)
      end
    end
  end
end
