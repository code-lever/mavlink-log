module MAVLink; module Log; module Messages

  class ScaledPressure < TimedMessageMilli

    # absolute pressure (hectopascal)
    def press_abs
      @press_abs ||= float(4..7)
    end

    # differential pressure (hectopascal)
    def press_diff
      @press_diff ||= float(8..11)
    end

    # temperature (C)
    def temperature(unit = :c)
      @temperature ||= (int16_t(12..13) / 100.0)
      case unit
      when :f
        (@temperature * (9.0 / 5.0)) + 32
      else
        @temperature
      end
    end

  end

end; end; end
