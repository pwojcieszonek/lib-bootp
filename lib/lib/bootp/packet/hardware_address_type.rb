#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 14.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class HardwareAddressType

        extend Forwardable
        include Comparable

        def_delegator :@htype, :to_i

        def initialize(htype=1)
          @htype = htype.is_a?(Hash) ? htype.transform_keys(&:to_sym)[:code].to_i : htype
          raise ArgumentError, "Hardware address type out of range : #{@htype}" unless (0..12).include? @htype
        end

        def to_s
          case @htype
            when 0
              'Lease Query'
            when 1
              'Ethernet (10Mb)'
            when 2
              'Experimental Ethernet (3Mb)'
            when 3
              'Amateur Radio AX.25'
            when 4
              'Proteon ProNET Token Ring'
            when 5
              'Chaos'
            when 6
              'IEEE 802 Networks'
            when 7
              'ARCNET'
            when 8
              'Hyperchannel'
            when 9
              'Lanstar'
            when 10
              'Autonet Short Address'
            when 11
              'LocalTalk'
            when 12
              'LocalNet (IBM PCNet or SYTEK LocalNET)'
            else
              raise ArgumentError, "Hardware address type out of range : #{@htype}"
          end
        end

        def to_json(*params)
          self.to_h.to_json
        end

        def to_h
          {
            code: @htype.to_s,
            name: self.to_s
          }
        end

        def <=>(other)
          case other
            when String
              self.to_s <=> other
            when Integer
              self.to_i <=> other
            else
              self.to_i <=> other.to_i
          end
        end

        def pack
          [@htype.to_i].pack('C')
        end

        def self.unpack(htype)
          self.new htype.unpack('C').first
        end
      end
    end
  end
end