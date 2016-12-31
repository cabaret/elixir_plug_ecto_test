defmodule EctoTest.Dweet do
  @derive { Poison.Encoder, only: [:id, :content, :author] }

  use Ecto.Schema
  import Ecto.Changeset

  schema "dweet" do
    field :content, :string
    field :author, :string

    timestamps()
  end

  def changeset(dweet, params \\ :empty) do
    dweet
    |> cast(params, [:content, :author])
    |> validate_required([:content, :author])
  end
end
