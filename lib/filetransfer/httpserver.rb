module FileTransfer
  module HTTPserver
    def self.handle_client(initdata, client)
      path = initdata[1].split("/")
      decline = (path[2] == "decline")
      path = ?/ + path[1]
      sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr

      if decline
        `zenity --error --title="Transfer Declined" --text="Your transfer to #{remote_hostname} has been declined." --no-wrap`
        $active_transfers.delete(path)
        client.puts "HTTP/1.0 200\r\nContent-Type: text/plain\r\n\r\nTransfer declined"
        client.close
        return
      end
      file = $active_transfers[path]

      read = true
      while read
        x= client.gets
        read = false if x == "\r\n" || !x
      end

      if !file
        client.puts "HTTP/1.0 404\r\nContent-Type: text/plain\r\n\r\nFile not found."
        client.close
        return
      end

      if client.peeraddr[2] != file[:dest_ip]
        client.puts "HTTP/1.0 403\r\nContent-Type: text/plain\r\n\r\nRequest from forbidden IP."
        client.close
        return
      end

      `zenity --info --title="Transfer Accepted" --text="Your transfer to #{remote_hostname} has been accepted." --no-wrap`
      client.puts "HTTP/1.0 200\r\nContent-Length: #{File.size file[:path]}\r\nContent-Type: application/octet-stream\r\nContent-Disposition: attachment; filename=\"#{file[:name]}\"\r\n\r\n#{IO.binread(file[:path])}"
      $active_transfers.delete(path)
      client.close
    end
  end
end
