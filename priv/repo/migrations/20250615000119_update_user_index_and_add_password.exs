defmodule Gradely.Repo.Migrations.UpdateUserIndexAndAddPassword do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :password_hash, :string
      add :password, :string
    end

    drop index(:users, [:email, :username])
    create index(:users, [:email])
    create index(:users, [:username])
  end
end
