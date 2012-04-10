module ApplicationHelper

  def latest_news(number)
    Refinery::News::Item.latest(number[:count])
  end

  def timeline
    Twitter.user_timeline("NLA_Pittsburgh", include_entities: true)
  end
end
