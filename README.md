
WHAT IS MULTIPASS 
------------------
Ubuntu VMs on demand for any workstation
Get an instant Ubuntu VM with a single command. Multipass can launch and run virtual machines and configure them with cloud-init like a public cloud. Prototype your cloud launches locally for free.

Download https://multipass.run 


LINUX MULTIPASS GUI ESCAPE 
--------------------------
The GUI "Primary" VM in Multipass for Linux automounts the 
$HOME of the host OS user that runs multipass. This makes 
it trivial to get a RCE under certain default conditions.
Tested on Ubuntu 20.04 host OS with passwordless sudo  

- This behavior was not observed on a custom user created VMs from command line. Seems 
to affect only the default "Primary" guest VM created from the GUI launcher  


MACOS MULTIPASS GUI ESCAPE
--------------------------

It seems that the GUI "primary" instance VM Ubuntu 20.04
of Multipass 1.8.1+mac contains a default enabled  
mount of host's home directory in /home/ubuntu/Home 
This can be abused as a simple guest escape 
Modification of host's OS user zsh profiles to include 
malicious commands. 

Interesting privilege escalation exists on the 
current MacOS Monterey and BigSur (that use zsh) 

Exploit works on the default zsh environment 
of MacOS + multipass how it automounts $user 
$home directory 
We are taking an advantage of the Multipass's 
creation of /usr/local/bin so we can hide our 
backdoor there.
It is not possible to use a copy of the Host's /bin/zsh 
directly in /usr/local/bin  
cp /bin/zsh ./shell 
./shell 
zsh: exec format error: ./shell 
So in this exploit we are using a copied zsh executable 
from a MacOS Monterey VM which does not have such restrictions. 
The executable is included with the exploit as shell 

sha256 checksums 

e295e503f352bb1e9867c99bc342940abca2bd19dcb8a05890f44ab9a9f628d1  shell
ca105d66a4afe2c87d5d6000eb7245f02624cc23076e4e4788d4f4d66f927861  shell-pre-12.1

- This behavior was not observed on a custom user created VMs from command line. Seems 
to affect only the default "Primary" guest VM created from the GUI launcher 


