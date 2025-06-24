defmodule Gradely.Threads do
  import Ecto.Query, warn: false
  alias Gradely.{Repo, Thread}
  alias Gradely. Threads.ThreadUser

  def list_threads do
    Repo.all(Thread)
  end

  def get_thread!(id), do: Repo.get!(Thread, id)

  def create_thread(attrs \\ %{}) do
    %Thread{}
    |> Thread.changeset(attrs)
    |> Repo.insert()
  end

  def update_thread(%Thread{} = thread, attrs) do
    thread
    |> Thread.changeset(attrs)
    |> Repo.update()
  end

  def delete_thread(%Thread{} = thread) do
    Repo.delete(thread)
  end

  def change_thread(%Thread{} = thread, attrs \\ %{}) do
    Thread.changeset(thread, attrs)
  end

  # ThreadUser functions
  def list_thread_users do
    Repo.all(ThreadUser)
  end

  def get_thread_user!(id), do: Repo.get!(ThreadUser, id)

  def create_thread_user(attrs \\ %{}) do
    %ThreadUser{}
    |> ThreadUser.changeset(attrs)
    |> Repo.insert()
  end

  def update_thread_user(%ThreadUser{} = thread_user, attrs) do
    thread_user
    |> ThreadUser.changeset(attrs)
    |> Repo.update()
  end

  def delete_thread_user(%ThreadUser{} = thread_user) do
    Repo.delete(thread_user)
  end

  def change_thread_user(%ThreadUser{} = thread_user, attrs \\ %{}) do
    ThreadUser.changeset(thread_user, attrs)
  end
end
