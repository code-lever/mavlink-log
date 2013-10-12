require 'open-uri'

module MAVLink
  module Log

    USEC_PER_SEC = 1000000.0

    Header = Struct.new(:magic, :length, :sequence, :system, :component, :id)

    Entry = Struct.new(:time, :header, :payload, :crc)

    class File

      attr_accessor :entries, :messages

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

            time = to_time(raw_time)
            header = to_header(file.read(6))
            payload = file.read(header.length)
            crc = file.read(2).unpack('S>')[0]
            @entries << Entry.new(time, header, payload, crc)
            @messages << MessageFactory.build(@entries.last)
          end
        end
      rescue => e
        raise ArgumentError, "File does not appear to be an MAVLink log (#{e})"
      end

      # Gets the duration of the session, in seconds.
      #
      # @return [Float] duration of the session, in seconds
      def duration
        return 0 if @entries.empty?
        (@entries.last.time - @entries.first.time) / USEC_PER_SEC
      end

      def started_at
        Time.at(@entries.first.time / USEC_PER_SEC)
      end

      def ended_at
        Time.at(@entries.last.time / USEC_PER_SEC)
      end

      # Determines if KML methods can be called for this file.
      #
      # @return [Boolean] true if KML can be generated for this file, false otherwise
      def to_kml?
        @messages.any? { |msg| msg.is_a? GlobalPositionInt }
      end

      private

      def to_time(raw_time)
        (raw_time[0..3].unpack('L>')[0] << 32) | raw_time[4..7].unpack('L>')[0]
      end

      def to_header(raw_header)
        magic = raw_header[0].unpack('C')[0]
        length = raw_header[1].unpack('C')[0]
        sequence = raw_header[2].unpack('C')[0]
        system = raw_header[3].unpack('C')[0]
        component = raw_header[4].unpack('C')[0]
        id = raw_header[5].unpack('C')[0]
        Header.new(magic, length, sequence, system, component, id)
      end

    end

  end
end
