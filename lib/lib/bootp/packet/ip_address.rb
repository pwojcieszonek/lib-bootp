# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require 'forwardable'
require 'net/address'


module Lib
  module BOOTP
    class Packet
      class IPAddress < ::Net::Address::IPv4

        def pack
          [self.to_i].pack('N')
        end

        def self.unpack(ip)
          new ip.to_s.unpack('N').first.to_i
        end

      end
    end
  end
end