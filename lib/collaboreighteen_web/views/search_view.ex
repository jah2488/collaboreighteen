defmodule CollaboreighteenWeb.SearchView do
  use CollaboreighteenWeb, :view
  alias CollaboreighteenWeb.SearchView
  alias CollaboreighteenWeb.SkillView
  alias Collaboreighteen.Offerings

  def render("index.json", %{skills: skills}) do
    %{
      data: render_many(skills, SkillView, "skill.json")
    }
  end

  def render("search.json", %{results: results}) do
    %{
      data: render_many(results, SkillView, "skill.json")
    }
  end
end
