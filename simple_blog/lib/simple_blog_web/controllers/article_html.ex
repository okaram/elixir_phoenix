defmodule SimpleBlogWeb.ArticleHTML do
  use SimpleBlogWeb, :html

  def md_to_html(md) do
    case Earmark.as_html(md) do
      {:ok, html, _messages} ->
          IO.inspect(html)
          {:safe, HtmlSanitizeEx.basic_html(html)}
      {:error, _html, _messages} -> {:safe,"Errors converting markdown"}
    end
  end

  embed_templates "article_html/*"
end
