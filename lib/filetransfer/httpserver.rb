module FileTransfer
  module HTTPserver
    def self.handle_client(initdata, client)
      path = initdata[1]
      file = $active_transfers[path]
      client.close if !file

      read = true
      while read
        x= client.gets
        read = false if x == "\r\n" || !x
      end
      client.puts "HTTP/1.0 200\r\nContent-Type: application/octet-stream\r\nContent-Disposition: attachment; filename=\"#{file[:name]}\"\r\n\r\n#{File.read(file[:path])}"
      client.close
    end
  end
end
