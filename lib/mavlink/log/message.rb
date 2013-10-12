module MAVLink; module Log

  class Message

    def initialize(entry)
      @entry = entry
    end

    def id
      @entry.header.id
    end

    def crc
      @entry.crc
    end

    protected

    def float(range)
      unpack(range, 'e')
    end

    def int8_t(range)
      unpack(range, 'c')
    end

    def uint8_t(range)
      unpack(range, 'C')
    end

    def int16_t(range)
      unpack(range, 's<')
    end

    def uint16_t(range)
      unpack(range, 'S<')
    end

    def int32_t(range)
      unpack(range, 'l<')
    end

    def uint32_t(range)
      unpack(range, 'L<')
    end

    private

    def payload
      @entry.payload
    end

    def unpack(range, format, index = 0)
      payload[range].unpack(format)[index]
    end

  end

  class TimedMessageMilli < Message

    attr_accessor :time_boot_ms

    def time_boot_ms
      @time_boot_ms ||= uint32_t(0..3)
    end

  end

  class TimedMessageMicro < Message

    attr_accessor :time_usec

    def time_usec
      @time_usec ||= ((uint32_t(0..3) << 32) | uint32_t(4..7))
    end

  end

end; end
