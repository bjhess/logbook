defmodule Logbook.BookFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Logbook.Book` context.
  """

  @doc """
  Generate a log.
  """
  def log_fixture(attrs \\ %{}) do
    {:ok, log} =
      attrs
      |> Enum.into(%{
        body: "some body",
        username: "some username"
      })
      |> Logbook.Book.create_log()

    log
  end
end
