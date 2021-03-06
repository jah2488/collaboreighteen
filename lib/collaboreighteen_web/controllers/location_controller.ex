defmodule CollaboreighteenWeb.LocationController do
  use CollaboreighteenWeb, :controller

  alias Collaboreighteen.Collaborators
  alias Collaboreighteen.Collaborators.Location

  action_fallback CollaboreighteenWeb.FallbackController

  def index(conn, _params) do
    locations = Collaborators.list_locations()
    render(conn, "index.json", locations: locations)
  end

  def create(conn, %{"location" => location_params}) do
    with {:ok, %Location{} = location} <- Collaborators.create_location(location_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", location_path(conn, :show, location))
      |> render("show.json", location: location)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Collaborators.get_location!(id)
    render(conn, "show.json", location: location)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Collaborators.get_location!(id)

    with {:ok, %Location{} = location} <- Collaborators.update_location(location, location_params) do
      render(conn, "show.json", location: location)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Collaborators.get_location!(id)
    with {:ok, %Location{}} <- Collaborators.delete_location(location) do
      send_resp(conn, :no_content, "")
    end
  end
end
