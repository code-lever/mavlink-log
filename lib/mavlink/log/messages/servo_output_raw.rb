module MAVLink; module Log; module Messages

  class ServoOutputRaw < TimedMessageMicro

    def servo1_raw
      @servo1_raw ||= uint16_t(4..5)
    end

    def servo2_raw
      @servo2_raw ||= uint16_t(6..7)
    end

    def servo3_raw
      @servo3_raw ||= uint16_t(8..9)
    end

    def servo4_raw
      @servo4_raw ||= uint16_t(10..11)
    end

    def servo5_raw
      @servo5_raw ||= uint16_t(12..13)
    end

    def servo6_raw
      @servo6_raw ||= uint16_t(14..15)
    end

    def servo7_raw
      @servo7_raw ||= uint16_t(16..17)
    end

    def servo8_raw
      @servo8_raw ||= uint16_t(18..19)
    end

    def port
      @port ||= uint8_t(20)
    end

  end

end; end; end
