Feature: test scenarios

### ONE TIME USE ONLY! ###
@accountCreation
Scenario: create an account
	Given open webpage "https://magento.softwaretestingboard.com/"

	When click "Create an Account"
	Then verify "Account creation page"

	When fill form field "Create first name" "Test"
	When fill form field "Create last name" "User"
	When fill form field "Create email" "testuser@teskjhkjht.test"
	When fill form field "Create password" "Password123"
	When click "Submit account creation form"
	Then verify "Account created succesfully"
  
@signin
Scenario: sign user in and sign user out
	Given open webpage "https://magento.softwaretestingboard.com/"

	When click "Sign in"
	Then verify "Account sign in page"

	When fill form field "Email" "testuser@teskjhkjht.test"
	When fill form field "Password" "Password123"
	When click "Submit account sign in form"
	Then verify "Account signed in succesfully"

	When click "Sign out"
	Then verify "Account signed out succesfully"
	
@purchase
Scenario: purchase a product
	Given open webpage "https://magento.softwaretestingboard.com/"
	
	# SIGN IN
	When click "Sign in"
	Then verify "Account sign in page"
	When fill form field "Email" "testuser@teskjhkjht.test"
	When fill form field "Password" "Password123"
	When click "Submit account sign in form"
	Then verify "Account signed in succesfully"
	
	# NAVIGATE TO SALES PAGE
	When click "Sale"
	When click "Jackets"
	When filter "Pattern" "Color-Blocked"
	When select product "Inez Full Zip Jacket" "XS" "Red" "2"
	When click "Add to cart"
	Then verify "Succesfully added to cart"

	When click "Open cart"
	When click "Proceed to Checkout"
	Then verify "Checkout page"

	When fill form field "Street Address" "Test"
	When fill form field "City" "Miami"
	When fill form field "State/Province" "Florida"
	When fill form field "Zip/Postal Code" "909090"
	When fill form field "Country" "United States"
	When fill form field "Phone Number" "000000000000"
	When click "Best Way Shipping"

  
