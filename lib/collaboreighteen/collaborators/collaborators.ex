defmodule Collaboreighteen.Collaborators do
  @moduledoc """
  The Collaborators context.
  """

  import Ecto.Query, warn: false
  alias Collaboreighteen.Repo

  alias Collaboreighteen.Collaborators.Person
  alias Collaboreighteen.Collaborators.PersonSkill
  alias Collaboreighteen.Collaborators.Location
  alias Collaboreighteen.Collaborators.PersonLocation
  alias Collaboreighteen.Offerings.Skill

  @doc """
  Returns the list of people.

  ## Examples

      iex> list_people()
      [%Person{}, ...]

  """
  def list_people do
    Repo.all(Person)
  end

  def list_people_with_skill(%Skill{} = skill) do
    Repo.all(from(ps in PersonSkill, where: ps.skill_id == ^skill.id, preload: [:person]))
    |> Enum.map(fn ps -> ps.person end)
  end

  @doc """
  Gets a single person.

  Raises `Ecto.NoResultsError` if the Person does not exist.

  ## Examples

      iex> get_person!(123)
      %Person{}

      iex> get_person!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person!(id), do: Repo.get!(Person, id)

  @doc """
  Creates a person.

  ## Examples

      iex> create_person(%{field: value})
      {:ok, %Person{}}

      iex> create_person(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person(attrs \\ %{}) do
    %Person{}
    |> Person.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person.

  ## Examples

      iex> update_person(person, %{field: new_value})
      {:ok, %Person{}}

      iex> update_person(person, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person(%Person{} = person, attrs) do
    person
    |> Person.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Person.

  ## Examples

      iex> delete_person(person)
      {:ok, %Person{}}

      iex> delete_person(person)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person(%Person{} = person) do
    Repo.delete(person)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person changes.

  ## Examples

      iex> change_person(person)
      %Ecto.Changeset{source: %Person{}}

  """
  def change_person(%Person{} = person) do
    Person.changeset(person, %{})
  end

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  def list_locations_for(%Person{} = person) do
    people_locations = Repo.all(PersonLocation, person_id: person.id)
    Repo.all(Location, id: Enum.map(people_locations, fn ps -> ps.location_id end))
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{source: %Location{}}

  """
  def change_location(%Location{} = location) do
    Location.changeset(location, %{})
  end

  @doc """
  Returns the list of people_skills.

  ## Examples

      iex> list_people_skills()
      [%PersonSkill{}, ...]

  """
  def list_people_skills do
    Repo.all(PersonSkill)
  end

  @doc """
  Gets a single person_skill.

  Raises `Ecto.NoResultsError` if the Person skill does not exist.

  ## Examples

      iex> get_person_skill!(123)
      %PersonSkill{}

      iex> get_person_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person_skill!(id), do: Repo.get!(PersonSkill, id)

  @doc """
  Creates a person_skill.

  ## Examples

      iex> create_person_skill(%{field: value})
      {:ok, %PersonSkill{}}

      iex> create_person_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person_skill(attrs \\ %{}) do
    %PersonSkill{}
    |> PersonSkill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person_skill.

  ## Examples

      iex> update_person_skill(person_skill, %{field: new_value})
      {:ok, %PersonSkill{}}

      iex> update_person_skill(person_skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person_skill(%PersonSkill{} = person_skill, attrs) do
    person_skill
    |> PersonSkill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PersonSkill.

  ## Examples

      iex> delete_person_skill(person_skill)
      {:ok, %PersonSkill{}}

      iex> delete_person_skill(person_skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person_skill(%PersonSkill{} = person_skill) do
    Repo.delete(person_skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person_skill changes.

  ## Examples

      iex> change_person_skill(person_skill)
      %Ecto.Changeset{source: %PersonSkill{}}

  """
  def change_person_skill(%PersonSkill{} = person_skill) do
    PersonSkill.changeset(person_skill, %{})
  end

  @doc """
  Returns the list of people_locations.

  ## Examples

      iex> list_people_locations()
      [%PersonLocation{}, ...]

  """
  def list_people_locations do
    Repo.all(PersonLocation)
  end

  @doc """
  Gets a single person_location.

  Raises `Ecto.NoResultsError` if the Person location does not exist.

  ## Examples

      iex> get_person_location!(123)
      %PersonLocation{}

      iex> get_person_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person_location!(id), do: Repo.get!(PersonLocation, id)

  @doc """
  Creates a person_location.

  ## Examples

      iex> create_person_location(%{field: value})
      {:ok, %PersonLocation{}}

      iex> create_person_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person_location(attrs \\ %{}) do
    %PersonLocation{}
    |> PersonLocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person_location.

  ## Examples

      iex> update_person_location(person_location, %{field: new_value})
      {:ok, %PersonLocation{}}

      iex> update_person_location(person_location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person_location(%PersonLocation{} = person_location, attrs) do
    person_location
    |> PersonLocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PersonLocation.

  ## Examples

      iex> delete_person_location(person_location)
      {:ok, %PersonLocation{}}

      iex> delete_person_location(person_location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person_location(%PersonLocation{} = person_location) do
    Repo.delete(person_location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person_location changes.

  ## Examples

      iex> change_person_location(person_location)
      %Ecto.Changeset{source: %PersonLocation{}}

  """
  def change_person_location(%PersonLocation{} = person_location) do
    PersonLocation.changeset(person_location, %{})
  end
end
