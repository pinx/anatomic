ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Anatomic.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Anatomic.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Anatomic.Repo)

