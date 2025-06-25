defmodule Gradely.Repo.Migrations.CreateParents do
  use Ecto.Migration

  def change do
    create table(:parents) do
      add :user_id, references(:users)

      timestamps()
    end

    create index(:parents, [:user_id])
  end
end
