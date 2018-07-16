require "./*"

HTTP_METHODS_OPTIONS = %w(get post put patch delete options)

{% for method in HTTP_METHODS_OPTIONS %}
  def {{method.id}}(path, &block : HTTP::Server::Context -> (HTTP::Server::Context | String | Int32 | Int64 | Bool | Nil))
    stack = Aerial::Stack.new([] of Aerial::Handler, &block)
    Aerial::ServerHandler::INSTANCE.add_stack {{method}}.upcase, path, stack
  end

  def {{method.id}}(path, middlewares : Array(Aerial::Handler), &block : HTTP::Server::Context -> (HTTP::Server::Context | String | Int32 | Int64 | Bool | Nil))
    stack = Aerial::Stack.new(middlewares, &block)
    Aerial::ServerHandler::INSTANCE.add_stack {{method}}.upcase, path, stack
  end
{% end %}