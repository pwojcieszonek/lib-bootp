#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::HopCount do

  describe '#new(count)' do
    it 'Should return Lib::BOOTP::Packet::HopCount of given count number' do
      expect(Lib::BOOTP::Packet::HopCount.new(1)).to be_a_kind_of(Lib::BOOTP::Packet::HopCount)
    end
    it 'Should raise ArgumentError if hop count out of range(255)' do
      expect{Lib::BOOTP::Packet::HopCount.new(256)}.to raise_error(ArgumentError)
    end
    context '#new() without argument should return hop count 0' do
      it 'Should return Lib::BOOTP::Packet::HopCount of given count number' do
        expect(Lib::BOOTP::Packet::HopCount.new).to be_a_kind_of(Lib::BOOTP::Packet::HopCount)
      end
      it 'Should return 0 on to_i' do
        expect(Lib::BOOTP::Packet::HopCount.new.to_i).to eq 0
      end
    end
  end

  before(:each) do
    @hoc = Lib::BOOTP::Packet::HopCount.new(1)
  end

  describe '.to_s' do
    it 'Should return "1"(String)' do
      expect(@hoc.to_s).to eq '1'
    end
  end

  describe '.to_i' do
    it 'Should return 1(integer)' do
      expect(@hoc.to_i).to eq 1
    end
  end

  describe '.pack' do
    it 'Should return Lib::BOOTP::Packet::HopCount packet' do
      expect(@hoc.pack).to eq [1].pack('C')
    end
  end

  describe '.==' do
    it 'Should return true if hops count equal' do
      expect(@hoc).to eq(1)
    end
    it 'Should return false if hops count are not equal' do
      expect(@hoc).not_to eq(2)
    end
    it 'Should return true if hops count grater' do
      expect(@hoc).to be > 0
    end
    it 'Should return true if hops count lower' do
      expect(@hoc).to be < 2
    end
  end

  describe '#unpack(packet)' do
    it 'Should return Lib::BOOTP::Packet::HopCount for given packet' do
      expect(Lib::BOOTP::Packet::HopCount.unpack([1].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::HopCount)
    end
  end

end