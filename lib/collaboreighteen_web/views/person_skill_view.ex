defmodule CollaboreighteenWeb.PersonSkillView do
  use CollaboreighteenWeb, :view
  alias CollaboreighteenWeb.PersonSkillView
  alias CollaboreighteenWeb.PersonView

  def render("index.json", %{people_skills: people_skills}) do
    %{data: render_many(people_skills, PersonSkillView, "person_skill.json")}
  end

  def render("show.json", %{person_skill: person_skill}) do
    %{data: render_one(person_skill, PersonSkillView, "person_skill.json")}
  end

  def render("person_skill.json", %{person_skill: person_skill}) do
    Map.merge(
      %{
        id: person_skill.id,
        skill_notes: person_skill.notes,
        paid: person_skill.paid,
        payment_notes: person_skill.payment_notes
      },
      render_one(person_skill.person, PersonView, "person.json")
    )
  end
end
