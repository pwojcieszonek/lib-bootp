require_relative '../spec_helper'
RSpec.describe Lib::BOOTP do

  before(:each) do
    @bootp =  bootp = Lib::BOOTP::Packet.new(
      op: 1,
      htype: 1,
      hlen: 6,
      hops: 0,
      xid: 1,
      secs: 0,
      flags: 0,
      ciaddr: '0.0.0.0',
      yiaddr: '0.0.0.0',
      siaddr: '0.0.0.0',
      giaddr: '0.0.0.0',
      chaddr: '00:11:22:33:44:55',
      sname: '.',
      file: '.'
      )
  end

  it "has a version number" do
    expect(Lib::BOOTP::VERSION).not_to be nil
  end

  describe ".to_json" do
    it "should return valid json object" do
      expect(JSON.parse(@bootp.to_json)).to be_a_kind_of(Hash)
    end
    it "should return op in json array" do
      expect(JSON.parse(@bootp.to_json)["op"]["code"]).to eq "1"
      expect(JSON.parse(@bootp.to_json)["op"]["name"]).to eq "BOOTREQUEST"
    end
    it "should return htype in json array" do
      expect(JSON.parse(@bootp.to_json)["htype"]["code"]).to eq "1"
      expect(JSON.parse(@bootp.to_json)["htype"]["name"]).to eq "Ethernet (10Mb)"
    end
    it "should return hlen in json array" do
      expect(JSON.parse(@bootp.to_json)["hlen"]).to eq "6"
    end
    it "should return hops in json array" do
      expect(JSON.parse(@bootp.to_json)["hops"]).to eq "0"
    end
    it "should return xid in json array" do
      expect(JSON.parse(@bootp.to_json)["xid"]).to eq "1"
    end
    it "should return secs in json array" do
      expect(JSON.parse(@bootp.to_json)["secs"]).to eq "0"
    end
    it "should return flags in json array" do
      expect(JSON.parse(@bootp.to_json)["flags"]).to eq "0x0"
    end
    it "should return ciaddr in json array" do
      expect(JSON.parse(@bootp.to_json)["ciaddr"]).to eq "0.0.0.0"
    end
    it "should return yiaddr in json array" do
      expect(JSON.parse(@bootp.to_json)["yiaddr"]).to eq "0.0.0.0"
    end
    it "should return giaddr in json array" do
      expect(JSON.parse(@bootp.to_json)["giaddr"]).to eq "0.0.0.0"
    end
    it "should return chaddr in json array" do
      expect(JSON.parse(@bootp.to_json)["chaddr"]).to eq "00:11:22:33:44:55:00:00:00:00:00:00:00:00:00:00"
    end
    it "should return sname in json array" do
      expect(JSON.parse(@bootp.to_json)["sname"]).to eq "."
    end
    it "should return file in json array" do
      expect(JSON.parse(@bootp.to_json)["file"]).to eq "."
    end
  end

  describe "#from_json" do
    it "should return valid Lib::BOOTP::Packet from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json)).to be_a_kind_of(Lib::BOOTP::Packet)
    end
    it "op should equal Lib::BOOTP::Packet op from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).op).to eq @bootp.op
    end
    it "htype should equal Lib::BOOTP::Packet htype from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).htype).to eq @bootp.htype
    end
    it "hlen should equal Lib::BOOTP::Packet hlen from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).hlen).to eq @bootp.hlen
    end
    it "hops should equal Lib::BOOTP::Packet hops from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).hops).to eq @bootp.hops
    end
    it "xid should equal Lib::BOOTP::Packet xid from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).xid).to eq @bootp.xid
    end
    it "secs should equal Lib::BOOTP::Packet secs from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).secs).to eq @bootp.secs
    end
    it "flags should equal Lib::BOOTP::Packet flags from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).flags).to eq @bootp.flags
    end
    it "ciaddr should equal Lib::BOOTP::Packet ciaddr from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).ciaddr).to eq @bootp.ciaddr
    end
    it "siaddr should equal Lib::BOOTP::Packet siaddr from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).siaddr).to eq @bootp.siaddr
    end
    it "yiaddr should equal Lib::BOOTP::Packet yiaddr from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).yiaddr).to eq @bootp.yiaddr
    end
    it "giaddr should equal Lib::BOOTP::Packet giaddr from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).giaddr).to eq @bootp.giaddr
    end
    it "chaddr should equal Lib::BOOTP::Packet chaddr from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).chaddr).to eq @bootp.chaddr
    end
    it "sname should equal Lib::BOOTP::Packet sname from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).sname).to eq @bootp.sname
    end
    it "file should equal Lib::BOOTP::Packet file from json" do
      expect(Lib::BOOTP::Packet.from_json(@bootp.to_json).file).to eq @bootp.file
    end
  end
end
