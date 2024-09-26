defmodule NameBadge do
  defp print_dept(dept), do: if(dept, do: String.upcase(dept), else: "OWNER")

  def print(id, name, department) when id == nil do
    "#{name} - #{print_dept(department)}"
  end

  def print(id, name, department) do
    "[#{id}] - #{name} - #{print_dept(department)}"
  end
end
