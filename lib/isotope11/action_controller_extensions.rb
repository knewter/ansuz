module ActionController
  class AbstractRequest
    def query_parameters_array
      pairs = query_string.split('&').collect do |chunk|
        next if chunk.empty?
        key, value = chunk.split('=', 2)
        next if key.empty?
        value = value.nil? ? nil : CGI.unescape(value)
        [ CGI.unescape(key), value ]
      end.compact
    end
  end
end
