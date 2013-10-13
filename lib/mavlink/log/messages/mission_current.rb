module MAVLink; module Log; module Messages

  class MissionCurrent < Message

    def seq
      @seq ||= uint16_t(0..1)
    end

  end

end; end; end
