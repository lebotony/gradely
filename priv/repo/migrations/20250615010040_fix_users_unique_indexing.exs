defmodule Gradely.Repo.Migrations.FixUsersUniqueIndexing do
  use Ecto.Migration

  def change do
    drop index(:users, [:email])
    drop index(:users, [:username])

    create unique_index(:users, [:email])
    create unique_index(:users, [:username])
  end
end
