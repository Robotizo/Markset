module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end

	def stripe_url
		"https://dashboard.stripe.com/oauth/authorize?response_type=code&client_id=ca_CiwROK7GO3kkQW5cJzC144PZqNmaTPC9&scope=read_write"
	end


end