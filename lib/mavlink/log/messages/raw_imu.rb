module MAVLink; module Log; module Messages

  class RawImu < TimedMessageMicro

    def xacc
      @xacc ||= int16_t(8..9)
    end

    def yacc
      @yacc ||= int16_t(10..11)
    end

    def zacc
      @zacc ||= int16_t(12..13)
    end

    def xgyro
      @xgyro ||= int16_t(14..15)
    end

    def ygyro
      @ygyro ||= int16_t(16..17)
    end

    def zgyro
      @zgyro ||= int16_t(18..19)
    end

    def xmag
      @xmag ||= int16_t(20..21)
    end

    def ymag
      @ymag ||= int16_t(22..23)
    end

    def zmag
      @zmag ||= int16_t(24..25)
    end

  end

end; end; end
