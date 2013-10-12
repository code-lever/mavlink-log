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

    def initialize(entry)
      super
    end

    # radians (-pi..pi)
    def roll
      @roll ||= float(0..3)
    end

    # radians (-pi..pi)
    def pitch
      @pitch ||= float(4..7)
    end

    # radians (-pi..pi)
    def yaw
      @yaw ||= float(8..11)
    end

    # rad/s
    def rollspeed
      @rollspeed ||= float(12..15)
    end

    # rad/s
    def pitchspeed
      @pitchspeed ||= float(16..19)
    end

    # rad/s
    def yawspeed
      @yawspeed ||= float(20..23)
    end

  end

  class GlobalPositionInt < TimedMessage

    attr_accessor :lat, :lon, :alt, :relative_alt, :vx, :vy, :vz, :hdg

    def initialize(entry)
      super
    end

    # dec. degrees
    def lat
      @lat ||= (int32_t(4..7) / 10000000.0)
    end

    # dec. degrees
    def lon
      @lon ||= (int32_t(8..11) / 10000000.0)
    end

    # meters
    def alt
      @alt ||= (int32_t(12..15) / 1000.0)
    end

    # meters
    def relative_alt
      @relative_alt ||= (int32_t(16..19) / 1000.0)
    end

    # m/s
    def vx
      @vx ||= (int16_t(20..21) / 100.0)
    end

    # m/s
    def vy
      @vy ||= (int16_t(22..23) / 100.0)
    end

    # m/s
    def vz
      @vz ||= (int16_t(24..25) / 100.0)
    end

    # degrees (0.0..359.99) (0xFFFF if unknown)
    def hdg
      @hdg ||= (uint16_t(26..27) / 100.0)
    end

  end

  class VfrHud <  Message

    def initialize(entry)
      super
    end

    # m/s
    def airspeed
      @airspeed ||= float(0..3)
    end

    # m/s
    def groundspeed
      @groundspeed ||= float(4..7)
    end

    # 0..360
    def heading
      @heading ||= int16_t(8..9)
    end

    # 0..100%
    def throttle
      @throttle ||= uint16_t(10..11)
    end

    # meters (MSL)
    def alt
      @alt ||= float(12..15)
    end

    # m/s
    def climb
      @climb ||= float(16..19)
    end

  end

end; end; end
