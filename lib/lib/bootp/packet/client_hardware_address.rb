# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class ClientHardwareAddress

        include Comparable

        def initialize(chaddr)
          raise ArgumentError, "Can't convert #{chaddr.class.name} to String" unless chaddr.respond_to? :to_s
          clear_chaddr = chaddr.to_s.gsub(/([:\-.,])/, '').to_s
          raise ArgumentError, "Given CHADDR is to long: #{chaddr}" if clear_chaddr.size > 32
          @chaddr = [clear_chaddr.ljust(32, '0')].pack('H32').unpack('C*')
        end

        def to_s(len = nil)
          unless len.nil? || len.is_a?(Integer)
            raise ArgumentError "Len must be a Integer or nil, #{len.class.name} given"
          end
          raise ArgumentError "Len out of range: #{len}" if len.to_i > 16 || len.to_i < 0
          (len ? @chaddr[0..(len - 1)] : @chaddr).map{ |item| item.to_s(16).rjust(2, '0') }.join(':')
        end

        def <=>(other)
          clear_other = other.to_s.gsub(/([:\-.,])/, '').to_s
          @chaddr <=> [clear_other.ljust(32, '0')].pack('H32').unpack('C*')
        end

        def to_a
          @chaddr
        end

        def pack
          [@chaddr.map{ |item| item.to_s(16).rjust(2, '0') }.join('')].pack('H32')
        end

        def self.unpack(packet)
          new packet.unpack('H32').first.to_s
        end
      end
    end
  end
end