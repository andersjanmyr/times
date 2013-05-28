require 'times/time_entry_parser'

class TimeEntriesController < ApplicationController
  def new

  end

  def create
    entries = Times::TimeEntryParser.parse(params[:data])
    time_entries = entries.map do |entry|
      {
        user_id: current_user.id,
        project_id: Project.find_or_create_by(name: entry[:job]).id,
        clocked_in: entry[:clocked_in],
        clocked_out: entry[:clocked_out]
      }
    end
    if TimeEntry.create(time_entries)
      redirect_to timesheet_index_path, notice: "#{entries.length} entries uploaded"
    else
      format.html { render action: 'new' }
    end
  end
end
