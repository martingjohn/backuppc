#!/usr/bin/env perl
use strict;

my $SUCCESS=0;
my $UNHEALTHY=1;

use lib "/usr/local/BackupPC/lib/";
use BackupPC::Lib;

my $connection;
#Connect with disabled user check
if (!($connection=BackupPC::Lib->new("","","",1)))
{
        print "Couldn't connect to BackupPC\n";
        exit $UNHEALTHY;
}

my %Conf=$connection->Conf();

my $err=$connection->ServerConnect($Conf{ServerHost}, $Conf{ServerPort});
if ($err)
{
        print "Can't connect to server ($err)\n";
        exit $UNHEALTHY;
}

print "Backuppc running\n";
exit $SUCCESS;
