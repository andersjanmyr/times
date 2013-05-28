class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.grouped_by_project_and_day
    TimeEntry.joins(:project).select(<<-EOSQL
    projects.name as project_name,
    projects.external_name as external_name,
    date(clocked_in) as date,
    date_trunc('minutes', sum(clocked_out - clocked_in)) as total
    EOSQL
    ).group('project_name, external_name, date').order('date desc, project_name')
  end
end
