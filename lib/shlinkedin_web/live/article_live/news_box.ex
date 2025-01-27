defmodule ShlinkedinWeb.ArticleLive.NewsBox do
  use ShlinkedinWeb, :live_component

  alias Shlinkedin.News
  alias Shlinkedin.News.Article
  alias Shlinkedin.Profiles.Profile

  def handle_event("clap", _params, %{assigns: %{profile: profile, article: article}} = socket) do
    if News.is_first_vote_on_article?(profile, article),
      do: News.delete_vote(profile, article),
      else: News.create_vote(profile, article)

    {:noreply, socket}
  end

  def is_first_vote_on_article?(%Profile{} = profile, %Article{} = article) do
    News.is_first_vote_on_article?(profile, article)
  end
end
