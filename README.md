
1. Open the file vars/main.yml

- Provide the subscription infomation to be used to register and download necessary packages:

rhn_subscription_username: <username>
rhn_subscription_password: <password>
rhn_subscription_pool_id: <poolID>

- Provide the necessary packages that will be downloaded:

mirrors:
  - name: <name>.repo
    folder: <folder1>
    items:
        - item 1
        - item 2
  - name: <name>.repo
    folder: <folder2>
    items:
    	- item 3
    	- item 4

 For instance:

 mirrors:
  - name: rhel1.repo
    folder: rhel1
    items:
        - rhel-7-server-rpms
        - rhel-7-server-extras-rpms
        
  - name: rhel2. repo
    folder: rhel2
    items:
    	- rhel-7-server-rh-common-rpms
        - rhel-ha-for-rhel-7-server-rpms

- Provide the IP address where nginx listens on:

mirror_ip_address: <IP_ADDRESS>

2. Download nginx role

- ansible-galaxy install -r roles/requirements.yml -p roles/

3. Run the ansible playbook test_site.yml

- After running playbook, it will create multiple repo files inside /var/www/mirrors/general_mirror/
- Copy those files to servers where we would like to sync up
