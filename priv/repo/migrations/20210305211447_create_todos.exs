defmodule TodoList.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string

      timestamps()
    end
    create unique_index(:todos, [:title])
  end
end
