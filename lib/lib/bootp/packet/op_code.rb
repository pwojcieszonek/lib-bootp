#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 14.03.2016 by Piotr Wojcieszonek

require 'forwardable'
require 'json'
#require 'comparable'

module Lib
  module BOOTP
    class Packet
      class OpCode

        extend Forwardable
        include Comparable

        def_delegator :@op, :to_i

        def initialize(op=1)
          @op = op.is_a?(Hash) ? op.transform_keys(&:to_sym)[:code].to_i : op
          raise ArgumentError, "OP Code out of range : #{@op}" unless [1,2].include? @op.to_i
        end

        def to_s
          if @op == 1
            'BOOTREQUEST'
          elsif @op == 2
            'BOOTREPLY'
          end
        end

        def to_json(*params)
          self.to_h.to_json
        end

        def to_h
          {
            code: @op.to_s,
            name: self.to_s
          }
        end

        def <=>(other)
          return self.to_i <=> other if other.is_a?(Integer)
          self.to_s <=> other.to_s.upcase
        end

        def pack
          [@op.to_i].pack('C')
        end

        def self.unpack(op)
          self.new op.unpack('C').first
        end
      end
    end
  end
end