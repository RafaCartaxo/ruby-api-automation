# frozen_string_literal: true

# rubocop:enable

class CommunicationApi

  def request_header
    {
      'Content-Type' => 'application/json'
    }
  end

  def build_post(data, url_api)
    HTTParty.post(url_api,
                  body: data.to_json,
                  headers: request_header)
  end

  def build_get(url_api)
    HTTParty.get(url_api)
  end

  def build_put(data, url_api)
    HTTParty.put(url_api,
                 body: data.to_json,
                 headers: request_header)
  end

  def build_patch(url_api)
    HTTParty.patch(url_api,
                   request_header)
  end

  def build_delete(url_api)
    HTTParty.delete(url_api,
                    request_header)
  end
end