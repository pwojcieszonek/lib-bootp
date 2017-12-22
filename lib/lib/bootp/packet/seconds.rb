#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class Seconds

        extend Forwardable
        include Comparable

        def_delegators :@secs, :to_s, :to_i

        def initialize(secs=0)
          raise ArgumentError, "Seconds count out of range #{secs}" if secs.to_i < 0 or secs.to_i > 0xFFFF
          @secs = secs
        end

        def <=>(other)
          self.to_i <=> other.to_i
        end

        def pack
          [@secs.to_i].pack('n')
        end

        def self.unpack(secs)
          self.new secs.unpack('n').first
        end
      end
    end
  end
end