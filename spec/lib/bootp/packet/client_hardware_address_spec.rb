#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek


require_relative '../../../spec_helper'


RSpec.describe Lib::BOOTP::Packet::ClientHardwareAddress do
  describe '#new' do
    context 'CHADDR given' do
      it 'Should return a Lib::BOOTP::Packet::ClientHardwareAddress object' do
        expect(Lib::BOOTP::Packet::ClientHardwareAddress.new('00:11:22:33:44:55')).to be_a_kind_of(Lib::BOOTP::Packet::ClientHardwareAddress)
      end
    end
    context 'CHADDR given to long' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::ClientHardwareAddress.new('00:11:22:33:44:55:66:77:88:99:10:11:12:13:14:15:16')}.to raise_error(ArgumentError)
      end
    end
  end
  before(:each) do
    @chaddr = Lib::BOOTP::Packet::ClientHardwareAddress.new('00:11:22:33:44:55')
  end

  describe '.to_s' do
    context 'len argument given' do
      it 'Should return String representation of CHADDR field striped to given length' do
        expect(@chaddr.to_s(6)).to eq '00:11:22:33:44:55'
      end
    end
    context 'No len argument given' do
      it 'Should return String representation of CHADDR field' do
        expect(@chaddr.to_s).to eq '00:11:22:33:44:55:00:00:00:00:00:00:00:00:00:00'
      end
    end
  end

  describe '.to_a' do
    it 'Should return Array representation of CHADDR field' do
      expect(@chaddr.to_a).to eq [0, 17, 34, 51, 68, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    end
  end

  describe '.pack' do
    it 'Should return Lib::BOOTP::Packet::ClientHardwareAddress packet' do
      expect(@chaddr.pack).to eq ['00112233445500000000000000000000'].pack('H32')
    end
  end

  describe '.==' do
    it 'Should return true if client address match' do
      expect(@chaddr).to eq('00112233445500000000000000000000')
    end
    it "Should return true if client address don't match" do
      expect(@chaddr).not_to eq('00112233445500000000000000000001')
    end
  end

  describe '#unpack' do
    it 'Should return Lib::BOOTP::Packet::ClientHardwareAddress object from given packet' do
      expect(Lib::BOOTP::Packet::ClientHardwareAddress.unpack(['00112233445500000000000000000000'].pack('H32') )).to be_a_kind_of Lib::BOOTP::Packet::ClientHardwareAddress
      expect(Lib::BOOTP::Packet::ClientHardwareAddress.unpack(['00112233445500000000000000000000'].pack('H32') ).to_s).to eq '00:11:22:33:44:55:00:00:00:00:00:00:00:00:00:00'
    end
  end

end