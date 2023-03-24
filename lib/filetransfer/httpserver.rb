module FileTransfer
  module HTTPserver
    def self.handle_client(initdata, client)
      read = true
      while read
        x= client.gets
        puts x.dump
        read = false if x == "\r\n" || !x
      end
      client.puts "HTTP/1.0 404\r\nContent-Type: text/plain\r\n\r\nasd"
      client.close
    end
  end
end
