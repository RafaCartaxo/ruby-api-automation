# frozen_string_literal: true

# rubocop:enable

class CommunicationApi
  def build_post(data, url_api)
    HTTParty.post(url_api,
                  body: data.to_json)
  end

  def build_get(url_api)
    HTTParty.get(url_api)
  end

  def build_put(data, url_api)
    HTTParty.put(url_api,
                 body: data.to_json)
  end

  def build_patch(url_api)
    HTTParty.patch(url_api)
  end

  def build_delete(url_api)
    HTTParty.delete(url_api)
  end
end