module LoadFile
  def load_env_file
    YAML.load_file("#{Dir.pwd}/features/support/config/#{ENV['ENVIRONMENT_TYPE']}.yml")
  end

  def load_data_file(nome_arquivo)
    data_file = File.read("#{Dir.pwd}/features/support/data#{nome_arquivo}.json")
    JSON.parse(data_file)
  end
end
