defmodule EctoTest.ApiController do
  import Plug.Conn

  alias EctoTest.Dweet
  alias EctoTest.Repo

  def index(conn) do
    repos =
      Dweet
      |> Repo.all
      |> Poison.encode!

    conn
    |> put_resp_content_type("application/json", "utf-8")
    |> send_resp(200, repos)
  end

  def create(conn) do
    { :ok, body, conn } = read_body(conn)

    dweet = Poison.decode! body
    params = %{ author: dweet["author"], content: dweet["content"] }
    changeset = Dweet.changeset(%Dweet{}, params)
    if changeset.valid? do
      case Repo.insert(changeset) do
        { :ok, dweet } ->
          conn
          |> put_resp_content_type("application/json", "utf-8")
          |> send_resp(200, Poison.encode!(dweet))
        { :error, _ } ->
          conn
          |> put_resp_content_type("application/json", "utf-8")
          |> send_resp(500, Poison.encode!(%{ error: true }))
      end
    else
      conn
      |> put_resp_content_type("application/json", "utf-8")
      |> send_resp(500, Poison.encode!(%{ error: true }))
    end
  end

  def show(%{ params: %{ "id" => id }} = conn) do
    dweet = Repo.get(Dweet, id)

    conn
    |> put_resp_content_type("application/json", "utf-8")
    |> send_resp(200, Poison.encode!(dweet))
  end
end
