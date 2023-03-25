require_relative "lib/filetransfer.rb"

exe=['filetransfer_server']

Gem::Specification.new do |s|
  s.name        = 'tcpfiletransfer'
  s.version     = FileTransfer.version
  s.summary     = "Transfer files between linux computers"
  s.description = "An easy way to transfer files over TCP between linux computers"
  s.authors     = ["Matthias Lee"]
  s.email       = 'matthias@matthiasclee.com'
  s.files       = FileTransfer.file_paths + exe.map{|i|"bin/#{i}"}
  s.executables = exe
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/Matthiasclee/filetransfer'
end
