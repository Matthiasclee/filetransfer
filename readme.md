# FileTransfer
A utility similar to airdrop for transferring files between linux systems.

## Installation and Setup
Start by downloading the gem:
```sh
gem install tcpfiletransfer
```

Now, add the following line to `~/.bashrc`:
```sh
(filetransfer_server 2> /dev/null &)
```

## Usage
*Note: For all usage, a terminal window must be running.*
### Sending
To send files, use the `sendfile` commad:
```
$ sendfile /path/to/file.txt
Recipient: hostname-or-ip-or-recipient
```
### Recieving
To recieve files, ensure `filetransfer_server` is running. If you added the
line to your `.bashrc`, just make sure a terminal is open. When someone sends
you a file, you will get a notification with a link to accept it. If you
click the link, you will be taken to a web browser and the file will download.
