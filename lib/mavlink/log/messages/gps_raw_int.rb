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

    # :mps (m/s)
    # :knots
    # :mph
    # :kph
    def vel(unit = :mps)
      @vel ||= (uint16_t(24..25) / 100.0)
      speed_convert(@vel, unit)
    end

    # degrees 0..359.99
    def cog
      @cog ||= (uint16_t(26..27) / 100.0)
    end

    # 0-1: no fix, 2: 2D fix, 3: 3D fix
    def fix_type
      @fix_type ||= uint8_t(28)
    end

    def satellites_visible
      @satellites_visible ||= uint8_t(29)
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
