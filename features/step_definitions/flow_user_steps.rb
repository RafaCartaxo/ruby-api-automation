# @consult_users
Quando('faco uma requisicao do tipo GET para Users') do
  @request_consult_users = build_data.consult_users
end

Então('devo receber body listando usuarios cadastrados juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_consult_users.code).to eql codigo_esperado
end

# @valid_user
Dado('que tenho dados validos para cadastrar um usuario') do
  @create_valid_user = build_data.create_valid_users
end

Quando('faco uma requisicao do tipo POST para Users com dados validos') do
  @request_valid_user = build_data.users(@create_valid_user)
end

Então('devo receber body do usuario cadastrado juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_valid_user.code).to eql codigo_esperado
  $id_user = @request_valid_user['id']
end

# invalid_user
Dado('que tenho dados invalidos para cadastrar um usuario') do
  @create_invalid_user = build_data.create_invalid_users
end

Quando('faco uma requisicao do tipo POST para Users com dados invalidos') do
  @request_invalid_user = build_data.users(@create_invalid_user)
end

Então('devo receber response informando erro juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_invalid_user.code).to eql codigo_esperado
end

# @update_valid_user
Dado('que tenho dados validos para atualizar usuario existente') do
  @upload_valid_user = build_data.update_valid_users
end

Quando('faco uma requisicao do tipo PUT para o usuario com dados validos') do
  @request_update_valid_user = build_data.update_users(@upload_valid_user)
end

Então('devo receber body do usuario atualizado juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_update_valid_user.code).to eql codigo_esperado
end
