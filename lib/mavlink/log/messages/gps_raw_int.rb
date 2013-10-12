module MAVLink; module Log; module Messages

  class GpsRawInt < TimedMessageMicro

    # WGS84 dec. degrees
    def lat
      @lat ||= (int32_t(8..11) / 10000000.0)
    end

    # WGS84 dec. degrees
    def lon
      @lon ||= (int32_t(12..15) / 10000000.0)
    end

    # meters
    def alt
      @alt ||= (int32_t(16..19) / 1000.0)
    end

    # meters
    def eph
      @eph ||= (uint16_t(20..21) / 100.0)
    end

    # meters
    def epv
      @epv ||= (uint16_t(22..23) / 100.0)
    end

    # m/s
    def vel
      @vel ||= (uint16_t(24..25) / 100.0)
    end

    # degrees 0..359.99
    def cog
      @cog ||= (uint16_t(26..27) / 100.0)
    end

    def fix_type
      @fix_type ||= uint8_t(28)
    end

    def satellites_visible
      @satellites_visible ||= uint8_t(29)
    end

  end

end; end; end
