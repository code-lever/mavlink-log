module MAVLink; module Log; module Messages

  class VfrHud <  Message

    # m/s
    def airspeed
      @airspeed ||= float(0..3)
    end

    # m/s
    def groundspeed
      @groundspeed ||= float(4..7)
    end

    # 0..360
    def heading
      @heading ||= int16_t(8..9)
    end

    # 0..100%
    def throttle
      @throttle ||= uint16_t(10..11)
    end

    # meters (MSL)
    def alt
      @alt ||= float(12..15)
    end

    # m/s
    def climb
      @climb ||= float(16..19)
    end

  end

end; end; end
