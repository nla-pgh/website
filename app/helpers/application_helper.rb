module ApplicationHelper

  def image_url(source)
      abs_path = image_path(source)
      unless abs_path =~ /\Ahttp/
          abs_path = "http://neighborhoodlearning.org/#{abs_path}"
      end
      abs_path
  end

  def latest_news(number)
    Refinery::News::Item.latest(number[:count])
  end

  def safe_truncate(text, options = {})
    truncate(text, options).gsub(/<[^p]*\.\.\./, "...")
  end

  def timeline
    Twitter.user_timeline("NLA_Pittsburgh", count: 1)
  end

	def prezi
		raw = copywriting('Front Page Presentation', scope: 'Home Page', phrase_type: 'text')
		if raw
      match = /(<param.*)<embed (.*)><\/embed>/.match(raw)
      if match
        extract_params = match[1]
        append_opaque = "<param name='wmode' value='opaque' />" + extract_params

        extract_embed = match[2]
        append_opaque = "#{append_opaque} <embed #{extract_embed} wmode=\"opaque\" />" 

        # Replace heights and width (to 100%)
        append_opaque.gsub(/height="\d*"/, 'height="100%"').gsub(/width="\d*"/, 'width="100%"')
      else
        nil
      end
		end
	end

	def mission
		Refinery::Page.find_by_title("Mission Statement")
	end

	def vision
		Refinery::Page.find_by_title("Vision Statement")
	end

	def take_action
		Refinery::Page.find_by_title("Take Action")
	end

  def home
    if @page and @page.home?
      true
    else
      false
    end
  end

  def carousel_images
    raw = copywriting('Carousel Images', scope: 'Home Page', phrase_type: 'text')
    if raw
      YAML.load(raw)
    else
      []
    end
  end
end
