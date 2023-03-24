exe=[]

Gem::Specification.new do |s|
  s.name        = 'tcpfiletransfer'
  s.version     = "0.0.0"
  s.summary     = "Transfer files between linux computers"
  s.description = "An easy way to transfer files over TCP between linux computers"
  s.authors     = ["Matthias Lee"]
  s.email       = 'matthias@matthiasclee.com'
  s.files       = [
  ] + exe.map{|i|"bin/#{i}"}
  s.executables = exe
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/Matthiasclee/filetransfer'
end
