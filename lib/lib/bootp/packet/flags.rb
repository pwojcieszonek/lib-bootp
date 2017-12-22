#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 17.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class Flags

        extend Forwardable
        include Comparable

        def_delegator :@flag, :to_i

        def initialize(flags=0)
          @flags = {}
          @flag = 0
          if flags.is_a? Integer
            case flags
              when 0x8000
                @flags[:b] = 1
                @flag = 0x8000
              when 0
                @flags[:b] = 0
                @flag = 0
              else
                raise ArgumentError, "Unknown flags value #{flags}"
            end
          elsif flags.is_a? Symbol
            case flags
              when :broadcast
                @flags[:b] = 1
                @flag = 0x8000
              when :unicast
                @flags[:b] = 0
                @flag = 0
              else
                raise ArgumentError, "Unknown flags value #{flags}"
            end
          else
            raise ArgumentError, 'FLAGS must by an Integer or Symbol' unless flags.is_a?(Integer) or flags.is_a?(Symbol)
          end
        end

        def <=>(other)
          other = Lib::BOOTP::Packet::Flags.new(other) unless other.is_a?(Lib::BOOTP::Packet::Flags)
          self.to_i <=> other.to_i
        end

        def broadcast?
          @flags[:b] == 1 ? true : false
        end

        def broadcast
          @flags[:b]
        end

        def to_s
          "0x#{@flag.to_s(16)}"
        end

        def pack
          [@flag.to_i].pack('n')
        end

        def self.unpack(flags)
          self.new flags.unpack('n').first
        end

        alias_method :to_hex, :to_s

      end
    end
  end
end