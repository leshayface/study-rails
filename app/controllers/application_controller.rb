class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ensure_member_is_allowed



  def ensure_member_is_allowed
    if current_member
      if current_member.status == false
        render text: "sorry, you have been disabled."
      end
    end
  end

end
