require 'savon'

# Configurar el cliente SOAP sin WSDL
client = Savon.client(
  endpoint: 'http://localhost:4568/soap', # URL del servidor SOAP
  namespace: 'http://example.com/soap',   # Espacio de nombres del servicio
  log: true,                              # Activar logs para depuración
  pretty_print_xml: true                  # Imprimir XML de forma legible
)

# Crear la solicitud SOAP
response = client.call(:get_sum, message: {
  "Number1" => 5,  # Claves como strings
  "Number2" => 7
})

# Mostrar la respuesta
puts "Resultado: #{response.body[:get_sum_response][:sum_result]}"
