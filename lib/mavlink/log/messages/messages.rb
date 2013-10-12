module MAVLink; module Log; module Messages

  class HeartBeat < Message

    def initialize(entry)
      super
    end

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

  class SysStatus < Message

    def initialize(entry)
      super
    end

    def onboard_control_sensors_present
      @onboard_control_sensors_present ||= uint32_t(0..3)
    end

    def onboard_control_sensors_enabled
      @onboard_control_sensors_enabled ||= uint32_t(4..7)
    end

    def onboard_control_sensors_health
      @onboard_control_sensors_health ||= uint32_t(8..11)
    end

    # 0%..100%
    def load
      @load ||= (uint16_t(12..13) / 10.0)
    end

    # V
    def voltage_battery
      @load ||= (uint16_t(14..15) / 1000.0)
    end

    # A (-1: not measured)
    def current_battery
      @load ||= (int16_t(16..17) / 100.0)
    end

    # 0%..100% (-1: not measured)
    def battery_remaining
      @battery_remaining ||= uint8_t(18)
    end

    # 0%..100% (bad packet %age)
    def drop_rate_comm
      @drop_rate_comm ||= (uint16_t(19..20) / 100)
    end

    def errors_comm
      @errors_comm ||= uint16_t(21..22)
    end

    def errors_count1
      @errors_count1 ||= uint16_t(23..24)
    end

    def errors_count2
      @errors_count2 ||= uint16_t(25..26)
    end

    def errors_count3
      @errors_count3 ||= uint16_t(27..28)
    end

    def errors_count4
      @errors_count4 ||= uint16_t(29..30)
    end

  end

  class Attitude < TimedMessage

    attr_accessor :roll, :pitch, :yaw, :rollspeed, :pitchspeed, :yawspeed

    def initialize(entry)
      super
      #@roll = raw_payload[0..3].unpack('e')[0]          # radians (-pi..pi)
      #@pitch = raw_payload[4..7].unpack('e')[0]         # radians (-pi..pi)
      #@yaw = raw_payload[8..11].unpack('e')[0]          # radians (-pi..pi)
      #@rollspeed = raw_payload[12..15].unpack('e')[0]   # rad/s
      #@pitchspeed = raw_payload[16..19].unpack('e')[0]  # rad/s
      #@yawspeed = raw_payload[20..23].unpack('e')[0]    # rad/s
    end
  end

  class GlobalPositionInt < TimedMessage

    attr_accessor :lat, :lon, :alt, :relative_alt, :vx, :vy, :vz, :hdg

    def initialize(entry)
      super
      #@lat = raw_payload[4..7].unpack('l<')[0] / 10000000.0         # dec. degrees
      #@lon = raw_payload[8..11].unpack('l<')[0] / 10000000.0        # dec. degrees
      #@alt = raw_payload[12..15].unpack('l<')[0] / 1000.0           # meters
      #@relative_alt = raw_payload[16..19].unpack('l<')[0] / 1000.0  # meters
      #@vx = raw_payload[20..21].unpack('s<')[0] / 100.0             # m/s
      #@vy = raw_payload[22..23].unpack('s<')[0] / 100.0             # m/s
      #@vz = raw_payload[24..25].unpack('s<')[0] / 100.0             # m/s
      #@hdg = raw_payload[26..27].unpack('S<')[0] / 100.0            # degrees (0.0..359.99) (0xFFFF if unknown)
    end

  end

  class VfrHud <  Message

    attr_accessor :airspeed, :groundspeed, :heading, :throttle, :alt, :climb

    def initialize(entry)
      super
      #@airspeed = raw_payload[0..3].unpack('e')[0]      # m/s
      #@groundspeed = raw_payload[4..7].unpack('e')[0]   # m/s
      #@heading = raw_payload[8..9].unpack('s<')[0]      # degrees (0..360)
      #@throttle = raw_payload[10..11].unpack('S<')[0]   # 0..100%
      #@alt = raw_payload[12..15].unpack('e')[0]         # meters (MSL)
      #@climb = raw_payload[16..19].unpack('e')[0]       # m/s
    end

  end

end; end; end
