# @consult_users
Quando('faco uma requisicao do tipo GET para Users') do
  @request_consult_users = build_data.consult_users
end

Entao('devo receber body listando usuarios cadastrados juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_consult_users.code).to eql codigo_esperado
  expect(@request_consult_users.parsed_response).to be_an(Array)
  expect(@request_consult_users[0]["firstName"]).not_to be_nil
  expect(@request_consult_users[0]["lastName"]).not_to be_nil
  expect(@request_consult_users.parsed_response).to all(include("firstName", "lastName", "birthdate", "id"))
  puts "##Lista de usuários retornada com sucesso!##"
end

# @valid_user
Dado('que tenho dados validos para cadastrar um usuario') do
  @create_valid_user = build_data.create_valid_users
end

Quando('faco uma requisicao do tipo POST para Users com dados validos') do
  @request_valid_user = build_data.users(@create_valid_user)
end

Entao('devo receber body do usuario cadastrado juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_valid_user.code).to eql codigo_esperado
  $id_user = @request_valid_user['id']
  puts "##Usuário criado com sucesso! ID do usuário: #{$id_user}##"
end

# @invalid_user
Dado('que tenho dados invalidos para cadastrar um usuario') do
  @create_invalid_user = build_data.create_invalid_users
end

Quando('faco uma requisicao do tipo POST para Users com dados invalidos') do
  @request_invalid_user = build_data.users(@create_invalid_user)
end

Entao('devo receber response informando erro juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_invalid_user.code).to eql codigo_esperado
  expect(@request_invalid_user.body).to include("Payload Too Large")
  puts "##Erro esperado recebido: #{@request_invalid_user.body}##"
end

# @update_valid_user
Dado('que tenho dados validos para atualizar usuario existente') do
  @upload_valid_user = build_data.update_valid_users
end

Quando('faco uma requisicao do tipo PUT para o usuario com dados validos') do
  @request_update_valid_user = build_data.update_users(@upload_valid_user)
end

Entao('devo receber body do usuario atualizado juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_update_valid_user.code).to eql codigo_esperado
  expect(@request_update_valid_user['id']).to eql $id_user
  puts "##Usuário atualizado com sucesso! ID do usuário: #{$id_user}##"
end

# @delete_valid_user
Quando('faco uma requisicao do tipo DELETE para o usuario cadastrado') do
  @delete_valid_user = build_data.delete_valid_users
end

Entao('devo receber body do usuario excluido juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@delete_valid_user.code).to eql codigo_esperado
  expect(@delete_valid_user['id']).to eql $id_user
  puts "##Usuário excluído com sucesso! ID do usuário: #{$id_user}##"
end

# @delete_invalid_user
Quando('faco uma requisicao do tipo DELETE para usuario nao cadastrado') do
  @delete_invalid_user = build_data.delete_invalid_users
end

Entao('devo receber response informando erro ao deletar juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@delete_invalid_user.code).to eql codigo_esperado
  expect(@delete_invalid_user.body).to include("Not found")
  puts "##Erro esperado recebido: #{@delete_invalid_user.body}##"
end
