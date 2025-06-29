defmodule Gradely.Repo.Migrations.ChangeLastSurnameFieldToLastNameInUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :last_surname, :string
      add :last_name, :string
    end
  end
end
