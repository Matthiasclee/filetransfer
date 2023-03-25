module FileTransfer
  module FTserver
    def self.handle_client(initdata, client)
      filename = initdata[1]
      filesize = initdata[2]
      fileid = initdata[3]
      sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr

      Notifier.file_transfer_notification(filename: filename, source: remote_hostname, filesize: filesize, accept_link: "http://#{remote_ip}:8021/#{fileid}", decline_link: "test")
      client.close
    end
  end
end

