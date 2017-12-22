#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek


require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet do
  before(:each) do
    @bootrequest = Lib::BOOTP::Packet.new(chaddr: '00:11:22:33:44:55')
    @bootreply = Lib::BOOTP::Packet.new(op: 2, chaddr: '00:11:22:33:44:55')
  end
  describe '#new' do
    context 'BOOTREQUEST' do
      it 'Should return a Lib::BOOTP::Packet object' do
        expect(@bootrequest).to be_a_kind_of(Lib::BOOTP::Packet)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return a Lib::BOOTP::Packet object' do
        expect(@bootreply).to be_a_kind_of(Lib::BOOTP::Packet)
      end
    end
  end

  describe '.op' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::OpCode object' do
        expect(@bootrequest.op).to be_a_kind_of(Lib::BOOTP::Packet::OpCode)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::OpCode object' do
        expect(@bootreply.op).to be_a_kind_of(Lib::BOOTP::Packet::OpCode)
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return BOOTREQUEST message' do
          expect(@bootrequest.op.to_s).to eq 'BOOTREQUEST'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return BOOTREPLY message' do
          expect(@bootreply.op.to_s).to eq 'BOOTREPLY'
        end
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return 1' do
          expect(@bootrequest.op.to_i).to eq 1
        end
      end
      context 'BOOTREPLY' do
        it 'Should return 2' do
          expect(@bootreply.op.to_i).to eq 2
        end
      end
    end
  end

  describe '.htype' do
    context 'BOOTREQUEST' do
      it 'Should be Lib::BOOTP::Packet::HardwareAddressType object' do
        expect(@bootrequest.htype).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'BOOTREPLY' do
      it 'Should be Lib::BOOTP::Packet::HardwareAddressType object' do
        expect(@bootreply.htype).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end

    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return: Ethernet (10Mb)' do
          expect(@bootrequest.htype.to_s).to eq 'Ethernet (10Mb)'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return: Ethernet (10Mb)' do
          expect(@bootreply.htype.to_s).to eq 'Ethernet (10Mb)'
        end
      end
    end

    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return: 1' do
          expect(@bootrequest.htype.to_i).to eq 1
        end
      end
      context 'BOOTREPLY' do
        it 'Should return: 1' do
          expect(@bootreply.htype.to_i).to eq 1
        end
      end
    end

  end

  describe '.hlen' do
    context 'BOOTREQUEST' do
      it 'Should be Lib::BOOTP::Packet::HardwareAddressLength object' do
        expect(@bootrequest.hlen).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressLength)
      end
    end
    context 'BOOTREPLY' do
      it 'Should be Lib::BOOTP::Packet::HardwareAddressLength object' do
        expect(@bootreply.hlen).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressLength)
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return Hardware Address Length' do
          expect(@bootrequest.hlen.to_s).to eq '6'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Hardware Address Length' do
          expect(@bootreply.hlen.to_s).to eq '6'
        end
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return Hardware Address Length' do
          expect(@bootrequest.hlen.to_i).to eq 6
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Hardware Address Length' do
          expect(@bootreply.hlen.to_i).to eq 6
        end
      end
    end
  end

  describe '.hops' do
    context 'BOOTREQUEST' do
      it 'Should be Lib::BOOTP::Packet::HopCount object' do
        expect(@bootrequest.hops).to be_a_kind_of(Lib::BOOTP::Packet::HopCount)
      end
    end
    context 'BOOTREPLY' do
      it 'Should be Lib::BOOTP::Packet::HopCount object' do
        expect(@bootreply.hops).to be_a_kind_of(Lib::BOOTP::Packet::HopCount)
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'should return hop count' do
          expect(@bootrequest.hops.to_i).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'should return hop count' do
          expect(@bootreply.hops.to_i).to eq 0
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'should return hop count' do
          expect(@bootrequest.hops.to_s).to eq '0'
        end
      end
      context 'BOOTREPLY' do
        it 'should return hop count' do
          expect(@bootreply.hops.to_s).to eq '0'
        end
      end
    end

  end

  describe '.xid' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::TransactionID' do
        expect(@bootrequest.xid).to be_a_kind_of(Lib::BOOTP::Packet::TransactionID)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::TransactionID' do
        expect(@bootreply.xid).to be_a_kind_of(Lib::BOOTP::Packet::TransactionID)
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return XID value' do
          expect(@bootrequest.xid.to_i).not_to eq nil
        end
      end
      context 'BOOTREPLY' do
        it 'Should return XID value' do
          expect(@bootreply.xid.to_i).not_to eq nil
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return XID value' do
          expect(@bootrequest.xid.to_s).not_to eq nil
        end
      end
      context 'BOOTREPLY' do
        it 'Should return XID value' do
          expect(@bootreply.xid.to_s).not_to eq nil
        end
      end
    end
  end

  describe '.secs' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::Seconds' do
        expect(@bootrequest.secs).to be_a_kind_of(Lib::BOOTP::Packet::Seconds)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::Seconds' do
        expect(@bootreply.secs).to be_a_kind_of(Lib::BOOTP::Packet::Seconds)
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return seconds count' do
          expect(@bootrequest.secs.to_i).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'Should return seconds count' do
          expect(@bootreply.secs.to_i).to eq 0
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return seconds count' do
          expect(@bootrequest.secs.to_s).to eq '0'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return seconds count' do
          expect(@bootreply.secs.to_s).to eq '0'
        end
      end
    end
  end

  describe '.flags' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::Seconds' do
        expect(@bootrequest.flags).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::Seconds' do
        expect(@bootreply.flags).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
      end
    end
    describe '.broadcast?' do
      context 'BOOTREQUEST' do
        it 'Should return false if broadcast flags not set' do
          expect(@bootrequest.flags.broadcast?).to eq false
        end
      end
      context 'BOOTREPLY' do
        it 'Should return false if broadcast flags not set' do
          expect(@bootreply.flags.broadcast?).to eq false
        end
      end
    end
    describe '.broadcast' do
      context 'BOOTREQUEST' do
        it 'Should return 0 if broadcast flags not set' do
          expect(@bootrequest.flags.broadcast).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'Should return 0 if broadcast flags not set' do
          expect(@bootreply.flags.broadcast).to eq 0
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return HEX String representation of flags' do
          expect(@bootrequest.flags.to_s).to eq '0x0'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return HEX String representation of flags' do
          expect(@bootreply.flags.to_s).to eq '0x0'
        end
      end
    end
    describe '.to_hex' do
      context 'BOOTREQUEST' do
        it 'Should return HEX String representation of flags' do
          expect(@bootrequest.flags.to_hex).to eq '0x0'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return HEX String representation of flags' do
          expect(@bootreply.flags.to_hex).to eq '0x0'
        end
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return Integer representation of flags' do
          expect(@bootrequest.flags.to_i).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Integer representation of flags' do
          expect(@bootreply.flags.to_i).to eq 0
        end
      end
    end
  end

  describe '.ciaddr' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootrequest.ciaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootreply.ciaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.ciaddr.to_i).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.ciaddr.to_i).to eq 0
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.ciaddr.to_s).to eq '0.0.0.0'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.ciaddr.to_s).to eq '0.0.0.0'
        end
      end
    end
  end

  describe '.yiaddr' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootrequest.yiaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootreply.yiaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.yiaddr.to_i).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.yiaddr.to_i).to eq 0
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.yiaddr.to_s).to eq '0.0.0.0'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.yiaddr.to_s).to eq '0.0.0.0'
        end
      end
    end
  end

  describe '.siaddr' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootrequest.siaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootreply.siaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.siaddr.to_i).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.siaddr.to_i).to eq 0
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.siaddr.to_s).to eq '0.0.0.0'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.siaddr.to_s).to eq '0.0.0.0'
        end
      end
    end
  end

  describe '.giaddr' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootrequest.giaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::IPAddress' do
        expect(@bootreply.giaddr).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    describe '.to_i' do
      context 'BOOTREQUEST' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.giaddr.to_i).to eq 0
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.giaddr.to_i).to eq 0
        end
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootrequest.giaddr.to_s).to eq '0.0.0.0'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return String representation of Lib::BOOTP::Packet::IPAddress object' do
          expect(@bootreply.giaddr.to_s).to eq '0.0.0.0'
        end
      end
    end

  end

  describe '.chaddr' do
    context 'BOOTREQUEST' do
      it 'Should return a Lib::BOOTP::Packet::ClientHardwareAddress object' do
        expect(@bootrequest.chaddr).to be_a_kind_of(Lib::BOOTP::Packet::ClientHardwareAddress)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return a Lib::BOOTP::Packet::ClientHardwareAddress object' do
        expect(@bootreply.chaddr).to be_a_kind_of(Lib::BOOTP::Packet::ClientHardwareAddress)
      end
    end
    describe '.to_s' do
      context 'Len argument given' do
        context 'BOOTREQUEST' do
          it 'Should return String representation of CHADDR field striped to given length' do
            expect(@bootrequest.chaddr.to_s(6)).to eq '00:11:22:33:44:55'
          end
        end
        context 'BOOTREPLY' do
          it 'Should return String representation of CHADDR field striped to given length' do
            expect(@bootreply.chaddr.to_s(6)).to eq '00:11:22:33:44:55'
          end
        end

      end
      context 'No len argument given' do
        context 'BOOTREQUEST' do
          it 'Should return String representation of CHADDR field' do
            expect(@bootrequest.chaddr.to_s).to eq '00:11:22:33:44:55:00:00:00:00:00:00:00:00:00:00'
          end
        end
        context 'BOOTREPLY' do
          it 'Should return String representation of CHADDR field' do
            expect(@bootreply.chaddr.to_s).to eq '00:11:22:33:44:55:00:00:00:00:00:00:00:00:00:00'
          end
        end
      end
    end
    describe '.to_a' do
      context 'BOOTREQUEST' do
        it 'Should return Array representation of CHADDR field' do
          expect(@bootrequest.chaddr.to_a).to eq [0, 17, 34, 51, 68, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Array representation of CHADDR field' do
          expect(@bootreply.chaddr.to_a).to eq [0, 17, 34, 51, 68, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        end
      end
    end
  end

  describe '.sname' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::ServerHostName object' do
        expect(@bootrequest.sname).to be_a_kind_of(Lib::BOOTP::Packet::ServerHostName)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::ServerHostName object' do
        expect(@bootreply.sname).to be_a_kind_of(Lib::BOOTP::Packet::ServerHostName)
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return Server Host Name' do
          expect(@bootrequest.sname.to_s).to eq '.'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Server Host Name' do
          expect(@bootreply.sname.to_s).to eq '.'
        end
      end
    end
  end

  describe '.file' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet::BootFile object' do
        expect(@bootrequest.file).to be_a_kind_of(Lib::BOOTP::Packet::BootFile)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet::ServerHostName object' do
        expect(@bootreply.file).to be_a_kind_of(Lib::BOOTP::Packet::BootFile)
      end
    end
    describe '.to_s' do
      context 'BOOTREQUEST' do
        it 'Should return Boot File Name' do
          expect(@bootrequest.file.to_s).to eq '.'
        end
      end
      context 'BOOTREPLY' do
        it 'Should return Boot File  Name' do
          expect(@bootreply.file.to_s).to eq '.'
        end
      end
    end
  end

  describe '.op=' do
    it 'Should set OpCode' do
      packet = @bootrequest.clone
      packet.op= 2
      expect(packet.op.to_s).to eq 'BOOTREPLY'
    end
  end

  describe '.htype=' do
    it 'Should set Hardware address type' do
      packet = @bootrequest.clone
      packet.htype = 2
      expect(packet.htype.to_s).to eq 'Experimental Ethernet (3Mb)'
    end
  end

  describe '.hlen=' do
    it 'Should set Hardware Address len' do
      packet = @bootrequest.clone
      packet.hlen = 1
      expect(packet.hlen.to_i).to eq 1
    end
  end

  describe '.hops=' do
    it 'Should set Hop Counts' do
      packet = @bootrequest.clone
      packet.hops = 2
      expect(packet.hops.to_i).to eq 2
    end
  end

  describe '.xid=' do
    it 'Should set Transaction ID' do
      packet = @bootrequest.clone
      packet.xid = 0xFF
      expect(packet.xid.to_i).to eq 0xFF
    end
  end

  describe '.secs=' do
    it 'Should set second count' do
      packet = @bootrequest.clone
      packet.secs = 10
      expect(packet.secs.to_i).to eq 10
    end
  end

  describe '.flags=' do
    it 'Should set Flags' do
      packet = @bootrequest.clone
      packet.flags = :broadcast
      expect(packet.flags.to_i).to eq 0x8000
    end
  end

  describe '.ciaddr=' do
    it 'Should set CIADDR' do
      packet = @bootrequest.clone
      packet.ciaddr = '10.0.0.1'
      expect(packet.ciaddr.to_i).to eq 167772161
    end
  end

  describe '.yiaddr=' do
    it 'Should set YIADDR' do
      packet = @bootrequest.clone
      packet.yiaddr = '10.0.0.1'
      expect(packet.yiaddr.to_i).to eq 167772161
    end
  end

  describe '.siaddr=' do
    it 'Should set SIADDR' do
      packet = @bootrequest.clone
      packet.siaddr = '10.0.0.1'
      expect(packet.siaddr.to_i).to eq 167772161
    end
  end

  describe '.giaddr=' do
    it 'Should set GIADDR' do
      packet = @bootrequest.clone
      packet.giaddr = '10.0.0.1'
      expect(packet.giaddr.to_i).to eq 167772161
    end
  end

  describe '.chaddr=' do
    it 'Should set CHADDR' do
      packet = @bootrequest.clone
      packet.chaddr= '00:11:22:33:44:66'
      expect(packet.chaddr.to_s).to eq '00:11:22:33:44:66:00:00:00:00:00:00:00:00:00:00'
    end
  end

  describe '.sname=' do
    it 'Should set SNAME' do
      packet = @bootrequest.clone
      packet.sname = 'server_name'
      expect(packet.sname.to_s).to eq 'server_name'
    end
  end

  describe '.file=' do
    it 'Should set BOOT FILE' do
      packet = @bootrequest.clone
      packet.file = '/example.file'
      expect(packet.file.to_s).to eq '/example.file'
    end
  end

  describe '.to_s' do
    context 'BOOTREQUEST' do
      it 'Should return String representation of Lib::BOOTP::Packet Object' do
        expect(@bootrequest.to_s).to be_a_kind_of(String)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return String representation of Lib::BOOTP::Packet Object' do
        expect(@bootreply.to_s).to be_a_kind_of(String)
      end
    end
  end

  describe '.to_h' do
    context 'BOOTREQUEST' do
      it 'Should return Hash representation of Lib::BOOTP::Packet Object' do
        expect(@bootrequest.to_h).to be_a_kind_of(Hash)
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Hash representation of Lib::BOOTP::Packet Object' do
        expect(@bootreply.to_h).to be_a_kind_of(Hash)
      end
    end
  end

  describe '.pack' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet packet' do
        packet = @bootrequest.clone
        packet.xid = 0xFF
        chaddr = ['00112233445500000000000000000000'].pack('H32')
        packed = [1,1,6,0,0xFF,0,0,0,0,0,0,chaddr,'.','.'].pack('C4NnnN4a16a64a128')
        expect(packet.pack).to eq packed
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet packet' do
        packet = @bootreply.clone
        packet.xid = 0xFF
        chaddr = ['00112233445500000000000000000000'].pack('H32')
        packed = [2,1,6,0,0xFF,0,0,0,0,0,0,chaddr,'.','.'].pack('C4NnnN4a16a64a128')
        expect(packet.pack).to eq packed
      end
    end
  end

  describe '#unpack' do
    context 'BOOTREQUEST' do
      it 'Should return Lib::BOOTP::Packet for given packet' do
        chaddr = ['00112233445500000000000000000000'].pack('H32')
        packed = [1,1,6,0,0xFF,0,0,0,0,0,0,chaddr,'.','.'].pack('C4NnnN4a16a64a128')
        packet  = Lib::BOOTP::Packet.unpack packed
        expect(packet).to be_a_kind_of(Lib::BOOTP::Packet)
        expect(packet.op.to_s).to eq 'BOOTREQUEST'
      end
    end
    context 'BOOTREPLY' do
      it 'Should return Lib::BOOTP::Packet for given packet' do
        chaddr = ['00112233445500000000000000000000'].pack('H32')
        packed = [2,1,6,0,0xFF,0,0,0,0,0,0,chaddr,'.','.'].pack('C4NnnN4a16a64a128')
        packet  = Lib::BOOTP::Packet.unpack packed
        expect(packet).to be_a_kind_of(Lib::BOOTP::Packet)
        expect(packet.op.to_s).to eq 'BOOTREPLY'
      end
    end
  end

end