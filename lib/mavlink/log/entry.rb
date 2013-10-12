module MAVLink
  module Log

    class Entry

      attr_reader :time, :header, :payload, :crc

      def initialize(raw_time, header, payload, raw_crc)
        @time = to_time(raw_time)
        @header = header
        @payload = payload
        @crc = to_crc(raw_crc)

        if false && header.id==27
          puts raw_time.unpack('H*')
          puts payload.unpack("H*")
          puts raw_crc.unpack('H*')
        end
      end

      private

      def to_time(raw)
        (raw[0..3].unpack('L>')[0] << 32) | raw[4..7].unpack('L>')[0]
      end

      def to_crc(raw)
        raw.unpack('S>')[0]
      end

    end

  end
end
