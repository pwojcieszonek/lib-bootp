#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::ServerHostName do

  describe '#new' do
    context 'Server Host Name given' do
      it 'Should return Lib::BOOTP::Packet::ServerHostName object' do
        expect(Lib::BOOTP::Packet::ServerHostName.new('server_host_name')).to be_a_kind_of(Lib::BOOTP::Packet::ServerHostName)
      end
    end
    context 'No server Host Name given' do
      it 'Should return Lib::BOOTP::Packet::ServerHostName object' do
        expect(Lib::BOOTP::Packet::ServerHostName.new('server_host_name')).to be_a_kind_of(Lib::BOOTP::Packet::ServerHostName)
      end
    end
    context 'Given server host name is longer then 64 character' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::ServerHostName.new('a'*65)}.to raise_error(ArgumentError)
      end
    end
  end

  before(:each) do
    @sname_given = Lib::BOOTP::Packet::ServerHostName.new('server_host_name')
    @no_sname_given = Lib::BOOTP::Packet::ServerHostName.new()
  end

  describe '.to_s' do
    context 'No SNAME parameter given' do
      it 'Should return String representation of sname' do
        expect(@no_sname_given.to_s).to eq '.'
      end
    end
    context 'SNAME parameter given' do
      it 'Should return String representation of given sname' do
        expect(@sname_given.to_s).to eq 'server_host_name'
      end
    end
  end

  describe '.pack' do
    context 'No SNAME parameter given' do
      it 'Should return Lib::BOOTP::Packet::ServerHostName packet' do
        expect(@no_sname_given.pack).to eq ['.'].pack('a64')
      end
    end
    context 'SNAME parameter given' do
      it 'Should return Lib::BOOTP::Packet::ServerHostName packet' do
        expect(@sname_given.pack).to eq ['server_host_name'].pack('a64')
      end
    end
  end

  describe '.==' do
    it 'Should return true if hostname equal' do
      expect(@sname_given).to eq 'server_host_name'
    end
    it 'Should return false if hostname not equal' do
      expect(@sname_given).not_to eq 'bad_server_host_name'
    end
  end

  describe '#unpack' do
    it 'Should return Lib::BOOTP::Packet::ServerHostName object for given packet' do
      expect(Lib::BOOTP::Packet::ServerHostName.unpack(['server_host_name'].pack('a64'))).to be_a_kind_of Lib::BOOTP::Packet::ServerHostName
    end
  end

end