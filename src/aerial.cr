require "./aerial/*"

module Aerial
  def self.run(host = "0.0.0.0", port = 8080)
    server = HTTP::Server.new(Aerial::ServerHandler::INSTANCE)
    server.bind_tcp "0.0.0.0", 8080
    server.listen
  end
end
