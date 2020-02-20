class BestNovels::Scraper
  def self.scrape_novels
    site = "https://www.theguardian.com/books/2015/aug/17/the-100-best-novels-written-in-english-the-full-list"
    doc = Nokogiri::HTML(open(site))
    novels = doc.css("div.content__article-body.from-content-api.js-article__body p strong")
    novels.each do |n|
      title = n.css("a.u-underline").text.strip
      BestNovels::Novel.new(title)
   end
  end
end
