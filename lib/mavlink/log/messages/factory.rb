module MAVLink; module Log; module Messages

  class Factory

    def self.build(entry)
      case(entry.header.id)
      when 0;  HeartBeat.new(entry)
      when 1;  SysStatus.new(entry)
      when 30; Attitude.new(entry)
      when 33; GlobalPositionInt.new(entry)
      when 74; VfrHud.new(entry)
      else
        #puts entry.header.inspect
        nil
      end
    end

  end

end; end; end
