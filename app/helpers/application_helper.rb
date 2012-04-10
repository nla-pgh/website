module ApplicationHelper

  def latest_news(number)
    Refinery::News::Item.latest(number[:count])
  end

  def timeline
    Twitter.user_timeline("NLA_Pittsburgh", include_entities: true)
  end

	def prezi
		raw = copywriting('Front Page Presentation', scope: 'Home Page', phrase_type: 'text')
		if raw
			extract_params = /(<param.*<\/embed>)/.match(raw)[1]
			append_opaque = "<param name='wmode' value='opaque'>\n" + extract_params

			# Replace heights and width (to 100%)
			append_opaque.gsub(/height="\d*"/, 'height="100%"').gsub(/width="\d*"/, 'width="100%"')
		end
	end

	def mission
		Refinery::Page.find_by_title("Our Mission")
	end

	def vision
		Refinery::Page.find_by_title("Our Vision")
	end

	def take_action
		Refinery::Page.find_by_title("Take Action")
	end

end
