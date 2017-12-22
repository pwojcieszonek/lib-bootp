# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class BootFile

        extend Forwardable
        include Comparable

        def_delegator :@file, :to_s

        def initialize(file = '.')
          raise ArgumentError, "Can't convert #{file.class.name} to String" unless file.respond_to? :to_s
          raise ArgumentError, "Given Server Host Name is to long: #{file}" if file.to_s.size > 128
          @file = file.to_s
        end

        def <=>(other)
          self.to_s <=> other.to_s
        end

        def pack
          [@file].pack('a128')
        end

        def self.unpack(packet)
          new packet.unpack('a128').first.to_s
        end

      end
    end
  end
end