xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Memo42 news"
    xml.description "Descrição"
    xml.link facts_url

    @facts.each do |fact|
      xml.item do
        xml.title fact.description[0..20]
        xml.description fact.description
        xml.pubDate fact.created_at.to_s(:rfc822)
        xml.link fact_url(fact)
        xml.guid fact_url(fact)
      end
    end
  end
end