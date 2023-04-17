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

#### Install zenity
Zenity is used to make popups, and is required. Before doing this step, check if
you already have zenity installed.
```sh
which zenity # should give a result if installed
```
If you don't get a result, it's not installed. Install zenity as follows:
```sh
sudo apt install zenity
```

#### OPTIONAL: Install nmap
Nmap is used to scan for available recipients on the network.
```sh
sudo apt install nmap
```

## Usage

### Sending
#### Via right click action
To send a file with the right click action, right click it and click "Send file".
Enter the hostname or IP of the recipient, or leave it blank to scan for recipients
with nmap. Now, the recipient should receive a pop-up prompting them to accept
the file. After they accept it and the transfer completes, or they decline it, you
will get a pop-up message.
*Using nmap as of now assumes the computer is on a on a 192.168.0.0/24 network.*

#### Receiving
To receive a file, the filetransfer server must be running. When someone sends you
a file, you'll receive a pop-up prompting you to accept or decline it with the file
name and size. Closing the pop-up declines the transfer. If you accept it, you will
be prompted to choose a location to save the file. The file will download and save.
