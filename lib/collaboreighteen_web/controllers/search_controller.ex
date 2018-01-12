defmodule CollaboreighteenWeb.SearchController do
  use CollaboreighteenWeb, :controller

  alias Collaboreighteen.Offerings

  action_fallback(CollaboreighteenWeb.FallbackController)

  def index(conn, %{}) do
    render(conn, "index.json", skills: Offerings.list_skills())
  end

  def search(conn, %{"query" => search_query}) do
    render(conn, "search.json", results: [])
  end
end
