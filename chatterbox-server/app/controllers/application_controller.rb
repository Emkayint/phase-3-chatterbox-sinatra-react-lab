class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get "/messages" do
    res = Message.all
    res.to_json
  end

  post "/messages" do
    new_msg = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_msg.to_json
  end

  patch "/messages/:id" do
    msg = Message.find(params[:id])
    msg.update(
      body: params[:body]
    )
    msg.to_json
  end

  delete "/messages/:id" do
    msg = Message.find(params[:id])
    msg.destroy
  end
  
end
