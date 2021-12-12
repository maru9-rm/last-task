class MentionMailer < ApplicationMailer
    def at_mark(user)
        @user = user
        mail to: user.email, subject: '【お知らせ】@mentionされました'
    end

end
  