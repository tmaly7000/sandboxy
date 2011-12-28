require 'time'

module ApiUsersHelper

  def DateFormat(date)
      #dt = Time.parse(date)
      date.strftime("%m/%d/%Y - %I:%M%p")
  end
end
