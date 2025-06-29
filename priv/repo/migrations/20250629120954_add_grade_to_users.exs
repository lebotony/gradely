defmodule Gradely.Repo.Migrations.AddGradeToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :grade, :string
    end
  end
end
