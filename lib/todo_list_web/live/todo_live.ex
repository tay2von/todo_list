defmodule TodoListWeb.TodoLive do
  
  



































use TodoListWeb, :live_view
alias TodoList.Todos
  def mount(_params, _session, socket) do
    Todos.subscribe(

    )
    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"todo" => todo}, socket) do
    Todos.create_todo(todo)
    {:noreply, fetch(socket)}
  end

  def handle_event("toggle_done", %{"id" => id}, socket) do
    todo = Todos.get_todo!(id)
    Todos.update_todo(todo, %{done: !todo.done})
    Todos.delete_todo(todo)
    {:noreply, fetch(socket) |> put_flash(:info, "Task was completed!")}
  end

  def handle_event("deleted", %{"id" => id}, socket) do
    todo = Todos.get_todo!(id)
    Todos.delete_todo(todo.id)
    {:noreply, fetch(socket)}
  end

  def handle_info({Todos, [:todo | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, todos: Todos.list_todos())
  end


end
