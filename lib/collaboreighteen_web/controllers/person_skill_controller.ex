defmodule CollaboreighteenWeb.PersonSkillController do
  use CollaboreighteenWeb, :controller

  alias Collaboreighteen.Collaborators
  alias Collaboreighteen.Collaborators.PersonSkill

  action_fallback CollaboreighteenWeb.FallbackController

  def index(conn, _params) do
    people_skills = Collaborators.list_people_skills()
    render(conn, "index.json", people_skills: people_skills)
  end

  def create(conn, %{"person_skill" => person_skill_params}) do
    with {:ok, %PersonSkill{} = person_skill} <- Collaborators.create_person_skill(person_skill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", person_skill_path(conn, :show, person_skill))
      |> render("show.json", person_skill: person_skill)
    end
  end

  def show(conn, %{"id" => id}) do
    person_skill = Collaborators.get_person_skill!(id)
    render(conn, "show.json", person_skill: person_skill)
  end

  def update(conn, %{"id" => id, "person_skill" => person_skill_params}) do
    person_skill = Collaborators.get_person_skill!(id)

    with {:ok, %PersonSkill{} = person_skill} <- Collaborators.update_person_skill(person_skill, person_skill_params) do
      render(conn, "show.json", person_skill: person_skill)
    end
  end

  def delete(conn, %{"id" => id}) do
    person_skill = Collaborators.get_person_skill!(id)
    with {:ok, %PersonSkill{}} <- Collaborators.delete_person_skill(person_skill) do
      send_resp(conn, :no_content, "")
    end
  end
end
