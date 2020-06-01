# frozen_string_literal: true

module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @visitor_comment = notification.comment_id
    case notification.action
    when 'follow'
      tag.a(notification.visitor.username, href: user_path(@visitor)) + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.visitor.username, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id)) + 'にいいねしました'
    when 'comment' then
      @comment = Comment.find_by(id: @visitor_comment)
      @comment_content = @comment.content
      @micropost_title = @comment.post.img
      tag.a(@visitor.username, href: user_path(@visitor)) + 'が' + tag.a(@micropost_title.to_s, href: post_path(notification.post_id)) + 'にコメントしました'
    end
  end
end
