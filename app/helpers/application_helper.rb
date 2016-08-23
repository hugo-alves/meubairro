module ApplicationHelper

  def icon_weather(tag)
    case tag
    when "clear"
      render "icons/sunny"
    when "rain"
      render "icons/big_rain"
    when "thunderstorm"
      render "icons/storm"
    when "drizzle"
      render "icons/small_rain"
    when "snow"
      render "icons/snow"
    when "clouds"
      render "icons/cloudy"
    when "extreme"
      render "icons/storm"
    when "cold"
      render "icons/cold"
    else
      render "icons/hot"
    end
  end

end


