defmodule TodoList.Repo.Migrations.AddCompleted do
  use Ecto.Migration

  def change do
      create table(:completed) do

        add :title_id, references(:todos, on_delete: :delete_all)

        timestamps()
      end
      create unique_index(:completed, [:title_id])
  end
end
