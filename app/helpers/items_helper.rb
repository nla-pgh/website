module ItemsHelper

  def my_news_item_archive_widget
    items = Refinery::News::Item.select('publish_date').all_previous
    return nil if items.blank?

    render :partial => "/refinery/news/items/widgets/news_archive", :locals => { :items => congregate(items) }
  end

private
  
  def congregate(items, criteria = :date)
    hash = {}
    items.each do |item|
      key = item.publish_date.strftime("%Y/%m")
      temp = hash[key] || []
      hash[item.publish_date.strftime("%Y/%m")] = (temp << item)
    end
    hash
  end
end
