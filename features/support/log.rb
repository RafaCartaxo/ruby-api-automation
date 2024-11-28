module Log
  def log_error_request(response)
    sleep 1

    if response.code >= 500
      p "Método HTTP: #{response.request.http_method.to_s.split('::').last.upcase}"
      p "URI: #{response.request.uri}"
      p "Código de response: #{response.code}"
      p "#{response.code} - PROVAVEL PROBLEMA DE AMBIENTE."
    elsif response.code >= 400
      p "Método HTTP: #{response.request.http_method.to_s.split('::').last.upcase}"
      p "URI: #{response.request.uri}"
      p "Código de response: #{response.code}"
      p "Cabeçalho da requisição: #{response.request.options[:headers]}"
      p "Corpo da requisição: #{response.request.raw_body}"
      puts "Body: #{JSON.pretty_generate(response.parsed_response)}"
    end
  end
end