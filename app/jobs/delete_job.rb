class DeleteJob < ApplicationJob
  queue_as :default

  def perform
    passed_walk = Walk.all.select { |walk| walk.start_time.hour <= Time.now.hour && walk.date <= Date.today }
    passed_walk_with_min = passed_walk.select {|walk| walk.start_time.min < Time.now.min}
    passed_walk_with_min.each do |walk|
      walk.destroy
  end
  end
end
