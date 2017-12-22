#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::Seconds do

  describe '#new' do
    context 'Lib::BOOTP::Packet::Seconds.new(.:secs)' do
      it 'Should return Lib::BOOTP::Packet::Seconds object for given seconds count' do
        expect(Lib::BOOTP::Packet::Seconds.new(1)).to be_a_kind_of(Lib::BOOTP::Packet::Seconds)
      end
    end
    context 'Lib::BOOTP::Packet::Seconds.new()' do
      it 'Should return Lib::BOOTP::Packet::Seconds object with seconds count set to 0' do
        expect(Lib::BOOTP::Packet::Seconds.new()).to be_a_kind_of(Lib::BOOTP::Packet::Seconds)
        expect(Lib::BOOTP::Packet::Seconds.new().to_i).to eq 0
      end
    end
    context 'Seconds count out of range' do
      it 'Should raise ArgumentError when second count is out of range' do
        expect{Lib::BOOTP::Packet::Seconds.new(0x10000)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '.to_s' do
    it 'Should return String representation of given second count' do
      expect(Lib::BOOTP::Packet::Seconds.new(1).to_s).to eq '1'
    end
  end

  describe '.to_i' do
    it 'Should return Integer representation of given second count' do
      expect(Lib::BOOTP::Packet::Seconds.new(1).to_i).to eq 1
    end
  end

  describe '.pack' do
    it 'Should return Lib::BOOTP::Packet::Seconds packet' do
      expect(Lib::BOOTP::Packet::Seconds.new(1).pack).to eq [1].pack('n')
    end
  end

  describe '.==' do
    it 'Should return true if seconds count equal' do
      expect(Lib::BOOTP::Packet::Seconds.new(1)).to eq(1)
    end
    it 'Should return false if seconds count not equal' do
      expect(Lib::BOOTP::Packet::Seconds.new(1)).not_to eq(2)
    end
    it 'Should return true if seconds count greater' do
      expect(Lib::BOOTP::Packet::Seconds.new(2)).to be > (1)
    end
    it 'Should return true if seconds count lower' do
      expect(Lib::BOOTP::Packet::Seconds.new(2)).to be < (3)
    end
  end

  describe '#unpack' do
    it 'Should return Lib::BOOTP::Packet::Seconds object from given packet' do
      expect(Lib::BOOTP::Packet::Seconds.unpack([1].pack('n'))).to be_a_kind_of(Lib::BOOTP::Packet::Seconds)
      expect(Lib::BOOTP::Packet::Seconds.unpack([1].pack('n')).to_i).to eq 1
    end
  end
end