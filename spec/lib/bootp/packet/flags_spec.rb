#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 17.03.2016 by Piotr Wojcieszonek


require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::Flags do

  describe '#new' do
    context 'No parameters given' do
      it 'Should return Lib::BOOTP::Packet::Flags object' do
        expect(Lib::BOOTP::Packet::Flags.new).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
        end
      it 'Should set broadcast flag to 0' do
        expect(Lib::BOOTP::Packet::Flags.new.broadcast).to eq 0
      end
    end
    context 'Lib::BOOTP::Packet::Flags.new(0). Flags set to 0' do
      it 'Should return Lib::BOOTP::Packet::Flags object' do
        expect(Lib::BOOTP::Packet::Flags.new(0)).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
      end
      it 'Should set broadcast flag to 0' do
        expect(Lib::BOOTP::Packet::Flags.new(0).broadcast).to eq 0
      end
    end
    context 'Lib::BOOTP::Packet::Flags.new(0x8000). Flags set to 0x8000' do
      it 'Should return Lib::BOOTP::Packet::Flags object with broadcast flags set to 1' do
        expect(Lib::BOOTP::Packet::Flags.new(0x8000)).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
        expect(Lib::BOOTP::Packet::Flags.new(0x8000).broadcast).to eq 1
      end
    end
    context 'Lib::BOOTP::Packet::Flags.new(:broadcast)' do
      it 'Should return Lib::BOOTP::Packet::Flags object with broadcast flags set to 1' do
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast)).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast).broadcast).to eq 1
      end
    end
    context 'Lib::BOOTP::Packet::Flags.new(:unicast)' do
      it 'Should return Lib::BOOTP::Packet::Flags object with broadcast flags set to 0' do
        expect(Lib::BOOTP::Packet::Flags.new(:unicast)).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
        expect(Lib::BOOTP::Packet::Flags.new(:unicast).broadcast).to eq 0
      end
    end
    context 'Other values then 0, 0x8000, :broadcast and :unicast in flags' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::Flags.new(0x1000)}.to raise_error(ArgumentError)
        expect{Lib::BOOTP::Packet::Flags.new(:other)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '.broadcast?' do
    context 'Broadcast flags set' do
      it 'Should return true' do
        expect(Lib::BOOTP::Packet::Flags.new(0x8000).broadcast?).to eq true
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast).broadcast?).to eq true
      end
    end
    context 'Broadcast flags not set' do
      it 'Should return false' do
        expect(Lib::BOOTP::Packet::Flags.new(0).broadcast?).to eq false
        expect(Lib::BOOTP::Packet::Flags.new(:unicast).broadcast?).to eq false
        expect(Lib::BOOTP::Packet::Flags.new.broadcast?).to eq false
      end
    end
  end

  describe '.broadcast' do
    context 'Broadcast flags set' do
      it 'Should return 1' do
        expect(Lib::BOOTP::Packet::Flags.new(0x8000).broadcast).to eq 1
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast).broadcast).to eq 1
      end
    end
    context 'Broadcast flags not set' do
      it 'Should return 0' do
        expect(Lib::BOOTP::Packet::Flags.new(0).broadcast).to eq 0
        expect(Lib::BOOTP::Packet::Flags.new(:unicast).broadcast).to eq 0
        expect(Lib::BOOTP::Packet::Flags.new.broadcast).to eq 0
      end
    end
  end

  describe '.to_s' do
    context 'Broadcast flags set' do
      it 'Should return HEX String representation of flags' do
        expect(Lib::BOOTP::Packet::Flags.new(0x8000).to_s).to eq '0x8000'
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast).to_s).to eq '0x8000'
      end
    end
    context 'Broadcast flags not set' do
      it 'Should return HEX String representation of flags' do
        expect(Lib::BOOTP::Packet::Flags.new(0).to_s).to eq '0x0'
        expect(Lib::BOOTP::Packet::Flags.new(:unicast).to_s).to eq '0x0'
        expect(Lib::BOOTP::Packet::Flags.new.to_s).to eq '0x0'
      end
    end
  end
  describe '.to_hex' do
    context 'Broadcast flags set' do
      it 'Should return HEX String representation of flags' do
        expect(Lib::BOOTP::Packet::Flags.new(0x8000).to_s).to eq '0x8000'
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast).to_s).to eq '0x8000'
      end
    end
    context 'Broadcast flags not set' do
      it 'Should return HEX String representation of flags' do
        expect(Lib::BOOTP::Packet::Flags.new(0).to_s).to eq '0x0'
        expect(Lib::BOOTP::Packet::Flags.new(:unicast).to_s).to eq '0x0'
        expect(Lib::BOOTP::Packet::Flags.new.to_s).to eq '0x0'
      end
    end
  end

  describe '.to_i' do
    context 'Broadcast flags set' do
      it 'Should return Integer representation of flags' do
        expect(Lib::BOOTP::Packet::Flags.new(0x8000).to_i).to eq 32768
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast).to_i).to eq 32768
      end
    end
    context 'Broadcast flags not set' do
      it 'Should return Integer representation of flags' do
        expect(Lib::BOOTP::Packet::Flags.new(0).to_i).to eq 0
        expect(Lib::BOOTP::Packet::Flags.new(:unicast).to_i).to eq 0
        expect(Lib::BOOTP::Packet::Flags.new.to_i).to eq 0
      end
    end
  end

  describe '.pack' do
    context 'Broadcast flags set'  do
      it 'Should return Lib::BOOTP::Packet::Flags packet' do
        expect(Lib::BOOTP::Packet::Flags.new(0x8000).pack).to eq [0x8000].pack('n')
        expect(Lib::BOOTP::Packet::Flags.new(:broadcast).pack).to eq [0x8000].pack('n')
      end
    end
    context 'Broadcast flags not set'  do
      it 'Should return Lib::BOOTP::Packet::Flags packet' do
        expect(Lib::BOOTP::Packet::Flags.new(0).pack).to eq [0].pack('n')
        expect(Lib::BOOTP::Packet::Flags.new(:unicast).pack).to eq [0].pack('n')
        expect(Lib::BOOTP::Packet::Flags.new.pack).to eq [0].pack('n')
      end
    end
  end

  describe '.==' do
    it 'Should return true if flags are equal' do
      expect(Lib::BOOTP::Packet::Flags.new(0x8000)).to eq(0x8000)
      expect(Lib::BOOTP::Packet::Flags.new(0x0000)).to eq(0x0000)
      expect(Lib::BOOTP::Packet::Flags.new(0x8000)).to eq(:broadcast)
      expect(Lib::BOOTP::Packet::Flags.new(0x0000)).to eq(:unicast)
    end
    it 'Should return false if flags are not equal' do
      expect(Lib::BOOTP::Packet::Flags.new(0x0000)).not_to eq(0x8000)
      expect(Lib::BOOTP::Packet::Flags.new(0x8000)).not_to eq(0x0000)
      expect(Lib::BOOTP::Packet::Flags.new(0x0000)).not_to eq(:broadcast)
      expect(Lib::BOOTP::Packet::Flags.new(0x8000)).not_to eq(:unicast)
    end
  end

  describe '#unpack(packet)' do
    context 'Broadcast flags set' do
      it 'Should return Lib::BOOTP::Packet::Flags object with broadcast flag set to 1' do
        expect(Lib::BOOTP::Packet::Flags.unpack([0x8000].pack('n'))).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
        expect(Lib::BOOTP::Packet::Flags.unpack([0x8000].pack('n')).broadcast).to eq 1
      end

    end
    context 'Broadcast flags not set' do
      it 'Should return Lib::BOOTP::Packet::Flags object with broadcast flag set to 0' do
        expect(Lib::BOOTP::Packet::Flags.unpack([0].pack('n'))).to be_a_kind_of(Lib::BOOTP::Packet::Flags)
        expect(Lib::BOOTP::Packet::Flags.unpack([0].pack('n')).broadcast).to eq 0
      end
    end
  end

end