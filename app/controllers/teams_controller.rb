class TeamsController < ApplicationController

  def current_state
    @team  = Team.where("id = ? OR LOWER(abbreviation) = LOWER(?)", params[:id].to_i, params[:id]).first
    @event = @team.currently_interesting_event

    @opponent =
      if @event
        @event.home_team == @team ? @event.away_team : @event.home_team
      end
  end

end
