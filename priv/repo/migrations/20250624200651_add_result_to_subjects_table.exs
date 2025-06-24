defmodule Gradely.Repo.Migrations.AddResultToSubjectsTable do
  use Ecto.Migration

  def change do
    alter table(:subjects) do
      add :result_id, references(:results)
    end

    create index(:subjects, [:result_id])
  end
end
