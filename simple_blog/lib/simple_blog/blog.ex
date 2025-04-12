defmodule SimpleBlog.Blog do
  import Ecto.Query, warn: false

  alias SimpleBlog.Repo
  alias SimpleBlog.Blog.Article

  def list_articles() do
    Repo.all(Article)
  end

  def get_article!(id) do
    Repo.get(Article,id)
  end

  def change_article(%Article{} = article, attrs \\ %{}) do
    Article.changeset(article, attrs)
  end

  def create_article(attrs \\ %{}) do
    %Article{}
    |> Article.changeset(attrs)
    |> Repo.insert()
  end

  def update_article(%Article{} = article, attrs) do
    article
    |> Article.changeset(attrs)
    |> Repo.update()
  end

  def delete_article(%Article{} = article) do
    Repo.delete(article)
  end

  def delete_article(something) do
    IO.inspect(something)
    inspect(something)
  end

end
