from behave import *
from selenium.webdriver.common.by import By

@given('open webpage "{url}"')
def open_url(context, url):
	context.driver.get(url)
	context.driver.maximize_window()
	
@step('click "{element}"')
def click_element(context, element):
	match element:
		case "Sign in":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '/html/body/div[2]/header/div[1]/div/ul/li[2]/a').click()
		case "Sign out":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//button[@data-action="customer-menu-toggle"]').click()
			context.driver.find_element(By.XPATH, '//a[@href="https://magento.softwaretestingboard.com/customer/account/logout/"]').click()
		case "Create an Account":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//a[text()="Create an Account"]').click()
		case "Submit account creation form":
			context.driver.find_element(By.CSS_SELECTOR, '.submit').click()
		case "Submit account sign in form":
			context.driver.find_element(By.CSS_SELECTOR, '#send2').click()
		case "Sale":
			context.driver.find_element(By.CSS_SELECTOR, '#ui-id-8').click()
		case "Jackets":
			context.driver.find_element(By.XPATH, '//a[text()="Jackets"]').click()
		case "Add to cart":
			context.driver.find_element(By.ID, 'product-addtocart-button').click()
		case "Open cart":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//a[@href="https://magento.softwaretestingboard.com/checkout/cart/"]').click()
		case "Proceed to Checkout":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.ID, 'top-cart-btn-checkout').click()
		case "Flat Rate Shipping":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//input[@value="flatrate_flatrate"]').click()
		case "Next":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//span[text()="Next"]').click()
		case "Place Order":
			context.driver.implicitly_wait(10)
			elem = context.driver.find_element(By.XPATH, '//*[text()="Place Order"]')
			context.driver.execute_script("arguments[0].scrollIntoView();", elem)
			context.driver.execute_script("arguments[0].click();", elem) 
	
@step('verify "{condition}"')
def verify(context, condition):
	match condition:
		case "Account sign in page":
			context.driver.implicitly_wait(5)
			context.driver.find_element(By.CSS_SELECTOR, '#email')
			assert context.driver.title == "Customer Login"
		case "Account creation page":
			context.driver.implicitly_wait(5)
			context.driver.find_element(By.CSS_SELECTOR, '#firstname')
			assert context.driver.title == "Create New Customer Account"
		case "Account created succesfully":
			context.driver.implicitly_wait(5)
			context.driver.find_element(By.XPATH, '//div[text()="Thank you for registering with Main Website Store."]')
		case "Account signed in succesfully":
			context.driver.implicitly_wait(5)
			context.driver.find_element(By.CSS_SELECTOR, '.logged-in')
		case "Account signed out succesfully":
			context.driver.implicitly_wait(3)
			context.driver.find_element(By.CSS_SELECTOR, '.customer-account-logoutsuccess')
		case "Sale page":
			context.driver.implicitly_wait(5)
			context.driver.find_element(By.XPATH, '//span[text()="Sale"]')
			assert context.driver.title == "Sale"
		case "Jackets page":
			context.driver.implicitly_wait(5)
			context.driver.find_element(By.XPATH, '//span[text()="Jackets"]')
			assert context.driver.title == "Jackets - Tops - Women"
		case "Succesfully added to cart":
			context.driver.implicitly_wait(5)
			context.driver.find_element(By.CLASS_NAME, 'message-success')
		case "Checkout page":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//div[text()="Shipping Address"]')
			assert context.driver.title == "Checkout"
		case "Payment method page":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//div[text()="Payment Method"]')
			assert context.driver.title == "Checkout"
		case "Confirmation page":
			context.driver.implicitly_wait(10)
			context.driver.find_element(By.XPATH, '//span[text()="Thank you for your purchase!"]')
			assert context.driver.title == "Success Page"
			
@step('fill form field "{field}" "{value}"')
def fill_form(context, field, value):
	match field:
		case "Create first name":
			context.driver.find_element(By.CSS_SELECTOR, '#firstname').send_keys(value)
		case "Create last name":
			context.driver.find_element(By.CSS_SELECTOR, '#lastname').send_keys(value)
		case "Create email":
			context.driver.find_element(By.CSS_SELECTOR, '#email_address').send_keys(value)
		case "Create password":
			context.driver.find_element(By.CSS_SELECTOR, '#password').send_keys(value)
			context.driver.find_element(By.CSS_SELECTOR, '#password-confirmation').send_keys(value)
		case "Password":
			context.driver.find_element(By.CSS_SELECTOR, '#pass').send_keys(value)
		case "Email":
			context.driver.find_element(By.CSS_SELECTOR, '#email').send_keys(value)
		case "Shipping first name":
			context.driver.find_element(By.NAME, 'firstname').send_keys(value)
		case "Shipping last name":
			context.driver.find_element(By.NAME, 'lastname').send_keys(value)
		case "Street Address":
			context.driver.find_element(By.NAME, 'street[0]').send_keys(value)
		case "City":
			context.driver.find_element(By.NAME, 'city').send_keys(value)
		case "State/Province":		
			context.driver.find_element(By.NAME, 'region_id').send_keys(value)
		case "Zip/Postal Code":
			context.driver.find_element(By.NAME, 'postcode').send_keys(value)
		case "Country":
			context.driver.find_element(By.NAME, 'country_id').send_keys(value)
		case "Phone Number":
			context.driver.find_element(By.NAME, 'telephone').send_keys(value)

@step('filter "{field}" "{value}"')
def filter_element(context, field, value):
		context.driver.implicitly_wait(10)
		context.driver.find_element(By.XPATH, '//div[text()="' + field + '"]').click()
		context.driver.implicitly_wait(10)
		context.driver.find_element(By.XPATH, '//a[contains(text(),"' + value + '")]').click()

@step('select product "{product}" "{size}" "{color}" "{quantity}"')
def select_product(context, product, size, color, quantity):
		context.driver.implicitly_wait(10)
		context.driver.find_element(By.XPATH, '//a[contains(text(),"' + product + '")]').click()
		context.driver.implicitly_wait(10)
		context.driver.find_element(By.XPATH, '//div[text()="' + size + '"]').click()
		context.driver.implicitly_wait(10)
		context.driver.find_element(By.XPATH, '//div[@option-label="' + color + '"]').click()
		context.driver.implicitly_wait(10)
		context.driver.find_element(By.ID, 'qty').click()
		context.driver.find_element(By.ID, 'qty').clear()
		context.driver.find_element(By.ID, 'qty').send_keys(quantity)
 