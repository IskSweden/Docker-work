#!/bin/sh

# hier den eigenen public-key eintragen

public_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQy6tXtNcSH40AE8cmjO2aNhYLqKIAEGesLeqhbSfUIDczWuXhSbwKE5bcgfPo9NBeYysK/xD1/DhBmlD/w1TmVTnzqN2zP6lJGI0rkCFagdQx2u6bMZsC9aFsQ/e9h8xkAPsod6HvkovcUSKnQY/JyyDRcJmyxUgL0Yw7oGSwSaxqh6pXBNLfAVmUFiqRlPq+Cw3l07vkI5eBeal2pz9782XNBWHXfTTkAiInUjWJVUz3gTaHYUQf5EFJSgbKG2OfzpNGECMLTB7dtYOptxz67othC5lYMrbTD+L73XJRVR4L8lI8FV+LMn0Rd2lHgJS08sMU3zGToTvVRHIhJzUi6dj7dRSJGGXX7bLjXbR25qz73dKif75ftMdceQbnnGp4UNSPO3p8s5Agy+jBsYM+NZzjT2dCMAnSfW9qIvD2YRFS+pl07Uc28M/yahje/iWSHqRut9N8LjRSjW5+y4TRf4YKJU7XQasTezWhuUVSJcsJ+6F1YXRLuLF8pWISWdE='

# add public key for usr vagrant
echo $public_key >> /home/vagrant/.ssh/authorized_keys

# add public key for root
chmod 700 /root/.ssh
echo $public_key >> /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

