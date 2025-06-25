defmodule Gradely.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :dob, :date
      add :gender, :string
      add :user_id, references(:users)
      add :parent_id, references(:parents)
      add :class_id, references(:classes)

      timestamps()
    end

    create index(:students, [:user_id])
    create index(:students, [:parent_id])
    create index(:students, [:class_id])
  end
end
