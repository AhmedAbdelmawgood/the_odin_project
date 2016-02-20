require 'socket'
require 'json'
client = TCPSocket.open('localhost', 2000)
def request_type
	puts 'enter the path'
	path = gets.chomp
	puts "enter get or post request"
	case gets.chomp.downcase
	when 'get' then send('get',path)
	when 'post' then send('post',path)
	else 
		puts "invalid input"
		request_type
	end
end
def send(method, path)
	request = String.new
	case method
	when 'get' then "GET #{path} HTTP/1.0\r\n\r\n"
	when 'post' then create_post_req
	end
end
def create_post_req(path = '/thanks.html')
	puts "enter your name"
	name = gets.chomp
	puts "enter your email"
	email = gets.chomp 
	data = {'viking' => {'name' => "#{name}", 'email' => "#{email}"} }.to_json
	"POST #{path} HTTP/1.0\r\n\r\n#{data}"
end
client.print(request_type)
puts client.read