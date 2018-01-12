defmodule CollaboreighteenWeb.SkillController do
  use CollaboreighteenWeb, :controller

  alias Collaboreighteen.Offerings
  alias Collaboreighteen.Offerings.Skill

  action_fallback CollaboreighteenWeb.FallbackController

  def index(conn, _params) do
    skills = Offerings.list_skills()
    render(conn, "index.json", skills: skills)
  end

  def create(conn, %{"skill" => skill_params}) do
    with {:ok, %Skill{} = skill} <- Offerings.create_skill(skill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", skill_path(conn, :show, skill))
      |> render("show.json", skill: skill)
    end
  end

  def show(conn, %{"id" => id}) do
    skill = Offerings.get_skill!(id)
    render(conn, "show.json", skill: skill)
  end

  def update(conn, %{"id" => id, "skill" => skill_params}) do
    skill = Offerings.get_skill!(id)

    with {:ok, %Skill{} = skill} <- Offerings.update_skill(skill, skill_params) do
      render(conn, "show.json", skill: skill)
    end
  end

  def delete(conn, %{"id" => id}) do
    skill = Offerings.get_skill!(id)
    with {:ok, %Skill{}} <- Offerings.delete_skill(skill) do
      send_resp(conn, :no_content, "")
    end
  end
end
