module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      reject_unauthorized_connection unless find_verified_user
      # WebSocket接続が開いている場合は閉じて404を返す
    end

    private

    def find_verified_user
      self.current_user = env['warden'].user
    end
  end
end
