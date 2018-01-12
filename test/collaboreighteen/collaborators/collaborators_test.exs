defmodule Collaboreighteen.CollaboratorsTest do
  use Collaboreighteen.DataCase

  alias Collaboreighteen.Collaborators

  describe "people" do
    alias Collaboreighteen.Collaborators.Person

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Collaborators.create_person()

      person
    end

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert Collaborators.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Collaborators.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Collaborators.create_person(@valid_attrs)
      assert person.name == "some name"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Collaborators.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, person} = Collaborators.update_person(person, @update_attrs)
      assert %Person{} = person
      assert person.name == "some updated name"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Collaborators.update_person(person, @invalid_attrs)
      assert person == Collaborators.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Collaborators.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Collaborators.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Collaborators.change_person(person)
    end
  end

  describe "locations" do
    alias Collaboreighteen.Collaborators.Location

    @valid_attrs %{city: "some city", country: "some country", name: "some name", state: "some state"}
    @update_attrs %{city: "some updated city", country: "some updated country", name: "some updated name", state: "some updated state"}
    @invalid_attrs %{city: nil, country: nil, name: nil, state: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Collaborators.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Collaborators.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Collaborators.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Collaborators.create_location(@valid_attrs)
      assert location.city == "some city"
      assert location.country == "some country"
      assert location.name == "some name"
      assert location.state == "some state"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Collaborators.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, location} = Collaborators.update_location(location, @update_attrs)
      assert %Location{} = location
      assert location.city == "some updated city"
      assert location.country == "some updated country"
      assert location.name == "some updated name"
      assert location.state == "some updated state"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Collaborators.update_location(location, @invalid_attrs)
      assert location == Collaborators.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Collaborators.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Collaborators.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Collaborators.change_location(location)
    end
  end

  describe "people_skills" do
    alias Collaboreighteen.Collaborators.PersonSkill

    @valid_attrs %{notes: "some notes", paid: true, payment_notes: "some payment_notes"}
    @update_attrs %{notes: "some updated notes", paid: false, payment_notes: "some updated payment_notes"}
    @invalid_attrs %{notes: nil, paid: nil, payment_notes: nil}

    def person_skill_fixture(attrs \\ %{}) do
      {:ok, person_skill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Collaborators.create_person_skill()

      person_skill
    end

    test "list_people_skills/0 returns all people_skills" do
      person_skill = person_skill_fixture()
      assert Collaborators.list_people_skills() == [person_skill]
    end

    test "get_person_skill!/1 returns the person_skill with given id" do
      person_skill = person_skill_fixture()
      assert Collaborators.get_person_skill!(person_skill.id) == person_skill
    end

    test "create_person_skill/1 with valid data creates a person_skill" do
      assert {:ok, %PersonSkill{} = person_skill} = Collaborators.create_person_skill(@valid_attrs)
      assert person_skill.notes == "some notes"
      assert person_skill.paid == true
      assert person_skill.payment_notes == "some payment_notes"
    end

    test "create_person_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Collaborators.create_person_skill(@invalid_attrs)
    end

    test "update_person_skill/2 with valid data updates the person_skill" do
      person_skill = person_skill_fixture()
      assert {:ok, person_skill} = Collaborators.update_person_skill(person_skill, @update_attrs)
      assert %PersonSkill{} = person_skill
      assert person_skill.notes == "some updated notes"
      assert person_skill.paid == false
      assert person_skill.payment_notes == "some updated payment_notes"
    end

    test "update_person_skill/2 with invalid data returns error changeset" do
      person_skill = person_skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Collaborators.update_person_skill(person_skill, @invalid_attrs)
      assert person_skill == Collaborators.get_person_skill!(person_skill.id)
    end

    test "delete_person_skill/1 deletes the person_skill" do
      person_skill = person_skill_fixture()
      assert {:ok, %PersonSkill{}} = Collaborators.delete_person_skill(person_skill)
      assert_raise Ecto.NoResultsError, fn -> Collaborators.get_person_skill!(person_skill.id) end
    end

    test "change_person_skill/1 returns a person_skill changeset" do
      person_skill = person_skill_fixture()
      assert %Ecto.Changeset{} = Collaborators.change_person_skill(person_skill)
    end
  end

  describe "people_locations" do
    alias Collaboreighteen.Collaborators.PersonLocation

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def person_location_fixture(attrs \\ %{}) do
      {:ok, person_location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Collaborators.create_person_location()

      person_location
    end

    test "list_people_locations/0 returns all people_locations" do
      person_location = person_location_fixture()
      assert Collaborators.list_people_locations() == [person_location]
    end

    test "get_person_location!/1 returns the person_location with given id" do
      person_location = person_location_fixture()
      assert Collaborators.get_person_location!(person_location.id) == person_location
    end

    test "create_person_location/1 with valid data creates a person_location" do
      assert {:ok, %PersonLocation{} = person_location} = Collaborators.create_person_location(@valid_attrs)
    end

    test "create_person_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Collaborators.create_person_location(@invalid_attrs)
    end

    test "update_person_location/2 with valid data updates the person_location" do
      person_location = person_location_fixture()
      assert {:ok, person_location} = Collaborators.update_person_location(person_location, @update_attrs)
      assert %PersonLocation{} = person_location
    end

    test "update_person_location/2 with invalid data returns error changeset" do
      person_location = person_location_fixture()
      assert {:error, %Ecto.Changeset{}} = Collaborators.update_person_location(person_location, @invalid_attrs)
      assert person_location == Collaborators.get_person_location!(person_location.id)
    end

    test "delete_person_location/1 deletes the person_location" do
      person_location = person_location_fixture()
      assert {:ok, %PersonLocation{}} = Collaborators.delete_person_location(person_location)
      assert_raise Ecto.NoResultsError, fn -> Collaborators.get_person_location!(person_location.id) end
    end

    test "change_person_location/1 returns a person_location changeset" do
      person_location = person_location_fixture()
      assert %Ecto.Changeset{} = Collaborators.change_person_location(person_location)
    end
  end
end
