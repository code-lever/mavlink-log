module MAVLink; module Log; module Messages

  class ParamRequestList < Message

    def target_system
      @target_system ||= uint8_t(0)
    end

    def target_component
      @target_component ||= uint8_t(1)
    end

  end

end; end; end
