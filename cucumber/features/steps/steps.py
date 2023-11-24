from behave import *
from selenium.webdriver.common.by import By
from selenium import webdriver

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
