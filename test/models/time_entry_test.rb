require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase

  describe '#grouped_by_project_and_day' do
    before do
      create_entry('Anders', 2.hours.ago, 1.hour.ago)
      create_entry('Anders', 4.hours.ago, 2.hour.ago)
      create_entry('Tapir', 2.hours.ago, 1.hour.ago)
      @entries = TimeEntryTest.grouped_by_project_and_day
    end

    it 'contains two items' do
      assert_equal(2, @entries.length)
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
