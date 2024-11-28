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

  def create_users
    data = load_data_file('user')
    data['firstName'] = first_name
    data['lastName'] = last_name
    data
  end

  def users(data)
    url_users = load_env_file['url']['url_users']
    request = build_post(data, url_users)
    p request
  end

end