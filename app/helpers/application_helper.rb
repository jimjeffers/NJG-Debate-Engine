# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def full_date(time=nil)
    time = Time.now if time.nil?
    time.strftime("%A, %B #{time.day.ordinalize}, %Y")
  end
  
  def short_date(time=nil)
    time = Time.now if time.nil?
    time.strftime("%b %d %I:%M%p")
  end
  
  def web_friendly(str)
    str.split(" ").each{|i| i.downcase! }.join("-").gsub!(/[^a-zA-Z0-9\-]/,'')
  end
  
end
