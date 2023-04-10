module FileTransfer
  module FTserver
    def self.handle_client(initdata, client)
      filename = initdata[1]
      filesize = initdata[2]
      fileid = initdata[3]
      sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr

      Notifier.file_transfer_notification(filename: filename, source: remote_hostname, filesize: filesize, accept_link: "http://#{remote_ip}:8021/#{fileid}")
      client.close
    end

    def self.handle_file_submission(initdata, client)
      filename = initdata[1]
      filepath = initdata[2].gsub("`", " ")
      dest_ip = initdata[3]

      fileid = self.genfileid(6)
      $active_transfers[?/ + fileid] = {name: filename, path: filepath, dest_ip: dest_ip}
      client.puts fileid
      client.close
    end

    def self.genfileid(length)
        ((('a'..'z').to_a+('A'..'Z').to_a+(0..9).to_a*3).shuffle*((length.to_f/82.0).ceil))[0...length].join
    end
  end
end

