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
    # TODO: replace .sort with bubble sort
    strs = strs.sort{|s1,s2| s1[b].to_i <=> s2[b].to_i}
    p strs
  end
  strs.map &:to_i
end

def merge_sort(vals)
  if vals.length == 2
    vals[0],vals[1] = vals[1],vals[0] if vals[0] > vals[1]
  else
    p = vals.length / 2
    v1 = vals[0..p-1]
    v2 = vals[p..-1]
    merge_sort v1


  vals
end
