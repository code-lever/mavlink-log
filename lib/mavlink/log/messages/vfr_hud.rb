module MAVLink; module Log; module Messages

  class VfrHud < Message

    # :mps (m/s)
    # :knots
    # :mph
    # :kph
    def airspeed(unit = :mps)
      @airspeed ||= float(0..3)
      speed_convert(@airspeed, unit)
    end

    # :mps (m/s)
    # :knots
    # :mph
    # :kph
    def groundspeed(unit = :mps)
      @groundspeed ||= float(4..7)
      speed_convert(@groundspeed, unit)
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

    # :mps (m/s)
    # :knots
    # :mph
    # :kph
    def climb(unit = :mps)
      @climb ||= float(16..19)
      speed_convert(@climb, unit)
    end

    private

    def speed_convert(value, unit = :mps)
      case unit
      when :knots; value * 1.9438444924406
      when :mph;   value * 2.2369362920544025
      when :kph;   value * 3.6
      else;        value
      end
    end

  end

end; end; end
