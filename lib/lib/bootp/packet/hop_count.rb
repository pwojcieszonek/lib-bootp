# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class HopCount

        extend Forwardable
        include Comparable

        def_delegators :@hops, :to_s, :to_i

        def initialize(hops=0)
          raise ArgumentError, "Hop Count out of range: #{hops}" if hops > 255
          @hops = hops
        end

        def <=>(other)
          self.to_i <=> other.to_i
        end

        def pack
          [@hops.to_i].pack('C')
        end

        def self.unpack(hops)
          self.new hops.unpack('C').first
        end
      end
    end
  end
end