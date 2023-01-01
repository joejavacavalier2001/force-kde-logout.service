# force-kde-logout.service

## Introduction
I wrote this sytemd service for Fedora 37 Workstation with KDE/Plasma Wayland graphical sessions.
On those systems, sometimes the logout mechanism hangs with a blank screen with no return to the login window.

This service is meant to be a patch until KDE and sddm are upgraded and fixed to address this problem.
This service consists of a systemd unit file and a Perl script that runs in the background.
The Perl script will restart the sddm service when the plasma shutdown program is executed.

## Dependencies

### Perl
I tested this Perl script using Perl version v5.36.0 .

### Perl module Linux::Inotify2
You should be able to install the dnf package "perl-Linux-Inotify2".

## File locations

### force-kde-logout.service unit file
/usr/lib/systemd/system/

### force\_logout.pl
/usr/local/bin

When running "mv" or "cp" to move or copy the files,   
you may want use the -Z option to ensure that the files are moved or copied  
with the proper SELinux labels in the destination directories.  

## File ownership/permissions

The unit file should be owned by root user and root group.  
It should have a SELinux type label of "systemd\_unit\_file\_t".  
Running "restorecon" on the directory may be able to fix SELinux labeling issues.  

The Perl script should be owned by root user and root group.  
It should be executable.  
You may need to run "chmod +x \<path-to-script\>/force\_logout.pl"  
It should have a SELinux type label of "bin\_t" .  

## Installation

### Follow instructions above to place the files in the correct directories with the correct permissions and SELinux labels  
### Enable the service  
sudo systemctl enable force-kde-logout.service  
sudo systemctl start force-kde-logout.service  

