module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image, :published_at, :status)
  end

  def status_for(article)
    if article.published_at?
      if article.published_at > Time.zone.now
        "Scheduled"
      else
        "Published"
      end
    else
      "Draft"
    end
  end
end
