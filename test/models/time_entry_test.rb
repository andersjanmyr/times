require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase

  describe '#grouped_by_project_and_day' do
    before do
      create_entry('Anders', 2.hours.ago, 1.hour.ago)
      create_entry('Anders', 4.hours.ago, 2.hour.ago)
      create_entry('Anders', 28.hours.ago, 27.hours.ago)
      create_entry('Tapir', 2.hours.ago, 1.hour.ago)
      @entries = TimeEntry.grouped_by_project_and_day
    end

    it 'contains three items' do
      assert_equal(3, @entries.length)
    end

    it 'contains the name, date and total' do
      entry = @entries.first
      assert_equal('Anders', entry.project_name)
      assert_equal(Date.today.to_s, entry.date)
      assert_equal(3, entry.total)
    end

  end

  private

  def create_entry(project_name, clocked_in, clocked_out)
    TimeEntry.create!({
      project: Project.find_or_create_by(name: project_name),
      clocked_in: clocked_in,
      clocked_out: clocked_out
    });
  end

end
