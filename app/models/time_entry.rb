class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.grouped_by_project_and_day
    TimeEntry.select(<<-EOSQL
      project_id,
      date(clocked_in) as date,
      date_trunc('minutes', sum(clocked_out - clocked_in)) as total
    EOSQL
    ).group('project_id, date').order('date desc, project_id asc')
  end

  def self.grouped_by_project
    groups = grouped_by_project_and_day.to_a.group_by do |e|
      e.project_id
    end
  end
end
