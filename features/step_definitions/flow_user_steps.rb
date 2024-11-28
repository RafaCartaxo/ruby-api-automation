# @flow_user
Dado('que tenho dados validos para cadastrar um usuario') do
  @create_user = build_data.create_users
end

Quando('faco uma requisicao do tipo POST para Users') do
  @request_user = build_data.users(@create_user)
end

Então('devo receber body do usuario cadastrado juntamente com o codigo esperado {int}') do |codigo_esperado|
  expect(@request_user.code).to eql codigo_esperado
end
