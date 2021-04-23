# frozen_string_literal: true

module Api
  module V1
    # Abstract class that implements the basic utilities
    # for an API controller (not found, errors etc.)
    class BaseController < ApplicationController
      rescue_from StandardError, with: :handle_error

      def handle_error(e)
        case e.class.to_s
        when "ActiveRecord::RecordNotFound"
          head :not_found
        else
         head :bad_request
        end
      end

    end
  end
  end
