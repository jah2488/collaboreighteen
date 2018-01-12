defmodule CollaboreighteenWeb.PersonSkillControllerTest do
  use CollaboreighteenWeb.ConnCase

  alias Collaboreighteen.Collaborators
  alias Collaboreighteen.Collaborators.PersonSkill

  @create_attrs %{notes: "some notes", paid: true, payment_notes: "some payment_notes"}
  @update_attrs %{notes: "some updated notes", paid: false, payment_notes: "some updated payment_notes"}
  @invalid_attrs %{notes: nil, paid: nil, payment_notes: nil}

  def fixture(:person_skill) do
    {:ok, person_skill} = Collaborators.create_person_skill(@create_attrs)
    person_skill
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all people_skills", %{conn: conn} do
      conn = get conn, person_skill_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person_skill" do
    test "renders person_skill when data is valid", %{conn: conn} do
      conn = post conn, person_skill_path(conn, :create), person_skill: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, person_skill_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "notes" => "some notes",
        "paid" => true,
        "payment_notes" => "some payment_notes"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, person_skill_path(conn, :create), person_skill: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person_skill" do
    setup [:create_person_skill]

    test "renders person_skill when data is valid", %{conn: conn, person_skill: %PersonSkill{id: id} = person_skill} do
      conn = put conn, person_skill_path(conn, :update, person_skill), person_skill: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, person_skill_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "notes" => "some updated notes",
        "paid" => false,
        "payment_notes" => "some updated payment_notes"}
    end

    test "renders errors when data is invalid", %{conn: conn, person_skill: person_skill} do
      conn = put conn, person_skill_path(conn, :update, person_skill), person_skill: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person_skill" do
    setup [:create_person_skill]

    test "deletes chosen person_skill", %{conn: conn, person_skill: person_skill} do
      conn = delete conn, person_skill_path(conn, :delete, person_skill)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, person_skill_path(conn, :show, person_skill)
      end
    end
  end

  defp create_person_skill(_) do
    person_skill = fixture(:person_skill)
    {:ok, person_skill: person_skill}
  end
end
