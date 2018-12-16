defmodule Elemental.Element do
  use Elemental.Web, :model

  schema "elements" do
    field :name, :string
    field :symbol, :string
    field :num_of_electrons, :integer
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :symbol, :num_of_electrons])
    |> validate_required([:name, :symbol, :num_of_electrons])
    |> validate_number(:num_of_electrons, greater_than: 0)
  end
end
