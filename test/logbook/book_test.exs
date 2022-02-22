defmodule Logbook.BookTest do
  use Logbook.DataCase

  alias Logbook.Book

  describe "logs" do
    alias Logbook.Book.Log

    import Logbook.BookFixtures

    @invalid_attrs %{body: nil, username: nil}

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Book.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Book.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      valid_attrs = %{body: "some body", username: "some username"}

      assert {:ok, %Log{} = log} = Book.create_log(valid_attrs)
      assert log.body == "some body"
      assert log.username == "some username"
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Book.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      update_attrs = %{body: "some updated body", username: "some updated username"}

      assert {:ok, %Log{} = log} = Book.update_log(log, update_attrs)
      assert log.body == "some updated body"
      assert log.username == "some updated username"
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Book.update_log(log, @invalid_attrs)
      assert log == Book.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Book.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Book.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Book.change_log(log)
    end
  end
end
