class DelayClock
  def now
    DateTime.now + 24.hours
  end
end

@post.publish(DelayClock.new)
