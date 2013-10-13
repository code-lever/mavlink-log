module MAVLink; module Log; module Messages

  class RcChannelsRaw < TimedMessageMilli

    def chan1_raw
      @chan1_raw ||= uint16_t(4..5)
    end

    def chan2_raw
      @chan2_raw ||= uint16_t(6..7)
    end

    def chan3_raw
      @chan3_raw ||= uint16_t(8..9)
    end

    def chan4_raw
      @chan4_raw ||= uint16_t(10..11)
    end

    def chan5_raw
      @chan5_raw ||= uint16_t(12..13)
    end

    def chan6_raw
      @chan6_raw ||= uint16_t(14..15)
    end

    def chan7_raw
      @chan7_raw ||= uint16_t(16..17)
    end

    def chan8_raw
      @chan8_raw ||= uint16_t(18..19)
    end

    def port
      @port ||= uint8_t(20)
    end

    def rssi
      @rssi ||= uint8_t(21)
    end

  end

end; end; end
