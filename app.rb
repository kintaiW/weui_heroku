require 'sinatra'

get "/" do
    send_file "views/login.html"
end

post "/new_user" do
  params.to_s
end