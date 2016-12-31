defmodule EctoTest.Router do
  use Plug.Router
  use Plug.Debugger, otp_app: :ecto_test

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Tweets")
  end

  get "/api/dweets" do
    EctoTest.ApiController.index conn
  end

  get "/api/dweets/:id" do
    EctoTest.ApiController.show conn
  end

  post "/api/dweets" do
    EctoTest.ApiController.create conn
  end


  match _ do
    send_resp(conn, 404, "oops")
  end
end
