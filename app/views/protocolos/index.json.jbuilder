json.array!(@protocolos) do |protocolo|
  json.extract! protocolo, :id, :enviar_para, :observacao, :dt_expedicao, :ano, :codigo_protocolo
  json.url protocolo_url(protocolo, format: :json)
end
