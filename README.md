dDNS
====

This is a simple Multiple Dynamic DNS Bash script I created to update all the hosts I use.
It is an insecure script that uses the direct Update URL via the HTTP Protocol.

It checks the domain by pinging it before attempting to update the DNS. 
If the Ping fails, the update command is sent. 
The script runs on a loop every half an hour.

Edits in the script are required for Usernames/Passwords/Hostnames etc.

If you have any more dynamic DNS providers you would like adding or have any improvements that you would like adding, 
Please use Git Issues or Git Pull requests.

Currently supports -

Top Level dDNS Suppliers
------------------------
dnsEXIT.com, Sitelutions.com

Subdomain dDNS Suppliers
------------------------
No-IP.org, Dyn.com, ClouDNS.net, ChangeIP.com

I take no reposibility for any problems this script my cause. 
Use at your own risk.
