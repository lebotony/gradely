defmodule GradelyWeb.Api.SessionView do
  use GradelyWeb, :view

  def render("index.json", %{reason: reason}) do
    %{reason: reason}
  end
end
