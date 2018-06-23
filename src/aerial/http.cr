
module Aerial::HTTP
  class Status
    getter code : Int32

    def initialize(@code)
    end
    
    def reason: String
      if Status.reasons[self]?
        Status.reasons[self]
      elsif code < 100 
        "Unknown Status"
      elsif code < 200 
        "Informational"
      elsif code < 300 
        "Successful"
      elsif code < 400 
        "Redirection"
      elsif code < 500 
        "Client Error"
      elsif code < 600 
        "Server Error"
      else 
        "Unknown Status"
      end
    end
    
    Continue = new(100)
    SwitchingProtocols = new(101)
    Processing = new(102)
    Ok = new(200)
    Created = new(201)
    Accepted = new(202)
    NonAuthoritativeInformation = new(203)
    NoContent = new(204)
    ResetContent = new(205)
    PartialContent = new(206)
    MultiStatus = new(207)
    MultipleChoices = new(300)
    MovedPermanently = new(301)
    Found = new(302)
    SeeOther = new(303)
    NotModified = new(304)
    UseProxy = new(305)
    TemporaryRedirect = new(307)
    PermanentRedirect = new(308)
    BadRequest = new(400)
    Unauthorized = new(401)
    PaymentRequired = new(402)
    Forbidden = new(403)
    NotFound = new(404)
    MethodNotAllowed = new(405)
    NotAcceptable = new(406)
    ProxyAuthenticationRequired = new(407)
    RequestTimeout = new(408)
    Conflict = new(409)
    Gone = new(410)
    LengthRequired = new(411)
    PreconditionFailed = new(412)
    RequestEntityTooLarge = new(413)
    RequestURITooLong = new(414)
    UnsupportedMediaType = new(415)
    RequestedRangeNotSatisfiable = new(416)
    ExpectationFailed = new(417)
    EnhanceYourCalm = new(420)
    UnprocessableEntity = new(422)
    Locked = new(423)
    FailedDependency = new(424)
    UnorderedCollection = new(425)
    UpgradeRequired = new(426)
    PreconditionRequired = new(428)
    TooManyRequests = new(429)
    RequestHeaderFieldsTooLarge = new(431)
    UnavailableForLegalReasons = new(451)
    ClientClosedRequest = new(499)
    InternalServerError = new(500)
    NotImplemented = new(501)
    BadGateway = new(502)
    ServiceUnavailable = new(503)
    GatewayTimeout = new(504)
    HttpVersionNotSupported = new(505)
    VariantAlsoNegotiates = new(506)
    InsufficientStorage = new(507)
    NotExtended = new(510)
    NetworkAuthenticationRequired = new(511)
  end

  statuses : Hash(Int32, Status) = {
    100 => Status::Continue,
    101 => Status::SwitchingProtocols,
    102 => Status::Processing,
    200 => Status::Ok,
    201 => Status::Created,
    202 => Status::Accepted,
    203 => Status::NonAuthoritativeInformation,
    204 => Status::NoContent,
    205 => Status::ResetContent,
    206 => Status::PartialContent,
    207 => Status::MultiStatus,
    300 => Status::MultipleChoices,
    301 => Status::MovedPermanently,
    302 => Status::Found,
    303 => Status::SeeOther,
    304 => Status::NotModified,
    305 => Status::UseProxy,
    307 => Status::TemporaryRedirect,
    308 => Status::PermanentRedirect,
    400 => Status::BadRequest,
    401 => Status::Unauthorized,
    402 => Status::PaymentRequired,
    403 => Status::Forbidden,
    404 => Status::NotFound,
    405 => Status::MethodNotAllowed,
    406 => Status::NotAcceptable,
    407 => Status::ProxyAuthenticationRequired,
    408 => Status::RequestTimeout,
    409 => Status::Conflict,
    410 => Status::Gone,
    411 => Status::LengthRequired,
    412 => Status::PreconditionFailed,
    413 => Status::RequestEntityTooLarge,
    414 => Status::RequestURITooLong,
    415 => Status::UnsupportedMediaType,
    416 => Status::RequestedRangeNotSatisfiable,
    417 => Status::ExpectationFailed,
    420 => Status::EnhanceYourCalm,
    422 => Status::UnprocessableEntity,
    423 => Status::Locked,
    424 => Status::FailedDependency,
    425 => Status::UnorderedCollection,
    426 => Status::UpgradeRequired,
    428 => Status::PreconditionRequired,
    429 => Status::TooManyRequests,
    431 => Status::RequestHeaderFieldsTooLarge,
    451 => Status::UnavailableForLegalReasons,
    499 => Status::ClientClosedRequest,
    500 => Status::InternalServerError,
    501 => Status::NotImplemented,
    502 => Status::BadGateway,
    503 => Status::ServiceUnavailable,
    504 => Status::GatewayTimeout,
    505 => Status::HttpVersionNotSupported,
    506 => Status::VariantAlsoNegotiates,
    507 => Status::InsufficientStorage,
    510 => Status::NotExtended,
    511 => Status::NetworkAuthenticationRequired,
  }

  reasons : Hash(Status, String) = {
    Status::Continue => "Continue",
    Status::SwitchingProtocols => "Switching Protocols",
    Status::Processing => "Processing",
    Status::Ok => "OK",
    Status::Created => "Created",
    Status::Accepted => "Accepted",
    Status::NonAuthoritativeInformation => "Non=Authoritative Information",
    Status::NoContent => "No Content",
    Status::ResetContent => "Reset Content",
    Status::PartialContent => "Partial Content",
    Status::MultiStatus => "Multi=Status",
    Status::MultipleChoices => "Multiple Choices",
    Status::MovedPermanently => "Moved Permanently",
    Status::Found => "Found",
    Status::SeeOther => "See Other",
    Status::NotModified => "Not Modified",
    Status::UseProxy => "Use Proxy",
    Status::TemporaryRedirect => "Temporary Redirect",
    Status::PermanentRedirect => "Permanent Redirect",
    Status::BadRequest => "Bad Request",
    Status::Unauthorized => "Unauthorized",
    Status::PaymentRequired => "Payment Required",
    Status::Forbidden => "Forbidden",
    Status::NotFound => "Not Found",
    Status::MethodNotAllowed => "Method Not Allowed",
    Status::NotAcceptable => "Not Acceptable",
    Status::ProxyAuthenticationRequired => "Proxy Authentication Required",
    Status::RequestTimeout => "Request Timeout",
    Status::Conflict => "Conflict",
    Status::Gone => "Gone",
    Status::LengthRequired => "Length Required",
    Status::PreconditionFailed => "Precondition Failed",
    Status::RequestEntityTooLarge => "Request Entity Too Large",
    Status::RequestURITooLong => "Request=URI Too Long",
    Status::UnsupportedMediaType => "Unsupported Media Type",
    Status::RequestedRangeNotSatisfiable => "Requested Range Not Satisfiable",
    Status::ExpectationFailed => "Expectation Failed",
    Status::EnhanceYourCalm => "Enhance Your Calm",
    Status::UnprocessableEntity => "Unprocessable Entity",
    Status::Locked => "Locked",
    Status::FailedDependency => "Failed Dependency",
    Status::UnorderedCollection => "Unordered Collection",
    Status::UpgradeRequired => "Upgrade Required",
    Status::PreconditionRequired => "Precondition Required",
    Status::TooManyRequests => "Too Many Requests",
    Status::RequestHeaderFieldsTooLarge => "Request Header Fields Too Large",
    Status::UnavailableForLegalReasons => "Unavailable For Legal Reasons",
    Status::ClientClosedRequest => "Client Closed Request",
    Status::InternalServerError => "Internal Server Error",
    Status::NotImplemented => "Not Implemented",
    Status::BadGateway => "Bad Gateway",
    Status::ServiceUnavailable => "Service Unavailable",
    Status::GatewayTimeout => "Gateway Timeout",
    Status::HttpVersionNotSupported => "HTTP Version Not Supported",
    Status::VariantAlsoNegotiates => "Variant Also Negotiates",
    Status::InsufficientStorage => "Insufficient Storage",
    Status::NotExtended => "Not Extended",
    Status::NetworkAuthenticationRequired => "Network Authentication Required",
  }
end