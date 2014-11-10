class Post
  require 'active_model'
  include ActiveModel::Validations

  validates :title, presence: true

  attr_accessor :blog, :title, :body, :pubdate

  def initializer(attr={})
    attr.each do |k, v| send("#{k}=",v) end
  end

  def publish(clock=DateTime)
    self.pubdate = clock.now
    blog.add_entry(self)
  end

  def persisted?
    false
  end
end
