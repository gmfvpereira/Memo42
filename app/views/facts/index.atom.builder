atom_feed do |feed|
  feed.title "Memo42"

  @facts.each do |fact|
    feed.entry fact  do |entry|
      entry.title fact.description[0, 20]
      entry.content fact.description
    end
  end
end