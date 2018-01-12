defmodule CollaboreighteenWeb.PersonLocationController do
  use CollaboreighteenWeb, :controller

  alias Collaboreighteen.Collaborators
  alias Collaboreighteen.Collaborators.PersonLocation

  action_fallback CollaboreighteenWeb.FallbackController

  def index(conn, _params) do
    people_locations = Collaborators.list_people_locations()
    render(conn, "index.json", people_locations: people_locations)
  end

  def create(conn, %{"person_location" => person_location_params}) do
    with {:ok, %PersonLocation{} = person_location} <- Collaborators.create_person_location(person_location_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", person_location_path(conn, :show, person_location))
      |> render("show.json", person_location: person_location)
    end
  end

  def show(conn, %{"id" => id}) do
    person_location = Collaborators.get_person_location!(id)
    render(conn, "show.json", person_location: person_location)
  end

  def update(conn, %{"id" => id, "person_location" => person_location_params}) do
    person_location = Collaborators.get_person_location!(id)

    with {:ok, %PersonLocation{} = person_location} <- Collaborators.update_person_location(person_location, person_location_params) do
      render(conn, "show.json", person_location: person_location)
    end
  end

  def delete(conn, %{"id" => id}) do
    person_location = Collaborators.get_person_location!(id)
    with {:ok, %PersonLocation{}} <- Collaborators.delete_person_location(person_location) do
      send_resp(conn, :no_content, "")
    end
  end
end
