module MAVLink; module Log; module Messages

  class HeartBeat < Message

    def type
      @type ||= uint8_t(0)
    end

    def autopilot
      @autopilot ||= uint8_t(1)
    end

    def base_mode
      @base_mode ||= uint8_t(2)
    end

    def custom_mode
      @custom_mode ||= uint32_t(3..6)
    end

    def system_status
      @system_status ||= uint8_t(7)
    end

    def mavlink_version
      @mavlink_version ||= uint8_t(8)
    end

  end

end; end; end
