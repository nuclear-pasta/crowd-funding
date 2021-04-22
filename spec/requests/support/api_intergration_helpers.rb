# frozen_string_literal: true

require 'uri'
require 'json'

module ApiIntegrationHelpers
  def api_post(url, payload: {})
    post api_url(url), params: payload.to_json, headers: api_headers
  end

  def api_put(url, payload: {})
    put api_url(url), params: payload.to_json, headers: api_headers
  end

  def api_get(url, payload: {})
    get api_url(url), params: payload, headers: api_headers
  end

  def api_patch(url, payload: {})
    patch api_url(url), params: payload.to_json, headers: api_headers
  end

  def api_delete(url, payload: {})
    delete api_url(url), params: payload.to_json, headers: api_headers
  end

  def api_url(path)
    path.start_with?('/') ? path : "/#{path}"
  end

  def parsed_body
    response.body ? JSON.parse(response.body) : nil
  end

  private

  def api_headers
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end
end
