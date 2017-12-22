#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 14.03.2016 by Piotr Wojcieszonek

require 'rspec'
require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::HardwareAddressType do
  describe '#new' do
    context 'Lease Query' do
      it 'Should Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(0)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Ethernet (10Mb)'do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(1)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Experimental Ethernet (3Mb)' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(2)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Amateur Radio AX.25' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(3)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Proteon ProNET Token Ring' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(4)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Chaos' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(5)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'IEEE 802 Networks' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(6)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'ARCNET' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(7)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Hyperchannel' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(8)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Lanstar' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(9)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Autonet Short Address' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(10)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'LocalTalk' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(11)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'LocalNet (IBM PCNet or SYTEK LocalNET)' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.new(12)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Unsupported hardware type' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::HardwareAddressType.new(13)}.to raise_error(ArgumentError)
      end
    end
  end

  before(:each) do
    @lease_query = Lib::BOOTP::Packet::HardwareAddressType.new(0)
    @ethernet10 = Lib::BOOTP::Packet::HardwareAddressType.new(1)
    @ethernet3 = Lib::BOOTP::Packet::HardwareAddressType.new(2)
    @ax25 = Lib::BOOTP::Packet::HardwareAddressType.new(3)
    @pronet = Lib::BOOTP::Packet::HardwareAddressType.new(4)
    @chaos = Lib::BOOTP::Packet::HardwareAddressType.new(5)
    @ieee802 = Lib::BOOTP::Packet::HardwareAddressType.new(6)
    @arcnet = Lib::BOOTP::Packet::HardwareAddressType.new(7)
    @hyperchannel = Lib::BOOTP::Packet::HardwareAddressType.new(8)
    @lanstar = Lib::BOOTP::Packet::HardwareAddressType.new(9)
    @autonet = Lib::BOOTP::Packet::HardwareAddressType.new(10)
    @localtalk = Lib::BOOTP::Packet::HardwareAddressType.new(11)
    @localnet = Lib::BOOTP::Packet::HardwareAddressType.new(12)
  end

  describe '.to_s' do
    context 'Lease Query' do
      it 'Should return: Lease Query' do
        expect(@lease_query.to_s).to eq 'Lease Query'
      end
    end
    context 'Ethernet (10Mb)'do
      it 'Should return: Ethernet (10Mb)' do
        expect(@ethernet10.to_s).to eq 'Ethernet (10Mb)'
      end
    end
    context 'Experimental Ethernet (3Mb)' do
      it 'Should return: Experimental Ethernet (3Mb) ' do
        expect(@ethernet3.to_s).to eq 'Experimental Ethernet (3Mb)'
      end
    end
    context 'Amateur Radio AX.25' do
      it 'Should return: Amateur Radio AX.25' do
        expect(@ax25.to_s).to eq 'Amateur Radio AX.25'
      end
    end
    context 'Proteon ProNET Token Ring' do
      it 'Should return: Proteon ProNET Token Ring' do
        expect(@pronet.to_s).to eq 'Proteon ProNET Token Ring'
      end
    end
    context 'Chaos' do
      it 'Should return: Chaos' do
        expect(@chaos.to_s).to eq 'Chaos'
      end
    end
    context 'IEEE 802 Networks' do
      it 'Should return: IEEE 802 Networks' do
        expect(@ieee802.to_s).to eq 'IEEE 802 Networks'
      end
    end
    context 'ARCNET' do
      it 'Should return: ARCNET' do
        expect(@arcnet.to_s).to eq 'ARCNET'
      end
    end
    context 'Hyperchannel' do
      it 'Should return: Hyperchannel' do
        expect(@hyperchannel.to_s).to eq 'Hyperchannel'
      end
    end
    context 'Lanstar' do
      it 'Should return: Lanstar' do
        expect(@lanstar.to_s).to eq 'Lanstar'
      end
    end
    context 'Autonet Short Address' do
      it 'Should return: Autonet Short Address' do
        expect(@autonet.to_s).to eq 'Autonet Short Address'
      end
    end
    context 'LocalTalk' do
      it 'Should return: LocalTalk' do
        expect(@localtalk.to_s).to eq 'LocalTalk'
      end
    end
    context 'LocalNet (IBM PCNet or SYTEK LocalNET)' do
      it 'Should return: LocalNet (IBM PCNet or SYTEK LocalNET)' do
        expect(@localnet.to_s).to eq 'LocalNet (IBM PCNet or SYTEK LocalNET)'
      end
    end

  end
  describe '.to_i' do
    context 'Lease Query' do
      it 'Should return 0' do
        expect(@lease_query.to_i).to eq 0
      end
    end
    context 'Ethernet (10Mb)'do
      it 'Should return 1' do
        expect(@ethernet10.to_i).to eq 1
      end
    end
    context 'Experimental Ethernet (3Mb)' do
      it 'Should return 2' do
        expect(@ethernet3.to_i).to eq 2
      end
    end
    context 'Amateur Radio AX.25' do
      it 'Should return 3' do
        expect(@ax25.to_i).to eq 3
      end
    end
    context 'Proteon ProNET Token Ring' do
      it 'Should return 4' do
        expect(@pronet.to_i).to eq 4
      end
    end
    context 'Chaos' do
      it 'Should return 5' do
        expect(@chaos.to_i).to eq 5
      end
    end
    context 'IEEE 802 Networks' do
      it 'Should return 6' do
        expect(@ieee802.to_i).to eq 6
      end
    end
    context 'ARCNET' do
      it 'Should return 7' do
        expect(@arcnet.to_i).to eq 7
      end
    end
    context 'Hyperchannel' do
      it 'Should return 8' do
        expect(@hyperchannel.to_i).to eq 8
      end
    end
    context 'Lanstar' do
      it 'Should return 9' do
        expect(@lanstar.to_i).to eq 9
      end
    end
    context 'Autonet Short Address' do
      it 'Should return 10' do
        expect(@autonet.to_i).to eq 10
      end
    end
    context 'LocalTalk' do
      it 'Should return 11' do
        expect(@localtalk.to_i).to eq 11
      end
    end
    context 'LocalNet (IBM PCNet or SYTEK LocalNET)' do
      it 'Should return 12' do
        expect(@localnet.to_i).to eq 12
      end
    end
  end
  describe '.pack' do
    context 'Lease Query' do
      it 'Should return Lease Query HardwareAddressType packet' do
        expect(@lease_query.pack).to eq [0].pack('C')
      end
    end
    context 'Ethernet (10Mb)'do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@ethernet10.pack).to eq [1].pack('C')
      end
    end
    context 'Experimental Ethernet (3Mb)' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@ethernet3.pack).to eq [2].pack('C')
      end
    end
    context 'Amateur Radio AX.25' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@ax25.pack).to eq [3].pack('C')
      end
    end
    context 'Proteon ProNET Token Ring' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@pronet.pack).to eq [4].pack('C')
      end
    end
    context 'Chaos' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@chaos.pack).to eq [5].pack('C')
      end
    end
    context 'IEEE 802 Networks' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@ieee802.pack).to eq [6].pack('C')
      end
    end
    context 'ARCNET' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@arcnet.pack).to eq [7].pack('C')
      end
    end
    context 'Hyperchannel' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@hyperchannel.pack).to eq [8].pack('C')
      end
    end
    context 'Lanstar' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@lanstar.pack).to eq [9].pack('C')
      end
    end
    context 'Autonet Short Address' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@autonet.pack).to eq [10].pack('C')
      end
    end
    context 'LocalTalk' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@localtalk.pack).to eq [11].pack('C')
      end
    end
    context 'LocalNet (IBM PCNet or SYTEK LocalNET)' do
      it 'Should return Ethernet (10Mb) HardwareAddressType packet' do
        expect(@localnet.pack).to eq [12].pack('C')
      end
    end
  end

  describe '.==' do
    context 'Lease Query' do
      it 'Should return 0' do
        expect(@lease_query).to eq 0
      end
    end
    context 'Ethernet (10Mb)'do
      it 'Should return 1' do
        expect(@ethernet10).to eq 1
      end
    end
    context 'Experimental Ethernet (3Mb)' do
      it 'Should return 2' do
        expect(@ethernet3).to eq 2
      end
    end
    context 'Amateur Radio AX.25' do
      it 'Should return 3' do
        expect(@ax25).to eq 3
      end
    end
    context 'Proteon ProNET Token Ring' do
      it 'Should return 4' do
        expect(@pronet).to eq 4
      end
    end
    context 'Chaos' do
      it 'Should return 5' do
        expect(@chaos).to eq 5
      end
    end
    context 'IEEE 802 Networks' do
      it 'Should return 6' do
        expect(@ieee802).to eq 6
      end
    end
    context 'ARCNET' do
      it 'Should return 7' do
        expect(@arcnet).to eq 7
      end
    end
    context 'Hyperchannel' do
      it 'Should return 8' do
        expect(@hyperchannel).to eq 8
      end
    end
    context 'Lanstar' do
      it 'Should return 9' do
        expect(@lanstar).to eq 9
      end
    end
    context 'Autonet Short Address' do
      it 'Should return 10' do
        expect(@autonet).to eq 10
      end
    end
    context 'LocalTalk' do
      it 'Should return 11' do
        expect(@localtalk).to eq 11
      end
    end
    context 'LocalNet (IBM PCNet or SYTEK LocalNET)' do
      it 'Should return 12' do
        expect(@localnet).to eq 12
      end
    end
  end

  describe '#unpack(htype)' do
    context 'Lease Query' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([0].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Ethernet (10Mb)'do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([1].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Experimental Ethernet (3Mb)' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([2].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Amateur Radio AX.25' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([3].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Proteon ProNET Token Ring' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([4].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Chaos' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([5].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'IEEE 802 Networks' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([6].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'ARCNET' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([7].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Hyperchannel' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([8].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Lanstar' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([9].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Autonet Short Address' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([10].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'LocalTalk' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([11].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'LocalNet (IBM PCNet or SYTEK LocalNET)' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressType of given BOOTP HardwareAddressType packet' do
        expect(Lib::BOOTP::Packet::HardwareAddressType.unpack([12].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressType)
      end
    end
    context 'Unsupported hardware type' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::HardwareAddressType.unpack([13].pack('C'))}.to raise_error(ArgumentError)
      end
    end
  end
end