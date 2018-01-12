defmodule Collaboreighteen.OfferingsTest do
  use Collaboreighteen.DataCase

  alias Collaboreighteen.Offerings

  describe "skills" do
    alias Collaboreighteen.Offerings.Skill

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def skill_fixture(attrs \\ %{}) do
      {:ok, skill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Offerings.create_skill()

      skill
    end

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Offerings.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Offerings.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      assert {:ok, %Skill{} = skill} = Offerings.create_skill(@valid_attrs)
      assert skill.name == "some name"
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Offerings.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      assert {:ok, skill} = Offerings.update_skill(skill, @update_attrs)
      assert %Skill{} = skill
      assert skill.name == "some updated name"
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Offerings.update_skill(skill, @invalid_attrs)
      assert skill == Offerings.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Offerings.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Offerings.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Offerings.change_skill(skill)
    end
  end
end
