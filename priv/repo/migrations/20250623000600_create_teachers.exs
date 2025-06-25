defmodule Gradely.Repo.Migrations.CreateTeachers do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :dob, :date
      add :blood_type, :string
      add :religion, :string
      add :user_id, references(:users)

      timestamps()
    end

    create index(:teachers, [:user_id])
  end
end
