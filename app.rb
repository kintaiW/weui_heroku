require 'sinatra'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(    
    :adapter=>'sqlite3',    
    :database=>'data.sqlite3',    
    :pool=>5,    
    :timeout=>5000    
    )  

class CreateUsers < ActiveRecord::Migration[5.0]   
  def change    
    create_table :users do |t|    
      t.string :name    
      t.integer :age    
    end   
  end    
end    

CreateUsers.new.change

get "/" do
    send_file "views/login.html"
end

post "/new_user" do
  params.to_s
end

class User < ActiveRecord::Base
end

User.create name: "csc", age: 12

get "/users" do
  @users = User.all
  @users.to_json
end

