#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 14.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::OpCode do

  describe '#new' do
    context 'BOOTP Request' do
      it 'Should return Lib::BOOTP::Packet::OpCode object of given BOOTP OP_Code' do
        expect(Lib::BOOTP::Packet::OpCode.new(1)).to be_a_kind_of(Lib::BOOTP::Packet::OpCode)
      end
    end
    context 'BOOTP Replay' do
      it 'Should return Lib::BOOTP::Packet::OPCode object of given BOOTP OP_Code' do
        expect(Lib::BOOTP::Packet::OpCode.new(2)).to be_a_kind_of(Lib::BOOTP::Packet::OpCode)
      end
    end
    context 'Unsupported BOOTP OP Code' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::OpCode.new(3)}.to raise_error(ArgumentError)
      end
    end
  end

  before(:each) do
    @op_request = Lib::BOOTP::Packet::OpCode.new(1)
    @op_replay = Lib::BOOTP::Packet::OpCode.new(2)
  end

  describe '.to_s' do
    context 'BOOTP Request' do
      it 'Should return BOOTREQUEST message' do
        expect(@op_request.to_s).to eq 'BOOTREQUEST'
      end
    end
    context 'BOOTP Replay' do
      it 'Should return BOOTREPLY message' do
        expect(@op_replay.to_s).to eq 'BOOTREPLY'
      end
    end
  end

  describe '.to_i' do
    context 'BOOTP Request' do
      it 'Should return 1 ' do
        expect(@op_request.to_i).to eq 1
      end
    end
    context 'BOOTP Replay' do
      it 'Should return 2' do
        expect(@op_replay.to_i).to eq 2
      end
    end
  end

  describe '.pack' do
    context 'BOOTP Request' do
      it 'Should return BOOTP Request packet' do
        expect(@op_request.pack).to eq [1].pack('C')
      end
    end
    context 'BOOTP Replay' do
      it 'Should return BOOTP Replay packet' do
        expect(@op_replay.pack).to eq [2].pack('C')
      end
    end
  end

  describe '.==' do
    context 'BOOTP Request' do
      it 'Should return true if OPCode equal' do
        expect(@op_request).to eq(1)
      end
      it 'Should return false if OPCode not equal' do
        expect(@op_request).not_to eq(2)
      end
    end
    context 'BOOTP Replay' do
      it 'Should return true if OPCode equal' do
        expect(@op_replay).to eq(2)
      end
      it 'Should return false if OPCode not equal' do
        expect(@op_replay).not_to eq(1)
      end
    end
  end

  describe '#unpack' do
    context 'BOOTP Request' do
      it 'Should return Lib::BOOTP::Packet::OpCode of given BOOTP OP_Code' do
        expect(Lib::BOOTP::Packet::OpCode.unpack([1].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::OpCode)
      end
    end
    context 'BOOTP Replay' do
      it 'Should return Lib::BOOTP::Packet::OPCode of given BOOTP OP_Code' do
        expect(Lib::BOOTP::Packet::OpCode.unpack([2].pack('C'))).to be_a_kind_of(Lib::BOOTP::Packet::OpCode)
      end
    end
    context 'Unsupported BOOTP OP Code' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::OpCode.unpack([3].pack('C'))}.to raise_error(ArgumentError)
      end
    end
  end

end