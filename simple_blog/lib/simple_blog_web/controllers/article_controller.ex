defmodule SimpleBlogWeb.ArticleController do
  use SimpleBlogWeb, :controller
  alias SimpleBlog.Blog
  alias SimpleBlog.Blog.Article
  use Phoenix.Component
  def index(conn, _params) do
    articles = Blog.list_articles()
    render(conn, :index, articles: articles)
  end

  def show(conn, %{"id" => id}) do
    article = Blog.get_article!(id)
    render(conn, :show, article: article)
  end


  def new(conn, _params) do
    changeset = Blog.change_article(%Article{})
    form = to_form(changeset)
    render(conn, :new, changeset: changeset, form: form)
  end

  def create(conn, %{"article" => article_params}) do
    case Blog.create_article(article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article created successfully.")
        |> redirect(to: ~p"/articles/#{article}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    article = Blog.get_article!(id)
    changeset = Blog.change_article(article,%{})
    render(conn, :edit, article: article, changeset: changeset)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Blog.get_article!(id)

    case Blog.update_article(article, article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article updated successfully.")
        |> redirect(to: ~p"/articles/#{article}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, article: article, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Blog.get_article!(id)
    {:ok, _article} = Blog.delete_article(article)

    conn
    |> put_flash(:info, "Article deleted successfully.")
    |> redirect(to: ~p"/articles")
  end

end
