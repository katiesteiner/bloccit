class PostPolicy < ApplicationPolicy
  def index?
    true
  end
  class Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.member?
        self.post
      else
        scope.where(published: true)
      end
    end
    def updated?
      user.admin? or not post.published?
    end
  end
end