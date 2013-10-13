module MAVLink; module Log; module Messages

  class ParamValue < Message

    def param_value
      @param_value ||= float(0..3)
    end

    def param_count
      @param_count ||= uint16_t(4..5)
    end

    def param_index
      @param_index ||= uint16_t(6..7)
    end

    def param_id
      @param_id ||= string(8..23)
    end

    def param_type
      @param_type ||= uint8_t(24)
    end

  end

end; end; end
