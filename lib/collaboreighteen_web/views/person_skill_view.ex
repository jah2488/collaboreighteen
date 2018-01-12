defmodule CollaboreighteenWeb.PersonSkillView do
  use CollaboreighteenWeb, :view
  alias CollaboreighteenWeb.PersonSkillView

  def render("index.json", %{people_skills: people_skills}) do
    %{data: render_many(people_skills, PersonSkillView, "person_skill.json")}
  end

  def render("show.json", %{person_skill: person_skill}) do
    %{data: render_one(person_skill, PersonSkillView, "person_skill.json")}
  end

  def render("person_skill.json", %{person_skill: person_skill}) do
    %{id: person_skill.id,
      notes: person_skill.notes,
      paid: person_skill.paid,
      payment_notes: person_skill.payment_notes}
  end
end
