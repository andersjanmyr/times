class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.grouped_by_project_and_day
    TimeEntry.joins(:project).select(<<-EOSQL
    projects.name as project_name,
    date(clocked_in) as date,
    sum(clocked_out - clocked_in) as total
    EOSQL
    ).group('project_name, date').order('date')
  end
end
