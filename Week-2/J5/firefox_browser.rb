require 'watir'

browser = Watir::Browser.new(:firefox)
search_name = ARGV.first
abort('[firefox_browser] Missing parameter. Retry using command: >ruby firefox_browser.rb "the request" "') if ARGV.empty?
search = browser.goto 'duckduckgo.com'
search_bar = browser.text_field(class: 'js-search-input search__input--adv')

while true
    search
    search_bar.set(search_name)
    search_bar.send_keys(:enter)
    browser.driver.manage.timeouts.implicit_wait = 3
    #search_result_divs = browser.divs(class:"result__body links_main links_deep")
    #search_result_divs.each { |div| p div.h2.text }
    #browser.close 
    #break
end

