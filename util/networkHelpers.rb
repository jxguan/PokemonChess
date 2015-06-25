require 'socket'

def issueRequestThroughSocket (request, hostname, port)
  socket = TCPSocket.open(hostname, port)
  socket.puts(request)
  response = socket.read
  socket.close
  return response
end

def getHTTPPage(url)
  http = Array.new
  url.match(/^([^\/]*)(\/.*)/)
  http << "GET #{$2} HTTP/1.1"
  http << "HOST: #{$1}"
  http << "Connection: close"
  request = http.join("\r\n") + "\r\n\r\n"
  response = issueRequestThroughSocket(request, $1, 80)
  return response
end