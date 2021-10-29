# Cybersecurity
# README.md
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![ID_CloudNetworkTopology](https://user-images.githubusercontent.com/86072553/139511611-47b2a7e1-29b8-443d-93d7-4414ed31ea9e.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

Ansible/ansible-playbook.yml

Install Ansible with DVWA Containers
Install ELK
Filebeat Playbook
Metricbeat Playbook

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, especially when the network is experiencing high traffic loads by distributing incoming traffic. In addition, load balancing restricts access to the network.

A Jump Box limits access to systems increasing security while allowing for easy administration of multiple systems.

Integrating an ELK server allows administrators to easily monitor the vulnerable VMs for changes to event logs, system traffic, and system metrics.

Filebeat collects information, logs data, and allows analysts to monitor files for suspicious changes.

Metricbeat records machine metrics allowing for easy monitoring of specific system information of machines in a network.

| Name               | Function        | IP Address | Operating System     |
|--------------------|-----------------|------------|----------------------|
| JumpBoxProvisioner | Gateway         | 10.0.0.4   | Linux (ubuntu 18.04) |
| Web-1              | VM- DVWA Docker | 10.0.0.5   | Linux (ubuntu 18.04) |
| Web-2              | VM- DVWA Docker | 10.0.0.6   | Linux (ubuntu 18.04) |
| ELK-SERVER         | VM- ELK Stack   | 10.1.0.4   | Linux (ubuntu 18.04) |

_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBoxProvisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: Workstation IP

Machines within the network can only be accessed by the JumpBoxProvisioner machine.
The ELK-SERVER is only accessible from the JumpBoxProvisioner private IP 10.0.0.4 and the Workstation private IP.


A summary of the access policies in place can be found in the table below.

|        Name        | Publicly  Accessible | Allowed IP Addresses |
|:------------------:|:--------------------:|:--------------------:|
| JumpBoxProvisioner | Yes                  | Personal IP          |
| Web-1              | No                   | 10.0.0.4, 10.0.0.6   |
| Web-2              | No                   | 10.0.0.4, 10.0.0.5   |
| ELK-SERVER         | Yes                  | 10.0.0.4, Kibana     |
| redtm_lodblnc      | Yes                  | Personal IP          |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automating configuration is more time efficient and reduces the possibility of errors.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

- Install docker.io, pip3, and docker python module:

	[IMAGE]

     # Use apt module
     - name: Install docker.io
       apt:
         update_cache: yes
         name: docker.io
         state: present


       # Use apt module
     - name: Install pip3
       apt:
         force_apt_get: yes
         name: python3-pip
         state: present


       # Use pip module
     - name: Install Docker python module
       pip:
         name: docker
         state: present

- Increase amount of virtual memory:

	[IMAGE]

       # Use sysctl module
     - name: Use more memory
       sysctl:
         name: vm.max_map_count
         value: "262144"
         state: present
         reload: yes

- Download and launch docker ELK container:

	[IMAGE]

       # Use docker_container module
     - name: download and launch a docker elk container
       docker_container:
         name: elk
         image: sebp/elk:761
         state: started
         restart_policy: always
         published_ports:
           - 5601:5601
           - 9200:9200
           - 5044:5044



The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

	[IMAGE]

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)
Images/sudodocker-ps.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1: 10.0.0.5
Web-2: 10.0.0.6


We have installed the following Beats on these machines:
Filebeat
Metricbeat


These Beats allow us to collect the following information from each machine:
- Filebeat collects system logs which can be used to track unauthorized changes in file system logs.
- Metricbeat collects machine metrics which can be used to track CPU  and memory usage.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the Ansible control node control node and follow the steps below use the playbook(s):
- Copy the  configuration file to ‘webservers’ (Web-1 VM and Web-2 VM) and ‘elk’ (ELK-SERVER VM).
- Update the /etc/ansible/hosts file with the internal IP addresses to configure.
- Run the playbook, and navigate to ‘http://[ELKVMPublicIP]:5601/app/kibana’ to check that the installation worked as expected.


