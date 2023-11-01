defmodule Atividade4ServerWeb.ErrorJSONTest do
  use Atividade4ServerWeb.ConnCase, async: true

  test "renders 404" do
    assert Atividade4ServerWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Atividade4ServerWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
