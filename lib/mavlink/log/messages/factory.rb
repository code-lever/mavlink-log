module MAVLink; module Log; module Messages

  class Dummy
    def initialize(entry)
      #puts entry.header.inspect
    end
  end

  class Factory

    def self.build(entry)
      case(entry.header.id)
      when 0;   HeartBeat.new(entry)
      when 1;   SysStatus.new(entry)
      when 21;  ParamRequestList.new(entry)
      when 22;  ParamValue.new(entry)
      when 24;  GpsRawInt.new(entry)
      when 27;  RawImu.new(entry)
      when 29;  ScaledPressure.new(entry)
      when 30;  Attitude.new(entry)
      when 33;  GlobalPositionInt.new(entry)
      when 35;  RcChannelsRaw.new(entry)
      when 36;  ServoOutputRaw.new(entry)
      when 42;  MissionCurrent.new(entry)
      when 62;  NavControllerOutput.new(entry)
      when 66;  RequestDataStream.new(entry)
      when 74;  VfrHud.new(entry)
      when 150..240; Dummy.new(entry)
      else
        puts entry.header.inspect
        nil
      end
    end

  end

end; end; end
