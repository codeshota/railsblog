class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end
 
  def destroy?
    user.present? && user == comment.user || user.present? && user.admin?
  end
 
  private
 
    def comment
      record
    end
end