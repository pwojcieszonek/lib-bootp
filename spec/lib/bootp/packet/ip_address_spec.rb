# Author: Piotr Wojcieszonek
# e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::IPAddress do

  describe '#new' do
    context 'Valid parameter IP address as a String given.' do
      it 'Should return Lib::BOOTP::Packet::IPAddress object' do
        expect(Lib::BOOTP::Packet::IPAddress.new('10.0.0.1')).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    context 'Valid parameter IP address as a Integer given.' do
      it 'Should return Lib::BOOTP::Packet::IPAddress object' do
        expect(Lib::BOOTP::Packet::IPAddress.new(167772161)).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    context 'Valid parameter IP address as a Inet::IP given.' do
      it 'Should return Lib::BOOTP::Packet::IPAddress object' do
        expect(Lib::BOOTP::Packet::IPAddress.new(IPAddr.new('10.0.0.1'))).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
      end
    end
    context 'Invalid parameter given' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::IPAddress.new('wrong argument')}.to raise_error(ArgumentError)
        expect{Lib::BOOTP::Packet::IPAddress.new(nil)}.to raise_error(ArgumentError)
      end
    end

  end

  before(:each) do
    @ip = Lib::BOOTP::Packet::IPAddress.new('10.0.0.1')
  end

  describe '.to_s' do
    it 'Should return String representation of Lib::BOOTP::Packet::IPAddress' do
      expect(@ip.to_s).to eq '10.0.0.1'
    end
  end

  describe '.to_i' do
    it 'Should return Integer representation of Lib::BOOTP::Packet::IPAddress' do
      expect(@ip.to_i).to eq 167772161
    end
  end

  describe '.==' do
    it 'Should return true if IP address equal' do
      expect(@ip).to eq '10.0.0.1'
      expect(@ip).to eq 167772161
      expect(@ip).to eq IPAddr.new('10.0.0.1')
    end
    it 'Should return false if IP address not equal' do
      expect(@ip).not_to eq '10.0.0.2'
      expect(@ip).not_to eq 167772162
      expect(@ip).not_to eq IPAddr.new('10.0.0.2')
    end
    it 'should return true if IP address lower' do
      expect(@ip).to be < '10.0.0.2'
    end
    it 'should return true if IP address greater' do
      expect(@ip).to be > '10.0.0.0'
    end
  end

  describe '.pack' do
    it 'Should return Lib::BOOTP::Packet::IPAddress packet' do
      expect(@ip.pack).to eq [167772161].pack('N')
    end
  end

  describe '#unpack' do
    it 'Should return Lib::BOOTP::Packet::IPAddress for given packet' do
      expect(Lib::BOOTP::Packet::IPAddress.unpack([167772161].pack('N'))).to be_a_kind_of(Lib::BOOTP::Packet::IPAddress)
    end
  end

end