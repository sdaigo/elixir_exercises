defmodule TodoList do
  alias TodoList.MultiDict

  def new(), do: MultiDict.new()

  def add_entry(todo_list, date, title) do
    MultiDict.add(
      todo_list,
      date,
      title
    )
  end

  def entries(todo_list, date) do
    Map.get(todo_list, date)
  end
end
