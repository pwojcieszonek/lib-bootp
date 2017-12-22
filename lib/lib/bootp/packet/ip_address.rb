# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require 'forwardable'
require 'ipaddr'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class IPAddress
        extend Forwardable
        include Comparable

        def_delegators :@ip, :to_s, :to_i

        def initialize(ip)
          @ip = if ip.is_a?(IPAddr)
                  ip
                else
                  raise ArgumentError, "Wrong IP Address #{ip}" if ip.nil? || ip == ''
                  IPAddr.new(ip, Socket::AF_INET)
                end
          raise ArgumentError, "Wrong IP Address #{ip}" unless @ip.is_a?(IPAddr)
        end

        def <=>(other)
          other = IPAddr.new(other, Socket::AF_INET) unless other.is_a?(IPAddr)
          self.to_i <=> other.to_i
        end

        def pack
          @ip = 0 if @ip.nil?
          [@ip.to_i].pack('N')
        end

        def self.unpack(ip)
          new ip.to_s.unpack('N').first.to_i
        end

      end
    end
  end
end