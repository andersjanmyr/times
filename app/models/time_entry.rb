class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.grouped_by_project_and_day
    select('project_id, date(clocked_in) as date, sum(clocked_out - clocked_in) as total').group('project_id, date(clocked_in)')
  end
end
