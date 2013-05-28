class TimesheetController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries =TimeEntry.where(user: current_user).grouped_by_project_and_day
  end
end
