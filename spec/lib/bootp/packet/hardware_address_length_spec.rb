#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::HardwareAddressLength do

  describe '#new' do
    it 'Should return Lib::BOOTP::Packet::HardwareAddressLength object of given Hardware Address Length' do
      expect(Lib::BOOTP::Packet::HardwareAddressLength.new(1)).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressLength)
    end
    context 'Should default return 6(Ethernet 10Mb)' do
      it 'Should return Lib::BOOTP::Packet::HardwareAddressLength object' do
        expect(Lib::BOOTP::Packet::HardwareAddressLength.new).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressLength)
      end
      it 'Should return 6 on .to_i' do
        expect(Lib::BOOTP::Packet::HardwareAddressLength.new.to_i).to eq 6
      end
    end
  end

  before(:each) do
    @hwl = Lib::BOOTP::Packet::HardwareAddressLength.new(1)
  end

  describe '.to_s' do
    it 'Should return "1"(string)' do
      expect(@hwl.to_s).to eq '1'
    end
  end

  describe '.to_i' do
    it 'Should return 1(integer)' do
      expect(@hwl.to_i).to eq 1
    end
  end

  describe '.pack' do
    it 'Should return Lib::BOOTP::Packet::HardwareAddressLength packet' do
      expect(@hwl.pack).to eq [1].pack('C')
    end
  end

  describe '.==' do
    it 'Should return true if hardware address length is equal' do
      expect(@hwl).to eq(1)
    end
    it 'Should return false if hardware address length is not equal' do
      expect(@hwl).not_to eq(2)
    end
  end

  describe '#unpack' do
    it 'Should return Lib::BOOTP::Packet::HardwareAddressLength object for given packet' do
      expect(Lib::BOOTP::Packet::HardwareAddressLength.unpack([1].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HardwareAddressLength)
    end
  end
end