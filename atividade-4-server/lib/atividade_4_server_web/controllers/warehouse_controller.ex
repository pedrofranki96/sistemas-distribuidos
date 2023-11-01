defmodule Atividade4ServerWeb.WarehouseController do
  use Atividade4ServerWeb, :controller

  def store(conn, params) do
    conn
    |> put_resp_content_type("application/json")
    |> put_status(:ok)
    |> json(%{message: "store"})
  end

  def retrieve(conn, params) do
    conn
    |> put_resp_content_type("application/json")
    |> put_status(:ok)
    |> json(%{message: "retrieve"})
  end
end
# https://github.com/mustafaturan/sse
# https://gist.github.com/rbishop/e7b1886d5e75b2f74d8b
