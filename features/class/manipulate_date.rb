require 'faker'
require_relative "#{Dir.pwd}/features/class/communication_api.rb"
require_relative "#{Dir.pwd}/features/class/manipulate_date.rb"
require_relative "#{Dir.pwd}/features/support/load_file.rb"
require_relative "#{Dir.pwd}/features/support/log.rb"

Faker::Config.locale = 'pt-BR'

class ManipulateDate < CommunicationApi
  include Log
  include LoadFile
  include Utils

  def consult_users
    url_consult_users = load_env_file['url']['url_users']
    request = build_get(url_consult_users)
    log_error_request(request)
    p request
  end

  def users(data)
    url_users = load_env_file['url']['url_users']
    request = build_post(data, url_users)
    log_error_request(request)
    p request
  end

  def create_valid_users
    data = load_data_file('user')
    data['firstName'] = first_name
    data['lastName'] = last_name
    data['birthdate'] = birthdate
    data
  end

  def create_invalid_users
    data = load_data_file('user')
    data['firstName'] = "A".ljust(1000000, "A")
  end

  def update_users(data)
    url_update_users = load_env_file['url']['url_update_users']
                         .gsub('{id_user}', $id_user.to_s)
    request = build_put(data, url_update_users)
    log_error_request(request)
    p request
  end

  def update_valid_users
    data = load_data_file('user')
    data['firstName'] = 'João'
    data['lastName'] = 'Teste'
    data
  end

  def delete_valid_users
    url_delete_users = load_env_file['url']['url_update_users']
                         .gsub('{id_user}', $id_user.to_s)
    request = build_delete(url_delete_users)
    log_error_request(request)
    p request
  end

  def delete_invalid_users
    url_delete_users = load_env_file['url']['url_update_users']
                         .gsub('{id_user}', numbers.to_s)
    request = build_delete(url_delete_users)
    log_error_request(request)
    p request
  end
end