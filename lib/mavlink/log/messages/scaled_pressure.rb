module MAVLink; module Log; module Messages

  class ScaledPressure < TimedMessageMilli

    def press_abs
      @press_abs ||= float(4..7)
    end

    def press_diff
      @press_diff ||= float(8..11)
    end

    def temperature
      @temperature ||= int16_t(12..13)
    end

  end

end; end; end
