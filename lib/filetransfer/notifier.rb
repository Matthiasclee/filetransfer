module FileTransfer
  module Notifier
    def self.file_transfer_notification(filename:, source:, filesize:, accept_link:)
      notification_title = "Incoming file transfer from #{source}".gsub("\"", "")
      fileinfo = "Name: #{filename}\nSize: #{filesize}".gsub("\"", "")
      notification_body = "#{fileinfo}\nWould you like to accept?".gsub("\"", "")
      notification_command = "notify-send '#{notification_title}' \"#{notification_body}\"".gsub("\"", "")
      #system(notification_command)

      x=system("zenity --question --icon-name=document-save-symbolic.symbolic --no-wrap --text=\"#{notification_body}\" --title='#{notification_title}'")
      if x
        file_location = `zenity --title="Save file" --file-selection --save --filename=#{filename.chomp.gsub("\"", "")}`.chomp
        if file_location == ""
          f=open(accept_link + "/decline")
          f.read
          return
        end
        open(accept_link) do |f|
          File.open(file_location, "wb") do |file|
            file.write(f.read)
          end
        end
      else
        f=open(accept_link + "/decline")
        f.read
      end
    end
  end
end
