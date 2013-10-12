module MAVLink
  module Log

    class Message

      class << self
        attr_accessor :id
      end

    end

    class TimedMessage < Message

      attr_accessor :time_boot_ms

      def initialize(raw_payload)
        @time_boot_ms = raw_payload[0..3].unpack('L<')[0]
      end

    end

    class HeartBeat < Message

      ID = 0

      attr_accessor :type, :autopilot, :base_mode, :custom_mode, :system_status, :mavlink_version

      def initialize(raw_payload)
        @type = raw_payload[0].unpack('C')[0]
        @autopilot = raw_payload[1].unpack('C')[0]
        @base_mode = raw_payload[2].unpack('C')[0]
        @custom_mode = raw_payload[3..6].unpack('L<')[0]
        @system_status = raw_payload[7].unpack('C')[0]
        @mavlink_version = raw_payload[8].unpack('C')[0]
      end

    end

    class SysStatus < Message

      ID = 1

      attr_accessor :onboard_control_sensors_present, :onboard_control_sensors_enabled,
                    :onboard_control_sensors_health, :load, :voltage_battery, :current_battery,
                    :battery_remaining, :drop_rate_comm, :errors_comm,
                    :errors_count1, :errors_count2, :errors_count3, :errors_count4

      def initialize(raw_payload)
        @onboard_control_sensors_present = raw_payload[0..3].unpack('L<')[0]  #
        @onboard_control_sensors_enabled = raw_payload[4..7].unpack('L<')[0]  #
        @onboard_control_sensors_health = raw_payload[8..11].unpack('L<')[0]  #
        @load = raw_payload[12..13].unpack('S<')[0] / 10.0                    # 0%..100%
        @voltage_battery = raw_payload[14..15].unpack('S<')[0] / 1000.0       # V
        @current_battery = raw_payload[16..17].unpack('s<')[0] / 100.0        # A (-1: not measured)
        @battery_remaining = raw_payload[18].unpack('C')[0]                   # 0%..100% (-1: not measured)
        @drop_rate_comm = raw_payload[19..20].unpack('S<')[0] / 100           # 0%..100% (bad packet %age)
        @errors_comm = raw_payload[21..22].unpack('S<')[0]                    # bad packet count
        @errors_count1 = raw_payload[23..24].unpack('S<')[0]                  #
        @errors_count2 = raw_payload[25..26].unpack('S<')[0]                  #
        @errors_count3 = raw_payload[27..28].unpack('S<')[0]                  #
        @errors_count4 = raw_payload[29..30].unpack('S<')[0]                  #
      end

    end

    class Attitude < TimedMessage

      ID = 30

      attr_accessor :roll, :pitch, :yaw, :rollspeed, :pitchspeed, :yawspeed

      def initialize(raw_payload)
        super
        @roll = raw_payload[0..3].unpack('e')[0]          # radians (-pi..pi)
        @pitch = raw_payload[4..7].unpack('e')[0]         # radians (-pi..pi)
        @yaw = raw_payload[8..11].unpack('e')[0]          # radians (-pi..pi)
        @rollspeed = raw_payload[12..15].unpack('e')[0]   # rad/s
        @pitchspeed = raw_payload[16..19].unpack('e')[0]  # rad/s
        @yawspeed = raw_payload[20..23].unpack('e')[0]    # rad/s
      end
    end

    class GlobalPositionInt < TimedMessage

      ID = 33

      attr_accessor :lat, :lon, :alt, :relative_alt, :vx, :vy, :vz, :hdg

      def initialize(raw_payload)
        super
        @lat = raw_payload[4..7].unpack('l<')[0] / 10000000.0         # dec. degrees
        @lon = raw_payload[8..11].unpack('l<')[0] / 10000000.0        # dec. degrees
        @alt = raw_payload[12..15].unpack('l<')[0] / 1000.0           # meters
        @relative_alt = raw_payload[16..19].unpack('l<')[0] / 1000.0  # meters
        @vx = raw_payload[20..21].unpack('s<')[0] / 100.0             # m/s
        @vy = raw_payload[22..23].unpack('s<')[0] / 100.0             # m/s
        @vz = raw_payload[24..25].unpack('s<')[0] / 100.0             # m/s
        @hdg = raw_payload[26..27].unpack('S<')[0] / 100.0            # degrees (0.0..359.99) (0xFFFF if unknown)
      end

    end

    class VfrHud <  Message

      ID = 74

      attr_accessor :airspeed, :groundspeed, :heading, :throttle, :alt, :climb

      def initialize(raw_payload)
        @airspeed = raw_payload[0..3].unpack('e')[0]      # m/s
        @groundspeed = raw_payload[4..7].unpack('e')[0]   # m/s
        @heading = raw_payload[8..9].unpack('s<')[0]      # degrees (0..360)
        @throttle = raw_payload[10..11].unpack('S<')[0]   # 0..100%
        @alt = raw_payload[12..15].unpack('e')[0]         # meters (MSL)
        @climb = raw_payload[16..19].unpack('e')[0]       # m/s
      end

    end

    class MessageFactory

      def self.build(entry)
        case(entry.header.id)
        when HeartBeat::ID; HeartBeat.new(entry.payload)
        when SysStatus::ID; SysStatus.new(entry.payload)
        when Attitude::ID; Attitude.new(entry.payload)
        when GlobalPositionInt::ID; GlobalPositionInt.new(entry.payload)
        when VfrHud::ID; VfrHud.new(entry.payload)
        else
          #puts entry.header.inspect
          nil
        end
      end

    end

  end
end
