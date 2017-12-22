#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 15.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::TransactionID do

  describe '#new' do
    context 'Lib::BOOTP::Packet::TransactionID.new(.:xid)' do
      it 'Should return Lib::BOOTP::Packet::TransactionID for given xid' do
        expect(Lib::BOOTP::Packet::TransactionID.new(0xFF)).to be_a_kind_of(Lib::BOOTP::Packet::TransactionID)
      end
    end
    context 'Lib::BOOTP::Packet::TransactionID.new()' do
      it 'Should return Lib::BOOTP::Packet::TransactionID with random xid' do
        expect(Lib::BOOTP::Packet::TransactionID.new()).to be_a_kind_of(Lib::BOOTP::Packet::TransactionID)
      end
    end
    context 'xid out of range' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::TransactionID.new(0x100000000)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '#generate' do
    context 'Lib::BOOTP::Packet::TransactionID.new()' do
      it 'Should return Lib::BOOTP::Packet::TransactionID with random xid' do
        expect(Lib::BOOTP::Packet::TransactionID.new()).to be_a_kind_of(Lib::BOOTP::Packet::TransactionID)
      end
    end
  end

  describe '.generate!' do
    it 'Should generate new xid on existing object' do
      xid = Lib::BOOTP::Packet::TransactionID.new()
      old_xid_id = xid.object_id
      old_xid = xid.to_i
      xid.generate!
      expect(xid.object_id).to eq old_xid_id
      expect(old_xid).not_to eq xid.to_i
    end
  end

  describe '.to_s' do
    it 'Should return "255" String' do
      expect(Lib::BOOTP::Packet::TransactionID.new(255).to_s).to eq '255'
    end
  end

  describe '.to_i' do
    it 'Should return 255 Integer' do
      expect(Lib::BOOTP::Packet::TransactionID.new(255).to_i).to eq 255
    end
  end

  describe '.pack' do
    it 'Should return Lib::BOOTP::Packet::TransactionID packet' do
      expect(Lib::BOOTP::Packet::TransactionID.new(255).pack).to eq [255].pack('N')
    end
  end

  describe '.==' do
    it 'Should return true if Transaction ID equal' do
      expect(Lib::BOOTP::Packet::TransactionID.new(255)).to eq(255)
      expect(Lib::BOOTP::Packet::TransactionID.new(255)).to eq('255')
    end
    it 'Should return false if Transaction Id not equal' do
      expect(Lib::BOOTP::Packet::TransactionID.new(255)).not_to eq(256)
      expect(Lib::BOOTP::Packet::TransactionID.new(255)).not_to eq('256')
    end
   end

  describe '#unpack' do
    it 'Should return Lib::BOOTP::Packet::TransactionID object for given packet' do
      expect(Lib::BOOTP::Packet::TransactionID.unpack([255].pack('N'))).to be_a_kind_of(Lib::BOOTP::Packet::TransactionID)
      expect(Lib::BOOTP::Packet::TransactionID.unpack([255].pack('N')).to_i).to eq 255
    end
  end

end