defmodule CollaboreighteenWeb.Router do
  use CollaboreighteenWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", CollaboreighteenWeb do
    pipe_through(:api)
    resources("/people", PersonController, except: [:new, :edit])
    resources("/locations", LocationController, except: [:new, :edit])
    resources("/skills", SkillController, except: [:new, :edit])

    resources("/people_skills", PersonSkillController, except: [:new, :edit])
    resources("/people_locations", PersonLocationController, except: [:new, :edit])

    get("/all", SearchController, :index)
    get("/search", SearchController, :search)
  end
end
