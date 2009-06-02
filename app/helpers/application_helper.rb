# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def full_date(time=Time.now)
    time.strftime("%A, %B #{time.day.ordinalize}, %Y")
  end
  
  def short_date(time=Time.now)
    time.strftime("%b %d %I:%M%p")
  end
end
