defmodule CollaboreighteenWeb.PersonView do
  use CollaboreighteenWeb, :view
  alias CollaboreighteenWeb.PersonView

  def render("index.json", %{people: people}) do
    %{data: render_many(people, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{
      id: person.id,
      name: person.name,
      email: Regex.replace(~r/@.*\.[a-z]{2,9}/, person.email, "@*****.com"),
      location: render_many(person.locations, CollaboreighteenWeb.LocationView, "location.json")
    }
  end
end
