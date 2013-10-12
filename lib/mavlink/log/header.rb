module MAVLink
  module Log

    class Header

      attr_reader :magic, :length, :sequence, :system, :component, :id

      def initialize(raw_header)
        @magic = raw_header[0].unpack('C')[0]
        @length = raw_header[1].unpack('C')[0]
        @sequence = raw_header[2].unpack('C')[0]
        @system = raw_header[3].unpack('C')[0]
        @component = raw_header[4].unpack('C')[0]
        @id = raw_header[5].unpack('C')[0]
      end

    end

  end
end
