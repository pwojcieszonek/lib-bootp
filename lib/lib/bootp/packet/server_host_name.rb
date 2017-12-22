#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class ServerHostName
        extend Forwardable
        include Comparable

        def_delegator :@sname, :to_s

        def initialize(sname='.')
          raise ArgumentError, "Can't convert #{sname.class.name} to String" unless sname.respond_to? :to_s
          raise ArgumentError, "Given Server Host Name is to long: #{sname}" if sname.to_s.size > 64
          @sname = sname.to_s
        end

        def <=>(other)
          self.to_s <=> other.to_s
        end

        def pack
          [@sname].pack('a64')
        end

        def self.unpack(packet)
          new packet.unpack('a64').first.to_s
        end

      end
    end
  end
end