require 'open-uri'

module MAVLink
  module Log

    class File

      attr_reader :entries, :messages

      # Determines if the file at the given URI is a MAVLink telemetry log file.
      #
      # @param uri URI to file to read
      # @return [MAVLink::Log::File] loaded file if the file is a MAVLink log file, nil otherwise
      def self.mavlink?(uri)
        File.new(uri) rescue nil
      end

      def initialize(uri)
        @entries = []
        @messages = []
        open(uri, 'rb') do |file|
          loop do
            raw_time = file.read(8)
            break if raw_time.nil?

            header = Header.new(file.read(6))
            raise "Unexpected magic number (#{header.magic})" unless header.magic == 0xFE

            payload = file.read(header.length)
            raw_crc = file.read(2)
            @entries << Entry.new(raw_time, header, payload, raw_crc)
            @messages << Messages::Factory.build(@entries.last)
          end
        end

        if @entries.empty?
          raise 'No entries found in file'
        end
      rescue => e
        unless @entries.length >= 2
          # bad ending message, give the file benefit of the doubt...
          raise ArgumentError, "File does not appear to be a MAVLink log (#{e})"
        end
      end

      # Gets the duration of the session, in seconds.
      #
      # @return [Float] duration of the session, in seconds
      def duration
        return 0 if @entries.empty?
        ended_at - started_at
      end

      # Gets the starting time as a Unix Epoch time stamp in seconds.
      #
      # @return [Float] unix epoch time the log began
      def started_at
        time_in_seconds(@entries.first.time)
      end

      # Gets the ending time as a Unix Epoch time stamp in seconds.
      #
      # @return [Float] unix epoch time the log ended
      def ended_at
        time_in_seconds(@entries.last.time)
      end

      private

      def time_in_seconds(stamp)
        stamp / 1000000.0
      end

    end

  end
end
