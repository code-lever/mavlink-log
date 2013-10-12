module MAVLink; module Log; module Messages

  class GlobalPositionInt < TimedMessageMilli

    # dec. degrees
    def lat
      @lat ||= (int32_t(4..7) / 10000000.0)
    end

    # dec. degrees
    def lon
      @lon ||= (int32_t(8..11) / 10000000.0)
    end

    # meters
    def alt
      @alt ||= (int32_t(12..15) / 1000.0)
    end

    # meters
    def relative_alt
      @relative_alt ||= (int32_t(16..19) / 1000.0)
    end

    # m/s
    def vx
      @vx ||= (int16_t(20..21) / 100.0)
    end

    # m/s
    def vy
      @vy ||= (int16_t(22..23) / 100.0)
    end

    # m/s
    def vz
      @vz ||= (int16_t(24..25) / 100.0)
    end

    # degrees (0.0..359.99) (0xFFFF if unknown)
    def hdg
      @hdg ||= (uint16_t(26..27) / 100.0)
    end

  end

end; end; end
