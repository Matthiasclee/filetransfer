module FileTransfer
  module Notifier
    def self.file_transfer_notification(filename:, source:, filesize:, accept_link:)
      notification_title = "Incoming file transfer from #{source}"
      fileinfo = "Name: #{filename}\nSize: #{filesize}"
      notification_body = "#{fileinfo}\nWould you like to accept?"
      notification_command = "notify-send '#{notification_title}' \"#{notification_body}\""
      #system(notification_command)

      x=system("zenity --question --no-wrap --text=\"#{notification_body}\" --title='#{notification_title}'")
      if x
        file_location = `zenity --file-selection --save --filename=#{filename}`
        open(accept_link) do |f|
          File.open(file_location, "wb") do |file|
            file.write(f.read)
          end
        end
      end
    end
  end
end
