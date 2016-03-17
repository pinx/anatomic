defmodule Anatomic.Repo.Migrations.CreatePart do
  use Ecto.Migration

  def change do
    create table(:parts) do
      add :name, :string
      add :qty, :integer

      timestamps
    end

  end
end
