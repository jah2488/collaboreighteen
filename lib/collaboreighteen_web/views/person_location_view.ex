defmodule CollaboreighteenWeb.PersonLocationView do
  use CollaboreighteenWeb, :view
  alias CollaboreighteenWeb.PersonLocationView

  def render("index.json", %{people_locations: people_locations}) do
    %{data: render_many(people_locations, PersonLocationView, "person_location.json")}
  end

  def render("show.json", %{person_location: person_location}) do
    %{data: render_one(person_location, PersonLocationView, "person_location.json")}
  end

  def render("person_location.json", %{person_location: person_location}) do
    %{id: person_location.id}
  end
end
