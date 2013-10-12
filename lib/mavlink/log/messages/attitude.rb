module MAVLink; module Log; module Messages

  class Attitude < TimedMessageMilli

    # radians (-pi..pi)
    def roll
      @roll ||= float(0..3)
    end

    # radians (-pi..pi)
    def pitch
      @pitch ||= float(4..7)
    end

    # radians (-pi..pi)
    def yaw
      @yaw ||= float(8..11)
    end

    # rad/s
    def rollspeed
      @rollspeed ||= float(12..15)
    end

    # rad/s
    def pitchspeed
      @pitchspeed ||= float(16..19)
    end

    # rad/s
    def yawspeed
      @yawspeed ||= float(20..23)
    end

  end

end; end; end
