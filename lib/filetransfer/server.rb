module FileTransfer
  class Server
    def initialize(port:8021, listen:"0.0.0.0")
      @port = port
      @listen = listen
    end

    def start
      @server = TCPServer.new(@listen, @port)
      loop do
        Thread.start(@server.accept) do |client|
          initdata = client.gets.split(" ")
          if initdata[0] == "GET"
            HTTPserver.handle_client(initdata, client)
          elsif initdata[0] == "FTSEND"
            FTserver.handle_client(initdata, client)
          elsif initdata[0] == "FTSUBMIT"
            if client.peeraddr[2] == "127.0.0.1"
              FTserver.handle_file_submission(initdata, client)
            else
              client.puts "ERROR FILE_SUBMIT_NOTLOCAL"
              client.close
            end
          else
            client.close
          end
        end
      end
    end
  end
end
