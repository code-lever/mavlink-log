module MAVLink; module Log; module Messages

  class StatusText < Message

    def severity
      @severity ||= uint8_t(0)
    end

    def text
      @text ||= string(1..50)
    end

  end

end; end; end
