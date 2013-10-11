require 'open-uri'

module MAVLink
  module Log

    class File

      attr_reader :records, :flights

      # Determines if the file at the given URI is a MAVLink telemetry log file.
      #
      # @param uri URI to file to read
      # @return [MAVLink::Log::File] loaded file if the file is a MAVLink log file, nil otherwise
      def self.mavlink?(uri)
        File.new(uri) rescue nil
      end

      def initialize(uri)
        open(uri, 'rb') do |file|
          loop do
            stamp = file.read(8)
            break
          end
        end
      rescue
        raise ArgumentError, 'File does not appear to be an MAVLink log'
      end

      def duration
        0
      end

      # Determines if KML methods can be called for this file.
      #
      # @return [Boolean] true if KML can be generated for this file, false otherwise
      def to_kml?
        false
      end

    end

  end
end
