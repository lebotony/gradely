defmodule Gradely.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :seen, :boolean, default: false

      add :author_id, references(:users)
      add :recipient_id, references(:users)
      add :thread_id, references(:threads)

      timestamps()
    end

    create index(:messages, [:author_id])
    create index(:messages, [:recipient_id])
    create index(:messages, [:thread_id])
  end
end
