require 'times/time_entry_parser'

class TimeEntriesController < ApplicationController
  def new

  end

  def create
    entries = Times::TimeEntryParser.parse(params[:data])
    failed_entries = []
    entries.each do |entry|
      failed_entries << entry unless create_entry(entry)
    end

    if failed_entries.empty?
      redirect_to timesheet_index_path, notice: "#{entries.length} entries uploaded"
    else
      format.html { render action: 'new' }
    end
  end

  private

  def create_entry entry
    TimeEntry.find_or_create_by({
      user_id: current_user.id,
      project_id: Project.find_or_create_by(name: entry.job).id,
      clocked_in: entry.clocked_in,
      clocked_out: entry.clocked_out,
      comment: entry.comment
    })
  end
end
