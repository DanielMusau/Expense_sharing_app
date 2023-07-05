defmodule ExpenseSharingAppWeb.ExpenseJSON do
  alias ExpenseSharingApp.Expenses.Expense

  @doc """
  Renders a list of expenses.
  """
  def index(%{expenses: expenses}) do
    %{data: for(expense <- expenses, do: data(expense))}
  end

  @doc """
  Renders a single expense.
  """
  def show(%{expense: expense}) do
    %{data: data(expense)}
  end

  defp data(%Expense{} = expense) do
    %{
      id: expense.id,
      name: expense.name,
      amount: expense.amount
    }
  end
end
