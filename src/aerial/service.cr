

module Aerial
  abstract class Service(Request, Response)
    abstract def is_available: Boolean
  end  
end
