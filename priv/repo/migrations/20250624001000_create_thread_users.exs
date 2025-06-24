defmodule Gradely.Repo.Migrations.CreateThreadUsers do
  use Ecto.Migration

  def change do
    create table(:thread_users) do
      add :thread_id, references(:threads)
      add :user_id, references(:users)

      timestamps()
    end

    create index(:thread_users, [:thread_id])
    create index(:thread_users, [:user_id])
  end
end
