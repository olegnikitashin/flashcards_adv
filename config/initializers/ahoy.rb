class Ahoy::Store < Ahoy::Stores::ActiveRecordTokenStore
  Ahoy.quiet = false
  Ahoy.track_visits_immediately = true
  Ahoy.geocode = :async
end
