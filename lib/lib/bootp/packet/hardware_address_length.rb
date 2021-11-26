#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class HardwareAddressLength

        extend Forwardable
        include Comparable

        def_delegators :@hlen, :to_s, :to_i

        def initialize(hlen=6)
          @hlen = hlen.to_i
        end

        def pack
          [@hlen.to_i].pack('C')
        end

        def <=>(other)
          self.to_i <=> other.to_i
        end

        def self.unpack(hlen)
          self.new hlen.unpack('C').first
        end
      end
    end
  end
end