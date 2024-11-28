# @valid_user
Dado('que tenho dados validos para cadastrar um usuario') do
  @create_valid_user = build_data.create_valid_users
end

Quando('faco uma requisicao do tipo POST para Users com dados validos') do
  @request_valid_user = build_data.users(@create_valid_user)
end

Então('devo receber body do usuario cadastrado juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_valid_user.code).to eql codigo_esperado
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