Which file is the playbook? Where do you copy it?
- filebeat-config.yml [LINK FILEBEAT-CONFIG.YML]
- /etc/ansible/files/filebeat-config.yml to /etc/ansible/files/filebeat-config.yml

Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?

- /etc/ansible/hosts # the hosts file
- Specifying the ‘hosts’ at the beginning of the playbook file determines the machines you install the ELK server and/or Fillebeat on (e.g. ‘webservers’ or ‘elk’).

	[IMAGE]


Which URL do you navigate to in order to check that the ELK server is running?
- 'http://[ELK-serverPublicIP]:5601/app/kibana’
- 'http://40.122.232.247:5601/app/kibana'

As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

Steps to set up ELK server:
User needs to set up ELK server to utilize Filebeat and Metricbeat
- Open GitBash/Terminal command line
- ssh username@JumpBoxProvisioner-PrivateIP #ssh to JumpBoxProvisioner
- List docker containers, start/attach ansible container:
  - sudo docker container list -a
  - sudo docker start [name-of-container] #if not already started
  - sudo docker attach [name-of-container]
- Update hosts file adding IPs of machines to be configured
  - cd /etc/ansible
  - sudo nano hosts
    - [elk]
    - 10.1.0.4 ansible_python_interpreter=/usr/bin/python3
    - save and exit hosts file
- Update ansible config file with 'username'
  - cd /etc/ansible 
  - sudo nano ansible.cfg 
    - remote_user = username
    - #save and exit
- Install ELK 
  - ansible-playbook install-elk.yml [LINK TO GITHUB 'INSTALL-ELK.YML'] #create, edit, and run ELK playbook
  - ssh username@ELK-serverPrivateIP

Install Filebeat:
- #User will need to create 'filebeat-config.yml' and 'filebeat-playbook.yml' 
- Open GitBash/Terminal command line
- ssh username@JumpBoxProvisioner-PrivateIP #ssh to JumpBoxProvisioner
- ssh username@ELK-serverPrivateIP
- cd /etc/ansible 
- curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > filebeat-config.yml #download filebeat-config.yml file
- cp filebeat-config.yml /etc/ansible/files #backup filebeat-config.yml file
- cd /etc/filebeat/ 
- sudo nano filebeat-config.yml [LINK FILEBEAT-CONFIG.YML]
- Modify filebeat hosts IPs in config file
  - #PICTURE: change
	output.elasticsearch:
	hosts: ["ELK-serverPrivateIP:9200"]
	username: "elastic"
	password: "changeme"
	...
	setup.kibana:
	host: "ELK-serverPrivateIP:5601"
	#save and exit
- sudo nano filebeat-playbook.yml [LINK FILEBEAT-PLAYBOOK.YML] #create filebeat playbook
- #PICTURE of filebeat-playbook.yml
- ansible-playbook filebeat-playbook.yml #run filebeat playbook


Install Metricbeat:
#User will need to create 'metricbeat-config.yml' and 'metricbeat-playbook.yml'
- Open GitBash/Terminal command line
- ssh username@JumpBoxProvisioner-PrivateIP #ssh to JumpBoxProvisioner
- ssh username@ELK-serverPrivateIP
- cd /etc/ansible
- curl https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > metricbeat-config.yml #download metricbeat-config.yml
- cp metricbeat-config.yml /etc/ansible/files #backup filebeat-config.yml file
- cd /etc/ansible/files
- sudo nano metricbeat-config.yml [LINK METRICBEAT-CONFIG.YML]
- Modify metricbeat hosts IPs in config file
- #PICTURE edit:
	setup.kibana:
  		host: "10.1.0.4:5601"
  	...
  	hosts: ["10.1.0.4:9200"]
	username: "elastic"
	password: "changeme"
	#save and exit
- sudo nano metricbeat-playbook.yml [LINK TO METRICBEAT-PLAYBOOK.YML] #create and edit metricbeat playbook file
- #PICTURE: metricbeat-playbook.yml script
- ansible-playbook metricbeat-playbook.yml # run metricbeat playbook
