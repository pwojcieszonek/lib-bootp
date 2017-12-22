#Author: Piotr Wojcieszonek
#e-mail: piotr@wojcieszonek.pl
# Copyright 18.03.2016 by Piotr Wojcieszonek

require_relative '../../../spec_helper'

RSpec.describe Lib::BOOTP::Packet::BootFile do
  describe '#new' do
    context 'Boot File Name given' do
      it 'Should return Lib::BOOTP::Packet::BootFile object' do
        expect(Lib::BOOTP::Packet::BootFile.new('/example.file')).to be_a_kind_of(Lib::BOOTP::Packet::BootFile)
      end
    end
    context 'No Boot File Name given' do
      it 'Should return Lib::BOOTP::Packet::BootFile object' do
        expect(Lib::BOOTP::Packet::BootFile.new).to be_a_kind_of(Lib::BOOTP::Packet::BootFile)
      end
    end
    context 'Given boot file name is longer then 128 character' do
      it 'Should raise ArgumentError' do
        expect{Lib::BOOTP::Packet::BootFile.new('a'*129)}.to raise_error(ArgumentError)
      end
    end

  end

  before(:each) do
    @fname_given = Lib::BOOTP::Packet::BootFile.new('/example.file')
    @no_fname_given = Lib::BOOTP::Packet::BootFile.new
  end

  describe '.to_s' do
    context 'No FNAME parameter given' do
      it 'Should return String representation of fname' do
        expect(@no_fname_given.to_s).to eq '.'
      end
    end
    context 'FNAME parameter given' do
      it 'Should return String representation of given fname' do
        expect(@fname_given.to_s).to eq '/example.file'
      end
    end
  end

  describe '.pack' do
    context 'No FNAME parameter given' do
      it 'Should return Lib::BOOTP::Packet::BootFile packet' do
        expect(@no_fname_given.pack).to eq ['.'].pack('a128')
      end
    end
    context 'FNAME parameter given' do
      it 'Should return Lib::BOOTP::Packet::BootFile packet' do
        expect(@fname_given.pack).to eq ['/example.file'].pack('a128')
      end
    end
  end

  describe '#unpack' do
    it 'Should return Lib::BOOTP::Packet::BootFile object for given packet' do
      expect(Lib::BOOTP::Packet::BootFile.unpack(['/example.file'].pack('a128'))).to be_a_kind_of Lib::BOOTP::Packet::BootFile
    end
  end

  describe '.==' do
    it 'Should return true if file name is equal' do
      expect(@fname_given).to eq('/example.file')
    end
    it 'Should return false if file name is not equal' do
      expect(@fname_given).not_to eq('/bad_example.file')
    end
  end
  
end