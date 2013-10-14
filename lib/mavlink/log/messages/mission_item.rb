module MAVLink; module Log; module Messages

  class MissionItem < Message

    def param1
      @param1 ||= float(0..3)
    end

    def param2
      @param2 ||= float(4..7)
    end

    def param3
      @param3 ||= float(8..11)
    end

    def param4
      @param4 ||= float(12..15)
    end

    def x
      @x ||= float(16..19)
    end

    def y
      @y ||= float(20..23)
    end

    def z
      @z ||= float(24..27)
    end

    def seq
      @seq ||= uint16_t(28..29)
    end

    def command
      @command ||= uint16_t(30..31)
    end

    def target_system
      @target_system ||= uint8_t(32)
    end

    def target_component
      @target_component ||= uint8_t(33)
    end

    def frame
      @frame ||= uint8_t(34)
    end

    def current
      @current ||= !!uint8_t(35)
    end

    def autocontinue
      @autocontinue ||= !!uint8_t(36)
    end

  end

end; end; end
