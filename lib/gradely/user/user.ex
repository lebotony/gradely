defmodule Gradely.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Argon2
  alias Gradely.{Avatar, School, Student, Teacher, Parent, Admin}

  @manual_params [:username, :email, :password, :role]
  @google_params [:email, :role]
  @other_params [:phone_number, :address, :old_password, :first_name, :last_surname, :gender, :school_id, :grade]
  @params @google_params ++ @manual_params ++ @other_params

  schema "users" do
    field :first_name, :string
    field :last_surname, :string
    field :username, :string
    field :email, :string
    field :password, :string
    field :old_password, :string
    field :role, :string
    field :grade, :string
    field :phone_number, :string
    field :address, :string
    field :gender, :string

    # has_one :avatar, Avatar
    belongs_to :school, School
    has_one :student, Student
    has_one :teacher, Teacher
    has_one :parent, Parent
    has_one :admin, Admin

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
