class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title

  after_save :make_slug

  validates_presence_of :title, :content

  def make_slug
    self.slug = self.title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

  private

  def titleize_title
    self.title = title.titleize
  end
end











