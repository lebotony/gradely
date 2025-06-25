defmodule Gradely.Repo.Migrations.AlterUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :phone_number, :string
      add :address, :string
      add :old_password, :string
      add :first_name, :string
      add :last_surname, :string
      add :gender, :string

      add :school_id, references(:schools)
    end

    create index(:users, [:school_id])
  end
end
