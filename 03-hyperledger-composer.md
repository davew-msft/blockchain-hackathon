TODO

This lab is not yet complete.

We are going to use Hyperledger Composer, so you don’t need coding experience to complete this lab, to build an online "smart" auction.




Go to the Hyperledger Composer website at https://composer-playground.mybluemix.net/login.
Click carauction-network under the Samples on NPM section.
Click Connect Now on the carauction-network.
Step 2: Setting up auction windows
To set up an auction window, follow these steps:

Open a second browser tab.
Copy and paste the URL from your first tab into the second browser tab.
On your first tab, click Define.
On your second tab, click Test.
Step 3: Creating an auctioneer
To create an auctioneer, follow these steps:

Open the Define window.
Copy this command:
{
'$class': 'org.acme.vehicle.auction.Auctioneer',
'email': 'auction@acme.org',
'firstName': 'Jenny',
'lastName': 'Jones'
}

Open the Test window.
Click Create New Participant.

Paste this command:
{
'$class': 'org.acme.vehicle.auction.Auctioneer',
'email': 'auction@acme.org',
'firstName': 'Jenny',
'lastName': 'Jones'
}

Click Create New.

To create two participants, follow these steps:

Open the Define window.
Copy this command:
{
'$class': 'org.acme.vehicle.auction.Member',
'balance': 5000,
'email': 'memberA@acme.org',
'firstName': 'Amy',
'lastName': 'Williams'
}

Open the Test window.
Click Member.
Click Create New Participant.
Paste this command:
{
'$class': 'org.acme.vehicle.auction.Member',
'balance': 5000,
'email': 'memberA@acme.org',
'firstName': 'Amy',
'lastName': 'Williams'
}

Click Create New.
Repeat steps 1 through 6 for the second participant.



Step 5: Creating a new asset
To create a new asset, follow these steps:

Open the Define window.
Copy this command:
{
'$class': 'org.acme.vehicle.auction.Vehicle',
'vin': 'vin:1234',
'owner': 'resource:org.acme.vehicle.auction.Member#memberA@acme.org'
}

Open the Test window.
Click Vehicle.
Click Create New Asset.
Paste this command:
{
'$class': 'org.acme.vehicle.auction.Vehicle',
'vin': 'vin:1234',
'owner': 'resource:org.acme.vehicle.auction.Member#memberA@acme.org'
}

Click Create New.


Step 6: Creating a new listing
To create a new listing, follow these steps:

Open the Define window.
Copy this command:
{
'$class': 'org.acme.vehicle.auction.VehicleListing',
'listingId': 'listingId:ABCD',
'reservePrice': 3500,
'description': 'Arium Nova',
'state': 'FOR_SALE',
'vehicle': 'resource:org.acme.vehicle.auction.Vehicle#vin:1234'
}

Open the Test window.
Click VehicleListing.
Click Create New Asset.
Paste this command:
{
'$class': 'org.acme.vehicle.auction.VehicleListing',
'listingId': 'listingId:ABCD',
'reservePrice': 3500,
'description': 'Arium Nova',
'state': 'FOR_SALE',
'vehicle': 'resource:org.acme.vehicle.auction.Vehicle#vin:1234'
}

Click Create New.

At this point you've created a smart auction, listed a vehicle for sale, and created 3 parties that are needed to fulfill the contract.  With everything set up we are going to trigger the smart auction and transfer the var from owner to buyer.  

Step 7: Auctioning off the car
To auction off the car, follow these steps:

Open the Define window.
Copy this command:
{
 
'$class': 'org.acme.vehicle.auction.Offer',
'bidPrice': 3500,
'listing': 'resource:org.acme.vehicle.auction.VehicleListing#listingId:ABCD',
'member': 'resource:org.acme.vehicle.auction.Member#memberB@acme.org'
}

Open the Test window.
Click Submit Transaction.
Select Offer from the pull-down menu.
Paste this command:
{
 
'$class': 'org.acme.vehicle.auction.Offer',
'bidPrice': 3500,
'listing': 'resource:org.acme.vehicle.auction.VehicleListing#listingId:ABCD',
'member': 'resource:org.acme.vehicle.auction.Member#memberB@acme.org'
}

Click Submit.
Step 8: Closing your auction
To close your auction, follow these steps:

Open the Define window.
Copy this command:
{
'$class': 'org.acme.vehicle.auction.CloseBidding',
'listing': 'resource:org.acme.vehicle.auction.VehicleListing#listingId:ABCD'
}

Open the Test window.
Click Submit Transaction.
Select CloseBidding from the pull-down menu.
Paste this command:
{
'$class': 'org.acme.vehicle.auction.CloseBidding',
'listing': 'resource:org.acme.vehicle.auction.VehicleListing#listingId:ABCD'
}

Click Submit.

To learn more check out the Hyperledger community found at https://hyperledger.github.io/composer/latest/support/support-index.html.

