module ApplicationHelper
  def time_24_hour
    current_time = Time.now
    current_time.strftime("%H:%M")
  end

  def full_date
    today = Date.today
    "#{today.strftime('%A')}  #{today.strftime('%B')},  #{today.strftime('%d')} of  #{today.strftime('%Y')}"
  end

  def time_and_date
    "It's " + time_24_hour + " on " + full_date
  end

  def hidden_div_if(condition,attributes={},&block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div",attributes,&block)
  end

end
