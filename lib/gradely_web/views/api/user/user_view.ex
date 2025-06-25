defmodule GradelyWeb.Api.UserView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      username: user.username,
      email: user.email,
      # avatar: Map.get(user, :avatar, nil),
      token: Map.get(user, :token, nil),
      role: user.role,
      inserted_at: user.inserted_at,
      updated_at: user.updated_at
    }
  end

  def render("delete.json", _) do
    %{
      success: true,
      user: "user deleted successfully"
    }
  end
end
