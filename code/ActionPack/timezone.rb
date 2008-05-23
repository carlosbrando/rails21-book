# BEGIN default
time_zone_select("user", "time_zone", nil, :include_blank => true) 
time_zone_select("user", "time_zone", nil, :default => "Pacific Time (US & Canada)" ) 
time_zone_select( "user", 'time_zone', TimeZone.us_zones, :default => "Pacific Time (US & Canada)")
# END default