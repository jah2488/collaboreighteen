defmodule CollaboreighteenWeb.SkillView do
  use CollaboreighteenWeb, :view
  alias CollaboreighteenWeb.SkillView

  require IEx

  def render("index.json", %{skills: skills}) do
    %{data: render_many(skills, SkillView, "skill.json")}
  end

  def render("show.json", %{skill: skill}) do
    %{data: render_one(skill, SkillView, "skill.json")}
  end

  def render("skill.json", %{skill: skill}) do
    %{
      id: skill.id,
      name: skill.name,
      people:
        render_many(skill.people_skills, CollaboreighteenWeb.PersonSkillView, "person_skill.json")
    }
  end
end
