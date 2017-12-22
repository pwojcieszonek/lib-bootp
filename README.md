# Lib::BOOTP

BOOTP Library written in ruby. 
https://tools.ietf.org/html/rfc951

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lib-bootp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lib-bootp
    
## Usage

Creating BOOTP package and sending it to BOOTP server

```ruby
bootp = Lib::BOOTP::Packet.new(
            op: 1, # BOOTREQUEST = 1, BOOTREPLAY = 2, Default is 1
            htype: 1, # Hardware Address Type, Default 1 is Ethernet (10Mb)
            hlen: 6, # Hardware Address Length, Default is 6
            hops: 0, # Hops count, Default is 0
            xid: 1, # Transaction ID, by default is generate if not specific
            secs: 0, # Second counts, Default is 0
            flags: 0, # Broadcast flags, Default is not set
            ciaddr: '0.0.0.0', # Client IP Address, Default is '0.0.0.0'
            yiaddr: '0.0.0.0', # Your IP Address, Default is '0.0.0.0'
            siaddr: '0.0.0.0', # Server IP Address, Default is '0.0.0.0'
            giaddr: '0.0.0.0', # Gateway IP Address, Default is '0.0.0.0'
            chaddr: '00:11:22:33:44:55', # Client hardware address, Default is not set
            sname: '.', # Optional server host name 
            file: '.', # Boot file name
)

client = UDPSocket.new

packet = bootp.pack # Building BOOTP packet to send via UDP socket

client.send packet, 0, "255.255.255.255", 67
```

Reading and parsing packet from socket

```ruby
server = UDPSocket.new
server.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, true)
server.bind("127.0.0.1", 67)
data = server.recvfrom(1500)[0]
bootp = Lib::BOOTP::Packet.unpack(data)

# Get Operations code
bootp.op.to_s
#=> 'BOOTREQUEST'

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pwojcieszonek/lib-bootp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lib::Bootp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lib-bootp/blob/master/CODE_OF_CONDUCT.md).
