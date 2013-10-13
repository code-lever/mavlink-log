module MAVLink; module Log; module Messages

  class NavControllerOutput < Message

    def nav_roll
      @nav_roll ||= float(0..3)
    end

    def nav_pitch
      @nav_pitch ||= float(4..7)
    end

    def alt_error
      @alt_error ||= float(8..11)
    end

    def aspd_error
      @aspd_error ||= float(12..15)
    end

    def xtrack_error
      @xtrack_error ||= float(16..19)
    end

    def nav_bearing
      @nav_bearing ||= int16_t(20..21)
    end

    def target_bearing
      @target_bearing ||= int16_t(22..23)
    end

    def wp_dist
      @wp_dist ||= uint16_t(24..25)
    end

  end

end; end; end
