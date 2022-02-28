# Logbook

## Elixir setup

* [Install with homebrew](https://elixir-lang.org/install.html#macos)
* Open `psql` console
* Run `CREATE ROLE postgres LOGIN CREATEDB;`

## Getting it up

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Where to design

Write your sass in `assets/css/app.scss`. If you need to add other sass files, I'm not sure if it'll work automagically or if we'll have to update the configuration.

`lib/logbook_web/templates/layout` is where you'll find the page layout and it looks like some other navigation and flash message stuff is in there.

`lib/logbook/web/templates/[other_folders]` have what you'd expect in `views` in a Rails app. `views` in Phoenix is more akin to `helpers` in Rails, I think.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
