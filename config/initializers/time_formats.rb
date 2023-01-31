# "11/18/2022"
Time::DATE_FORMATS[:date_short] = "%m/%d/%Y"

# "January  1, 2000"
Time::DATE_FORMATS[:date] = "%B %-e, %Y"
Time::DATE_FORMATS[:date_long] = Time::DATE_FORMATS[:date]

# "Nov 18, 8:00am MST"
Time::DATE_FORMATS[:dt_short] = "%b %-e, %-l:%M%P %Z"

# "Nov 18, 2022 - 8:01am MST"
Time::DATE_FORMATS[:default] = "%b %-e, %Y - %-l:%M%P"
Time::DATE_FORMATS[:dt] = Time::DATE_FORMATS[:default]

# "November 18, 2022 - 8:02am MST"
Time::DATE_FORMATS[:dt_tz] = "%B %-e, %Y - %-l:%M%P %Z"

# "1:01am"
Time::DATE_FORMATS[:time] = "%-l:%M%P"

# "1:01:00am"
Time::DATE_FORMATS[:time_long] = "%-l:%M:%S%P"

# "19:01:00"
Time::DATE_FORMATS[:time_mil] = "%H:%M:%S"
Time::DATE_FORMATS[:time_military] = Time::DATE_FORMATS[:time_mil]
