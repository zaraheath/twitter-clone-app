module Api
  module V1
    class BaseController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

      private

      def record_not_found
        render json: { error: "not_found" }, status: :not_found
      end

    end
  end
end