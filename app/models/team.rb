class Team < ActiveRecord::Base

  def events
    Event.where("home_team_id = ? OR away_team_id = ?", id, id)
  end

  def currently_interesting_event
    # Find an active event.
    event = events.order("time DESC").find_by("time <= ? AND state = ?", Time.now, :scheduled)
    return event if event

    # Find the next scheduled event.
    event = events.order("time ASC").find_by("time > ? AND state = ?", Time.now, :scheduled)
    return event if event

    # Find the most recent event
    event = events.order("time DESC").find_by("time <= ?", Time.now)
    return event if event
  end

end
