Given(/^I am on "([^"]*)"$/) do |url|
  visit url
end

Then(/^I should see text "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should not see text "([^"]*)"$/) do |text|
  expect(page).to have_no_content(text)
end

Then(/^I should see selector "([^"]*)"$/) do |selector|
  expect(page).to have_selector(selector)
end

Then(/^I should not see selector "([^"]*)"$/) do |selector|
  expect(page).to have_no_selector(selector)
end

Then(/^Count of selector "([^"]*)" is "([^"]*)"$/) do |selector, count|
  expect(page).to have_selector(selector, :count => count)
end

Then(/^Find all gallery image urls$/) do
  puts page.all(:css, "img.iq-img.product-image-img").size()
  url = page.all(:css, "img.iq-img.product-image-img").at(0)['data-src-desktop']
  puts "The first URL is \n" + url
end

Then(/^Find all product names$/) do
  
  def check_names(css)
  	products = page.all(:css, css)
    puts products.size()
  	for p in products
	  	name = p.text
	  	name = name[6,name.size()]
	  	name =name.delete "™"
	  	name =name[1,name.size()]
	  	puts name
	
	end
  end
  
  check_names(".product-name")

end

Then(/^Find all products in Compatibility Filter$/) do
  puts page.all(:css, ".btn-alt-special").size()
  url = page.all(:css, ".dropdown-menu-alt li a").at(0)['data-display-name']
  puts "The first products is \n" + url
end

Then(/^Check SVG link$/) do
html= page.body

  if html["https://www.w3.org/2000/svg"]
    next
  else
    fail 'SVG ishould be https!'
  end
end

