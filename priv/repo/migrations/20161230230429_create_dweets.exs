defmodule EctoTest.Repo.Migrations.CreateDweets do
  use Ecto.Migration

  def change do
    create table(:dweet) do
      add :content, :string
      add :author,  :string
      
      timestamps()
    end
  end
end
