# FileTransfer
A utility similar to airdrop for transferring files between linux systems.

## Installation and Setup
#### Download the gem
```sh
gem install tcpfiletransfer
```

#### Make the server launch on startup
Create a startup program with the following command:
```sh
bash -ic 'filetransfer_server'
```
#### Add right click action [nemo only]
Create `~/.local/share/nemo/actions/sendfile.nemo_action`:
```
[Nemo Action]
Active=true
Name=Send file
Exec=bash -ic "sendfile '%F'"
Icon-Name=document-send-symbolic
Selection=s
Extensions=any;
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
When someone sends you a file, you will get a notification with a link to
accept it. If you click the link, you will be taken to a web browser and
the file will download.
