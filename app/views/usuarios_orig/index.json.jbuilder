json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nome, :login, :password_digest
  json.url usuario_url(usuario, format: :json)
end
