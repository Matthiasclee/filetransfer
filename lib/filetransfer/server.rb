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
          else
            client.close
          end
        end
      end
    end
  end
end
