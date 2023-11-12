from behave import *

@given('url is for DuckDuckGo')
def step(context):
	context.driver.get("https://www.duckduckgo.com/")
	print("Opened DuckDuckGo")
	
@then('verify url is for DuckDuckGo — Privacy, simplified.')
def step(context):
	if context.driver.title == "DuckDuckGo — Privacy, simplified.":
		print("Verified title is DuckDuckGo — Privacy, simplified.")
	else:
		print("Verified title is not DuckDuckGo — Privacy, simplified.")
