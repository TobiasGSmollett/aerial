require "http"
require "radix"
require "./*"

module Aerial
  class ServerHandler
    include HTTP::Handler
    
    INSTANCE = new
    
    def initialize
      @tree = Radix::Tree(Aerial::Stack).new
    end
    
    def add_stack(method, path, stack)
      lookup_result = @tree.find "/#{method.downcase}#{path}"
      if lookup_result.found?
        raise "There is already an existing path for #{method.upcase} #{path}."
      end
      @tree.add "/#{method.downcase}#{path}", stack
      @tree.add("/head#{path}", Aerial::Stack.new([] of Handler){ |ctx| "" }) if method == "GET"
    end
    
    def call(ctx)
      node = "/#{ctx.request.method.downcase}#{ctx.request.path}"
      lookup_result = @tree.find node
      raise Aerial::RouteNotFound.new(ctx) unless lookup_result.found?
      
      stack = lookup_result.payload.as(Aerial::Stack)
      content = stack.run ctx
    ensure
      ctx.response.print content
    end
  end
end