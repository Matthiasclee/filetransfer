$active_transfers = {
}

module FileTransfer
  @@files = ['server.rb', 'notifier.rb', 'httpserver.rb', 'ftserver.rb']

  def self.version
    "0.0.3"
  end

  def self.file_paths(relative:false)
    x = @@files.map do |f|
      "#{"lib/" unless relative}filetransfer/#{f}"
    end

    if relative
      return x
    else
      return x + ['lib/filetransfer.rb']
    end
  end
end

require "socket"
require "open-uri"
FileTransfer.file_paths(relative:true).each do |f|
  require_relative f
end
