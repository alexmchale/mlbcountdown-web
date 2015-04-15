namespace :xmlstats do

  task :teams => %i( environment ) do
    Xmlstats.mlb_teams.each do |team_data|
      team = Team.find_or_initialize_by(abbreviation: team_data.abbreviation.downcase)

      team.first_name = team_data.first_name
      team.last_name  = team_data.last_name
      team.full_name  = team_data.full_name

      team.save!
    end

    sleep 10.0 # max 6 per minute
  end

  task :current_events => %i( environment teams ) do
    # This will actually sync yesterday, today and tomorrow
    ( -2 .. 3 ).each do |date_offset|
      date = Date.today + date_offset

      Xmlstats.events(date, :mlb).each do |event_data|
        event   = Event.find_by(event_id: event_data.event_id)
        event ||= Event.new(event_id: event_data.event_id)

        event.home_team  = Team.find_or_create_by(abbreviation: event_data.home_team.abbreviation.downcase)
        event.away_team  = Team.find_or_create_by(abbreviation: event_data.away_team.abbreviation.downcase)
        event.state      = event_data.event_status
        event.time       = event_data.start_date_time
        event.home_score = event_data.home_points_scored
        event.away_score = event_data.away_points_scored

        event.save!
      end

      sleep 10.0 # max 6 per minute
    end
  end

end
