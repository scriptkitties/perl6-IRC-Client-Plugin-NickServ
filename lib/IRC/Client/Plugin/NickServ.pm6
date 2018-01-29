#! /usr/bin/env false

use v6.c;

use Config;
use IRC::Client;

class IRC::Client::Plugin::NickServ does IRC::Client::Plugin
{
	has Config $.config;

	method irc-n376($e)
	{
		# Extract the config parameters
		my Str $nick = $!config<nickserv><nickname>
			// $!config<bot><nickname>;
		my Str $pass = $!config<nickserv><password>;

		# Send the identify command
		$e.irc.send-cmd: "NS identify $nick $pass";
	}
}

# vim: ft=perl6 noet
