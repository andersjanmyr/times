require 'minitest/autorun'

require 'times/time_entry_parser'

module Times

  describe TimeEntryParser do

    before do
      @data = <<-EOD
"Job","Clocked In","Clocked Out","Duration","Hourly Rate","Earnings","Comment","Tags"
"Studentlitteratur","2013-05-22 08:24","2013-05-22 11:54","3,5","850,00","2 975,00","",""
"Studentlitteratur","2013-05-22 12:22","2013-05-22 14:47","2,42","850,00","2 054,17","",""
"Studentlitteratur","2013-05-23 08:16","2013-05-23 11:46","3,5","850,00","2 975,00","",""
"Studentlitteratur","2013-05-23 12:05","2013-05-23 15:14","3,15","850,00","2 677,50","",""
"Studentlitteratur","2013-05-24 08:08","2013-05-24 16:17","8,15","850,00","6 927,50","",""
"Das bok","2013-05-21 19:23","2013-05-21 19:32","0,15","850,00","127,50","",""
"Das bok","2013-05-22 20:09","2013-05-22 20:31","0,37","850,00","311,67","",""
"Das bok","2013-05-23 16:58","2013-05-23 17:11","0,22","850,00","184,17","",""
"Øredev","2013-05-21 20:06","2013-05-21 20:30","0,4","0,00","0,00","",""
"Øredev","2013-05-21 20:35","2013-05-21 20:48","0,22","0,00","0,00","",""
"Øredev","2013-05-22 08:42","2013-05-22 08:58","0,27","0,00","0,00","",""
"Øredev","2013-05-22 13:57","2013-05-22 13:57","0","0,00","0,00","",""
"Øredev","2013-05-22 14:10","2013-05-22 14:25","0,25","0,00","0,00","",""
"Øredev","2013-05-22 18:27","2013-05-22 18:33","0,1","0,00","0,00","",""
      EOD
    end

    describe '#parse' do
      before do
        @entries = TimeEntryParser.parse(@data)
      end
      it 'returns one entry per line' do
        assert_equal(14, @entries.length)
      end
      it 'return entry with correct values' do
        entry = @entries[0]
        assert_equal('Studentlitteratur', entry[:job])
        assert_equal(DateTime.parse('2013-05-22 08:24'), entry[:clocked_in])
        assert_equal(DateTime.parse('2013-05-22 11:54'), entry[:clocked_out])
      end
    end
  end

end
