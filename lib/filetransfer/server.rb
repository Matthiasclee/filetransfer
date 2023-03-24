module FileTransfer
  class Server
    def initialize(port:8021, listen:"0.0.0.0")
      @port = port
      @listen = listen
    end

    def start
      @server = TCPServer.new(@listen, @port)
    end
  end
end
