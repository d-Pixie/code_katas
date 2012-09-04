def insertion_sort(vals)
  res = []
  vals.each do |v|
    res = [v] and next if res.empty?
    set = res.each_index{|i| res = res.insert(i,v) and break if res[i] > v }
    res << v if set
  end
  res
end

def bubble_sort(vals)
  changed = true;
  while changed do
    changed = false;
    (0..vals.length-2).each do |i|
      if vals[i] > vals[i+1]
        vals[i],vals[i+1] = vals[i+1],vals[i]
        changed = true;
      end
    end
  end
  vals
end

def radix_sort(vals)
  strs = vals.map(&:to_s)
  longest = strs.max_by(&:length).length
  strs = strs.map{|s| s.rjust(longest,'0')}
  (longest-1).downto(0) do |b|
    buckets = [[],[],[],[],[],[],[],[],[]]
    strs.each do |s|
      buckets[s[b].to_i] << s
    end
    strs = buckets.flatten
  end
  strs.map &:to_i
end

def merge_sort(vals)
  if vals.length == 2
    vals[0],vals[1] = vals[1],vals[0] if vals[0] > vals[1]
  elsif vals.length > 2
    p = vals.length / 2
    v1 = merge_sort vals[0..p-1]
    v2 = merge_sort vals[p..-1]
    continue = true
    e1 = e2 = nil
    vals = []
    while continue
      e1 = v1.delete_at(0) if e1.nil? and v1.present?
      e2 = v2.delete_at(0) if e2.nil? and v2.present?
      if e1 and e2
        if e1 <= e2
          vals << e1
          e1 = nil
        else
          vals << e2
          e2 = nil
        end
      elsif e1
        vals << e1
        vals += v1 unless v1.empty?
        e1 = nil
        continue = false
      elsif e2
        vals << e2
        vals += v2 unless v2.empty?
        e2 = nil
        continue = false
      else
        continue = false
      end
    end
  end
  vals
end
