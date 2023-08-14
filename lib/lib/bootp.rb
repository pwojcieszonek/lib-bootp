# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require 'lib/bootp/version'
require 'lib/bootp/packet/op_code'
require 'lib/bootp/packet/hardware_address_type'
require 'lib/bootp/packet/hardware_address_length'
require 'lib/bootp/packet/hop_count'
require 'lib/bootp/packet/transaction_id'
require 'lib/bootp/packet/seconds'
require 'lib/bootp/packet/flags'
require 'lib/bootp/packet/ip_address'
require 'lib/bootp/packet/server_host_name'
require 'lib/bootp/packet/boot_file'
require 'lib/bootp/packet/client_hardware_address'
require 'json'

module Lib
  module BOOTP
    class Packet

      class << self
        private

        def hash_attr_reader(hash_name, *key_names)
          key_names.each do |key_name|
            define_method key_name do
              instance_variable_get("@#{hash_name}")[key_name]
            end
          end
        end
      end


      hash_attr_reader :packets, :op, :htype, :hlen, :hops, :xid, :secs, :flags, :ciaddr, :yiaddr, :siaddr, :giaddr, :chaddr, :sname, :file

      def initialize(op: 1, htype: 1, hlen: 6, hops: 0, xid: nil, secs: 0, flags: 0, ciaddr: 0, yiaddr: 0, siaddr: 0, giaddr: 0, chaddr: nil, sname: '.', file: '.')
        @packets = {}
        if block_given?
          yield self
        else
          @packets[:op]     = (op.is_a? Lib::BOOTP::Packet::OpCode) ? op : Lib::BOOTP::Packet::OpCode.new(op)
          @packets[:htype]  = (htype.is_a? Lib::BOOTP::Packet::HardwareAddressType) ? htype : Lib::BOOTP::Packet::HardwareAddressType.new(htype)
          @packets[:hlen]   = (hlen.is_a? Lib::BOOTP::Packet::HardwareAddressLength) ? hlen : Lib::BOOTP::Packet::HardwareAddressLength.new(hlen)
          @packets[:hops]   = (hops.is_a? Lib::BOOTP::Packet::HopCount) ? hops : Lib::BOOTP::Packet::HopCount.new(hops)
          @packets[:xid]    = (xid.is_a? Lib::BOOTP::Packet::TransactionID) ? xid : Lib::BOOTP::Packet::TransactionID.new(xid)
          @packets[:secs]   = (secs.is_a? Lib::BOOTP::Packet::Seconds) ? secs : Lib::BOOTP::Packet::Seconds.new(secs)
          @packets[:flags]  = (flags.is_a? Lib::BOOTP::Packet::Flags) ? flags : Lib::BOOTP::Packet::Flags.new(flags)
          @packets[:ciaddr] = (ciaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? ciaddr : Lib::BOOTP::Packet::IPAddress.new(ciaddr)
          @packets[:yiaddr] = (yiaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? yiaddr : Lib::BOOTP::Packet::IPAddress.new(yiaddr)
          @packets[:siaddr] = (siaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? siaddr : Lib::BOOTP::Packet::IPAddress.new(siaddr)
          @packets[:giaddr] = (giaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? giaddr : Lib::BOOTP::Packet::IPAddress.new(giaddr)
          @packets[:chaddr] = (chaddr.is_a? Lib::BOOTP::Packet::ClientHardwareAddress) ? chaddr : Lib::BOOTP::Packet::ClientHardwareAddress.new(chaddr)
          @packets[:sname]  = (sname.is_a? Lib::BOOTP::Packet::ServerHostName) ? sname : Lib::BOOTP::Packet::ServerHostName.new(sname)
          @packets[:file]   = (file.is_a? Lib::BOOTP::Packet::BootFile) ? file : Lib::BOOTP::Packet::BootFile.new(file)
        end
      end

      def op=(op)
        @packets[:op] = (op.is_a? Lib::BOOTP::Packet::OpCode) ? op : Lib::BOOTP::Packet::OpCode.new(op)
      end

      def htype=(htype)
        @packets[:htype] = (htype.is_a? Lib::BOOTP::Packet::HardwareAddressType) ? htype : Lib::BOOTP::Packet::HardwareAddressType.new(htype)
      end

      def hlen=(hlen)
        @packets[:hlen] = (hlen.is_a? Lib::BOOTP::Packet::HardwareAddressLength) ? hlen : Lib::BOOTP::Packet::HardwareAddressLength.new(hlen)
      end

      def hops=(hops)
        @packets[:hops] = (hops.is_a? Lib::BOOTP::Packet::HopCount) ? hops : Lib::BOOTP::Packet::HopCount.new(hops)
      end

      def xid=(xid)
        @packets[:xid] = (xid.is_a? Lib::BOOTP::Packet::TransactionID) ? xid : Lib::BOOTP::Packet::TransactionID.new(xid)
      end

      def secs=(secs)
        @packets[:secs] = (secs.is_a? Lib::BOOTP::Packet::Seconds) ? secs : Lib::BOOTP::Packet::Seconds.new(secs)
      end

      def flags=(flags)
        @packets[:flags] = (flags.is_a? Lib::BOOTP::Packet::Flags) ? flags : Lib::BOOTP::Packet::Flags.new(flags)
      end

      def ciaddr=(ciaddr)
        @packets[:ciaddr] = (ciaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? ciaddr : Lib::BOOTP::Packet::IPAddress.new(ciaddr)
      end

      def yiaddr=(yiaddr)
        @packets[:yiaddr] = (yiaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? yiaddr : Lib::BOOTP::Packet::IPAddress.new(yiaddr)
      end

      def siaddr=(siaddr)
        @packets[:siaddr] = (siaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? siaddr : Lib::BOOTP::Packet::IPAddress.new(siaddr)
      end

      def giaddr=(giaddr)
        @packets[:giaddr] = (giaddr.is_a? Lib::BOOTP::Packet::IPAddress) ? giaddr : Lib::BOOTP::Packet::IPAddress.new(giaddr)
      end

      def chaddr=(chaddr)
        @packets[:chaddr] = (chaddr.is_a? Lib::BOOTP::Packet::ClientHardwareAddress) ? chaddr : Lib::BOOTP::Packet::ClientHardwareAddress.new(chaddr)
      end

      def sname=(sname)
        @packets[:sname] = (sname.is_a? Lib::BOOTP::Packet::ServerHostName) ? sname : Lib::BOOTP::Packet::ServerHostName.new(sname)
      end

      def file=(file)
        @packets[:file] = (file.is_a? Lib::BOOTP::Packet::BootFile) ? file : Lib::BOOTP::Packet::BootFile.new(file)
      end


      def to_h
        @packets
      end

      def to_s
        "OP:        #{self.op}"+
            "\nHTYPE:     #{self.htype}"+
            "\nHLEN:      #{self.hlen}"+
            "\nHOPS:      #{self.hops}"+
            "\nXID:       #{self.xid}"+
            "\nSECS:      #{self.secs}"+
            "\nFLAGS:     #{self.flags}"+
            "\nCIADDR:    #{self.ciaddr}"+
            "\nYIADDR:    #{self.yiaddr}"+
            "\nSIADDR:    #{self.siaddr}"+
            "\nGIADDR:    #{self.giaddr}"+
            "\nCHADDR:    #{self.chaddr}"+
            "\nSNAME:     #{self.sname}"+
            "\nFILE:      #{self.file}"
      end

      def pack
        self.op.pack +
            self.htype.pack +
            self.hlen.pack +
            self.hops.pack +
            self.xid.pack +
            self.secs.pack +
            self.flags.pack +
            self.ciaddr.pack +
            self.yiaddr.pack +
            self.siaddr.pack +
            self.giaddr.pack +
            self.chaddr.pack +
            self.sname.pack +
            self.file.pack
      end

      def self.unpack(packet)
        op, htype, hlen, hops, xid, secs, flags, ciaddr, yiaddr, siaddr, giaddr, chaddr, sname, file = packet.unpack('C4NnnN4a16a64a128')
        op = Lib::BOOTP::Packet::OpCode.new op
        htype = Lib::BOOTP::Packet::HardwareAddressType.new htype
        hlen = Lib::BOOTP::Packet::HardwareAddressLength.new hlen
        hops = Lib::BOOTP::Packet::HopCount.new hops
        xid = Lib::BOOTP::Packet::TransactionID.new xid
        secs = Lib::BOOTP::Packet::Seconds.new secs
        flags = Lib::BOOTP::Packet::Flags.new flags
        ciaddr = Lib::BOOTP::Packet::IPAddress.new ciaddr
        yiaddr = Lib::BOOTP::Packet::IPAddress.new yiaddr
        siaddr = Lib::BOOTP::Packet::IPAddress.new siaddr
        giaddr = Lib::BOOTP::Packet::IPAddress.new giaddr
        chaddr = Lib::BOOTP::Packet::ClientHardwareAddress.unpack chaddr
        sname = Lib::BOOTP::Packet::ServerHostName.unpack sname
        file = Lib::BOOTP::Packet::BootFile.unpack file

        self.new(op:op, htype:htype, hlen:hlen, hops:hops, xid:xid, secs:secs, flags:flags, ciaddr:ciaddr, yiaddr:yiaddr, siaddr:siaddr, giaddr:giaddr, chaddr:chaddr, sname:sname, file:file)
      end

      def to_json
        to_h.to_json
      end

      def self.from_json(json)
        json = json.is_a?(Hash) ? json: JSON.parse(json)
        self.new do |p|
          json.each_pair do |k,v|
            p.send("#{k}=".to_sym, v) rescue NoMethodError
          end
        end
      end

    end
  end
end