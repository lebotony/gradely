defmodule Gradely.Repo.Migrations.CreateExams do
  use Ecto.Migration

  def change do
    create table(:exams) do
      add :exam_name, :string
      add :writing_date, :date
      add :type, :string

      timestamps()
    end
  end
end
