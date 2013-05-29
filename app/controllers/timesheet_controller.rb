class TimesheetController < ApplicationController
  before_action :authenticate_user!

  def index
    @project_entries = project_entries
  end

  private

  def project_entries
    groups = TimeEntry.where(user: current_user).grouped_by_project
    groups.map do |group|
      [Project.find(group[0]), group[1]]
    end
  end
end
