# Archivo: soap_service.rb
require 'sinatra'

# Cambiar el puerto por defecto (4567) a 4568
set :port, 4568

post '/soap' do
  # Leer la solicitud SOAP (XML)
  request_body = request.body.read

  # Respuesta SOAP simulada
  response = <<~XML
    <?xml version="1.0" encoding="UTF-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <GetSumResponse xmlns="http://example.com/soap">
          <SumResult>#{calculate_sum(request_body)}</SumResult>
        </GetSumResponse>
      </soap:Body>
    </soap:Envelope>
  XML

  content_type 'text/xml'
  response
end

def calculate_sum(request_body)
  # Parsear la solicitud XML para extraer los números (esto es solo un ejemplo simple)
  num1 = request_body.match(/<Number1>(\d+)<\/Number1>/)[1].to_i
  num2 = request_body.match(/<Number2>(\d+)<\/Number2>/)[1].to_i
  num1 + num2
end
