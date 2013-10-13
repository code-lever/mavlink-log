module MAVLink; module Log; module Messages

  class RequestDataStream < Message

    def req_message_rate
      @req_message_rate ||= uint16_t(0..1)
    end

    def target_system
      @target_system ||= uint8_t(2)
    end

    def target_component
      @target_component ||= uint8_t(3)
    end

    def req_stream_id
      @req_stream_id ||= uint8_t(4)
    end

    def start_stop
      @start_stop ||= uint8_t(5)
    end

  end

end; end; end
