require "../src/aerial"

get "/hello" do |ctx|
  "hello, world!"
end

Aerial.run