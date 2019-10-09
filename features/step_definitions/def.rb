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

Given(/^I select products to compare$/) do
  check('Select to compare')
end

When(/^Check head service$/) do
  html= page.body
  
  if html["SONYMOBILE.COM SERVICES API - BEGIN: HEAD"]
  else
    fail 'Head service should be up!'
  end
  
  if html["/wp-content/assets/css/global"]
  else
    fail 'Head service should be up!'
  end
end

Then(/^Print current url$/) do
  print page.current_url
end

Given("Check the product number") do
  css= ".product-name"
  products = page.all(:css, css)
  @product_number1 = products.size()
  puts @product_number1
end

When("Check the 4K Display Filter") do
  click_on(class: 'btn-alt-special')
  expect(page).to have_content('4K display')
end

Then("Product number should be less then before") do
  css= ".product-name"
  products = page.all(:css, css)
  @product_number2 = products.size()
  puts @product_number2
end

When("Reload {string}") do |string|
  visit string
  visit string
end

