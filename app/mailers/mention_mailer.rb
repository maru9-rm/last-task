class MentionMailer < ApplicationMailer
    def at_mark(user,commenter)
        @user = user
        @commenter = commenter
        mail to: user.email, subject: '【お知らせ】メンションされました！'
    end

end
  