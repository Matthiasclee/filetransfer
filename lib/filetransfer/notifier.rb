module FileTransfer
  module Notifier
    def self.file_transfer_notification(filename:, source:, filesize:, accept_link:, decline_link:)
      notification_title = "Incoming file transfer from #{source}"
      fileinfo = "Name: #{filename}\nSize: #{filesize}"
      links = "Accept: #{accept_link}\nDecline: #{decline_link}"
      notification_body = "#{fileinfo}\n#{links}"
      notification_command = "notify-send '#{notification_title}' \"#{notification_body}\""
      system(notification_command)
    end
  end
end
