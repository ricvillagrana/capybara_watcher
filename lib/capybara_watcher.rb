module CapybaraWatcher
  def looped?
    # define N seconds to let test continue.
    @seconds >= 4
  end

  def wait_for_changes(repeat = 1)
    repeat.times do
      @seconds  = 0     # reset seconds count
      snap      = body  # define a snap of the current body

      while snap == body do
        break if looped?
        sleep 0.1
        @seconds += 0.1
      end
    end
  end
end
