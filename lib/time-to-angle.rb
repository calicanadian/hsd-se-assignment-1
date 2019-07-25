def prepare_time_string(time)
  ampm_regexp = /\PM|\AM|\pm|\am/
  am_pm = time.gsub(ampm_regexp, '').strip.split(":")
  hour = am_pm[0].to_i
  minute = am_pm[1].to_i
  result = time_as_angle(hour, minute)
  result
end

def hour_angle(hour)
  # if the hour is greater than 6, subtract from 12
  # this is so we can return an angle for 9 as 90 not 270
  hour = (hour > 6) ? (12 - hour) : hour
  # multiply the hour by 30 to get the angle
  # 6 * 30 = 180
  # 3 * 30 = 90
  angle = (hour * 30)
  angle
end

def minute_angle(minute)
  # if the minute is greater than 30 (half hour), subtract from 60 (full hour)
  # this is so we can return 0 - 90 for minutes 31 - 60
  minute = (minute > 30) ? (60 - minute) : minute
  # multiply the minute by 6 to get the angle
  # 30 * 6 = 180
  # 15 * 6 = 90
  angle = (minute * 6)
  angle
end

def time_as_angle(hour, minute)
  hour_hand_angle = hour_angle(hour)
  minute_hand_angle = minute_angle(minute)
  angle = (hour_hand_angle - minute_hand_angle)
  # use the abs ruby method to translate negative numbers to positive numbers
  # -34.56.abs = 34.56
  angle.abs
end


puts "Enter a time:"
time = gets.chomp
angle = prepare_time_string(time)
puts angle
