defmodule Gradely.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Argon2

  @manual_params [:username, :email, :password, :role]
  @google_params [:email, :role]
  @params @google_params ++ @manual_params
  # ++ [:grade, :gender, :name, :surname]

  schema "users" do
    # field :name, :string
    # field :surname, :string
    field :username, :string
    field :email, :string
    field :password, :string
    # field :avatar, :string
    field :role, :string
    # field :grade, :string
    # field :gender, :string

    timestamps()
  end

  def changeset(struct, %{"username" => username} = attrs) when is_binary(username) do
    struct
    |> cast(attrs, @params)
    |> validate_required(@manual_params)
    |> put_password_hash()
  end

  def changeset(struct, %{"email" => email} = attrs) when is_binary(email) do
    struct
    |> cast(attrs, @params)
    |> validate_required(@google_params)
    |> unique_constraint(:email)
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} =
           changeset
       )
       when is_binary(password) do
    change(changeset,
      password: Argon2.hash_pwd_salt(password)
    )
  end

  defp put_password_hash(changeset), do: changeset
end
