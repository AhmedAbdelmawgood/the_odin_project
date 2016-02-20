require 'socket'
require 'json'
server = TCPServer.open(2000)

def create_response(method, path, scheme, body=nil)
	case method
	when "GET" then create_get(path, scheme)
	when "POST" then create_post(path, scheme, body)
	else
		"ERROR. not a valid request for our server"
	end
end
def create_get(path, scheme)
	puts ".#{path}"
	path = ".#{path}"	
	if File.exist?path
		file = File.open(path).readlines.join
		p scheme.chomp
		return "#{scheme.chomp} 200 ok", file 
	else
		"#{scheme.chomp}404 error, file doesn't exist"
	end
end
def create_post(path , scheme, body)
	path = ".#{path}"
	if File.exist?path 
		replacement = "<li>name: #{body['viking']['name']}</li>\n<li>email: #{body['viking']['email']}</li>"
		text = File.read(path).sub('<%=yield%>', replacement)
		return "#{scheme.chomp} 200 ok", text
	else
		"#{scheme.chomp}404 error, file doesn't exist"
	end
end

loop {
	Thread.start(server.accept) do |client|
		client_request = client.recv(1000).split("\r\n\r\n",2)
		header = client_request[0]
		method, path, scheme = header.split(" ", 3)
		p method
		body = JSON.parse(client_request[1]) unless client_request[1].empty?
		response = create_response(method, path, scheme, body)
		client.puts(response)
		puts "it was a pleasure to deal with you \n Bye Bye"
		client.close
	end
}