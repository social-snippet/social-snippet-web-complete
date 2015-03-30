::Completer::Application.helpers do
  
  def new_ranges(src, dest)
    ranges = []
    lines = []
    cnt = 0
    last_cnt = -1

    # find new lines
    ::Diff::LCS.sdiff(src, dest).each do |change|
      if change.action == "+" && cnt > last_cnt
        last_cnt = cnt
        lines.push cnt
      end
      if change.new_element == "\n"
        cnt += 1
      end
    end

    # convert to range
    from = nil
    actual = lines.first
    lines.to_a.slice_before do |cur|
      expected, actual = actual.next, cur
      expected != actual
    end.map do |seq|
      {
        :front => seq.first,
        :to => seq.last,
      }
    end
  end

end
