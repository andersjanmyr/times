require 'csv'

module Times
  Entry = Struct.new(:job, :clocked_in, :clocked_out, :comment)

  class TimeEntryParser

    # Parses CSV files as exported by HoursTracker app.
    # "Job","Clocked In","Clocked Out","Duration","Hourly Rate","Earnings","Comment","Tags"
    # "Studentlitteratur","2013-05-22 08:24","2013-05-22 11:54","3,5","850,00","2 975,00","",""
    def self.parse(data)
      table = CSV.parse(data, parse_options)
      table.each.map do |row|
        to_entry(row.fields(:job, :clocked_in, :clocked_out, :comment))
      end
    end

    def self.parse_options
      {
        headers: :first_row,
        header_converters: :symbol
      }
    end

    def self.to_entry values
      Entry.new(values[0],
                DateTime.parse(values[1]),
                DateTime.parse(values[2]),
                values[3])
    end
  end
end

