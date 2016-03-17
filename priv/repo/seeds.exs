# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Anatomic.Repo.insert!(%Anatomic.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Anatomic.Repo.delete_all(Anatomic.Part)
[
  {"head", 1},
  {"arms", 2},
  {"torso", 1},
  {"legs", 2}
]
|>Enum.map(fn {name, qty} ->
    Anatomic.Repo.insert!(%Anatomic.Part{name: name, qty: qty}) end
  )

