defmodule GradelyWeb.Api.MessageView do
  use GradelyWeb, :view
  alias GradelyWeb.Api.MessageView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{
      id: message.id,
      content: message.content,
      seen: message.seen,
      author_id: message.author_id,
      recipient_id: message.recipient_id,
      thread_id: message.thread_id
    }
  end
end
