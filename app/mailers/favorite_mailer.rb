class FavoriteMailer < ActionMailer::Base
  default from: "katiewkoenig@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@katiebloccit.herokuapp.com>"
    headers["In-Reply_To"] = "<post/#{post.id}@katiebloccit.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@katiebloccit.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
