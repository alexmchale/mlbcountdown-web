json.team do
  json.abbreviation @team.abbreviation
  json.first_name   @team.first_name
  json.last_name    @team.last_name
  json.full_name    @team.full_name
end

json.opponent do
  json.abbreviation @opponent.abbreviation
  json.first_name   @opponent.first_name
  json.last_name    @opponent.last_name
  json.full_name    @opponent.full_name
end

json.game do
  json.state      @event.state
  json.time       @event.time.iso8601
  json.home_score @event.home_score
  json.away_score @event.away_score
  json.verb       @event.home_team == @team ? "vs" : "at"
end
