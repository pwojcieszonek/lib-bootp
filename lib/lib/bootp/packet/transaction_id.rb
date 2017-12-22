# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require 'forwardable'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class TransactionID

        extend Forwardable
        include Comparable

        def_delegators :@xid, :to_s, :to_i

        def initialize(xid = nil)
          xid = generate if xid.nil?
          unless xid >= 0 && xid <= 0xFFFFFFFF
            raise ArgumentError, "Not valid XID - #{xid} - should by 4 octet length"
          end
          @xid = xid
        end

        def <=>(other)
          self.to_i <=> other.to_i
        end

        def self.generate
          new Random.rand(0xFFFFFFFF)
        end

        def generate!
          @xid = generate
          self
        end

        def to_hex
          @xid.to_s(16)
        end

        def pack
          [@xid.to_i].pack('N')
        end

        def self.unpack(xid)
          new xid.unpack('N').first
        end

        private

        def generate
          Random.rand(0xFFFFFFFF)
        end
      end
    end
  end
end