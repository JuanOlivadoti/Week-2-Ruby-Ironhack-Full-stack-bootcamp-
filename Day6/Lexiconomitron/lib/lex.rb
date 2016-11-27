class Lexiconomitron
  def eat_t(string)
    string.gsub(/t/i , "")
  end

  def shazam(array)
    shazam_a =[]
    shazam_a.push(array.first.reverse.gsub(/t/i , ""))
    shazam_a.push(array.last.reverse.gsub(/t/i , ""))
  end

  def oompa_loompa(array)
    oompa_a =[]
    oompa_a.push(array.each.lenght > 3)
  end
end
