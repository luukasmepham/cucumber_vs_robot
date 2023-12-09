Feature: test scenarios

@accountcreation
Scenario: create an account
	Given open webpage "https://magento.softwaretestingboard.com/"

	When click "Create an Account"
	Then verify "Account creation page"

	When fill form field "Create first name" "Test"
	When fill form field "Create last name" "User"
	When fill form field "Create email" "testuser@asdfff.test"
	When fill form field "Create password" "Password123"
	When click "Submit account creation form"
	Then verify "Account created succesfully"
  
@signin
Scenario: sign user in and sign user out
	Given open webpage "https://magento.softwaretestingboard.com/"

	When click "Sign in"
	Then verify "Account sign in page"

	When fill form field "Email" "testuser@asdfff.test"
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
	When fill form field "Email" "testuser@asd.test"
	When fill form field "Password" "Password123"
	When click "Submit account sign in form"
	Then verify "Account signed in succesfully"
	
	# NAVIGATE TO SALES PAGE
	When click "Sale"
	When click "Jackets"

	# FIND AND ADD TO CART A JACKET
	When filter "Pattern" "Color-Blocked"
	When select product "Inez Full Zip Jacket" "XS" "Red" "2"
	When click "Add to cart"
	Then verify "Succesfully added to cart"

	# OPEN THE CARD AND GO TO CHECKOUT
	When click "Open cart"
	When click "Proceed to Checkout"
	Then verify "Checkout page"

	# FILL BILLING INFO
	When fill form field "Street Address" "Test"
	When fill form field "City" "Oulu"
	When fill form field "State/Province" "Oulu"
	When fill form field "Zip/Postal Code" "90100"
	When fill form field "Country" "Finland"
	When fill form field "Phone Number" "000000000000"
	When click "Flat Rate Shipping"
	When click "Next"
	Then verify "Payment method page"

	# PLACE THE ORDER
	When click "Place Order"
	Then verify "Confirmation page"

	# SIGN OUT
	When click "Sign out"
	Then verify "Account signed out succesfully"

  
