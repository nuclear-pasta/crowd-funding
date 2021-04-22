# frozen_string_literal: true

module Api
  module V1
    # Abstract class that implements the basic utilities
    # for an API controller (not found, errors etc.)
    class BaseController < ApplicationController
      around_action :handle_errors

      def handle_errors
        yield
      rescue ActionController::ParameterMissing
        head :bad_request
      rescue ActiveRecord::RecordNotFound
        head :not_found
      rescue ActiveRecord::RecordInvalid => e
        response = ErrorsBlueprint.render_as_hash(e.record)
        render_api_error(errors: response, code: :unprocessable_entity)
      end

      protected

      def render_api_error(errors:, code:)
        data = { errors: errors }
        render json: data, status: code
      end

      def all_ok
        head 200
      end

      def raise_not_found
        raise ActiveRecord::RecordNotFound
      end
    end
  end
  end
