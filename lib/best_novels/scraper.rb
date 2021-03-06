class BestNovels::Scraper
  #class method
  def self.scrape_novels
    site = "https://www.theguardian.com/books/2015/aug/17/the-100-best-novels-written-in-english-the-full-list"
    doc = Nokogiri::HTML(open(site))
    novels = doc.css("div.content__article-body.from-content-api.js-article__body p strong")
    novels.each do |n|
      title = n.css("a.u-underline").text.strip
      url = n.css("a").attr("href").value
      BestNovels::Novel.new(title, url)
   end
  end

  #class method
  def self.scrape_review(novel)
    url = "#{novel.url}"
    doc = Nokogiri::HTML(open(url))
    doc.css("div.content__article-body.from-content-api.js-article__body p:first-of-type").each do |paragraph|
    novel.review = paragraph.text.strip
  end
end
end
