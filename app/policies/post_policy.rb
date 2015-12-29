# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    @user == @post.user
  end

  def destroy?
    @user == @post.user
  end

  def edit?
    update?
  end
end