defmodule Logbook.Repo do
  use Ecto.Repo,
    otp_app: :logbook,
    adapter: Ecto.Adapters.Postgres
end
