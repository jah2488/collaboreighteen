defmodule CollaboreighteenWeb.PersonLocationControllerTest do
  use CollaboreighteenWeb.ConnCase

  alias Collaboreighteen.Collaborators
  alias Collaboreighteen.Collaborators.PersonLocation

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:person_location) do
    {:ok, person_location} = Collaborators.create_person_location(@create_attrs)
    person_location
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all people_locations", %{conn: conn} do
      conn = get conn, person_location_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person_location" do
    test "renders person_location when data is valid", %{conn: conn} do
      conn = post conn, person_location_path(conn, :create), person_location: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, person_location_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, person_location_path(conn, :create), person_location: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person_location" do
    setup [:create_person_location]

    test "renders person_location when data is valid", %{conn: conn, person_location: %PersonLocation{id: id} = person_location} do
      conn = put conn, person_location_path(conn, :update, person_location), person_location: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, person_location_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, person_location: person_location} do
      conn = put conn, person_location_path(conn, :update, person_location), person_location: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person_location" do
    setup [:create_person_location]

    test "deletes chosen person_location", %{conn: conn, person_location: person_location} do
      conn = delete conn, person_location_path(conn, :delete, person_location)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, person_location_path(conn, :show, person_location)
      end
    end
  end

  defp create_person_location(_) do
    person_location = fixture(:person_location)
    {:ok, person_location: person_location}
  end
end
