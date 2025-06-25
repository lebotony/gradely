defmodule Gradely.TimeTables do
  import Ecto.Query, warn: false
  alias Gradely.{Repo, TimeTable}

  def list_time_tables do
    Repo.all(TimeTable)
  end

  def get_time_table!(id), do: Repo.get!(TimeTable, id)

  def create_time_table(attrs \\ %{}) do
    %TimeTable{}
    |> TimeTable.changeset(attrs)
    |> Repo.insert()
  end

  def update_time_table(%TimeTable{} = time_table, attrs) do
    time_table
    |> TimeTable.changeset(attrs)
    |> Repo.update()
  end

  def delete_time_table(%TimeTable{} = time_table) do
    Repo.delete(time_table)
  end

  def change_time_table(%TimeTable{} = time_table, attrs \\ %{}) do
    TimeTable.changeset(time_table, attrs)
  end
end
