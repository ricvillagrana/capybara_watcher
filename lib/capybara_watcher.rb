require_relative './capybara_watcher/configuration'

module CapybaraWatcher
  def self.configure
    yield Configuration.options
  end

  def looped?
    # define N seconds to let test continue.
    @seconds >= Configuration.options[:timeout]
  end

  def wait_for_changes(repeat = 1)
    begin_to_watch(body, repeat)
  end

  def before_wait(repeat = 1)
    yield
    begin_to_watch(body, repeat)
  end

  def wait_until_content_has(text)
    snap = body
    5.times do
      @seconds = 0 # reset seconds count

      while snap == body do
        break if page.has_content?(text) && yield(text)
        break if looped?
        sleep 0.1
        @seconds += 0.1
      end
    end
  end

  private

  def begin_to_watch(snap = body, repeat = 1)
    repeat.times do
      @seconds = 0 # reset seconds count

      while snap == body do
        break if looped?
        sleep 0.1
        @seconds += 0.1
      end
    end
  end
end
