defmodule Grade.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :content, :string
      add :seen, :boolean

      add :author_id, references(:user, on_delete: :nilify_all)
      add :recipient_id, references(:user, on_delete: :nilify_all)
      add :thread_id, references(:thread, on_delete: :delete_all)
    end

    create index(:message, [:author_id])
    create index(:message, [:recipient_id])
    create index(:message, [:thread_id])
  end
end
