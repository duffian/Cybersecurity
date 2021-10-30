# Cybersecurity
# README.md
- "Ansible" directory contains several Ansible, Filebeat, and Metricbeat playbooks and config files.
- "Diagrams" directory contains networking topologies.
- "Images" directory contains images of activity and project work.
- "Linux" directory contains helpful scripts for Linux cybersecurity. 
___


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![ID_CloudNetworkTopology](https://user-images.githubusercontent.com/86072553/139511611-47b2a7e1-29b8-443d-93d7-4414ed31ea9e.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.


[Ansible Playbook](Ansible/ansible-playbook.yml)

[Install ELK](Ansible/install-elk.yml)

[Filebeat Playbook](Ansible/filebeat-playbook.yml)

[Metricbeat Playbook](Ansible/metricbeat-playbook.yml)

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

- Install docker.io, pip3, and docker python module:

![image](https://user-images.githubusercontent.com/86072553/139513470-8488f6da-da19-4644-b8b2-23348e8fe7cb.png)

- Increase amount of virtual memory:

![image](https://user-images.githubusercontent.com/86072553/139513481-c8ec2404-1d4b-4775-8a9a-72527b4d0678.png)

- Download and launch docker ELK container:

![image](https://user-images.githubusercontent.com/86072553/139513509-6f25f5b1-27ba-44b4-8b7a-bb68715fa8a6.png)

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![image](https://user-images.githubusercontent.com/86072553/139513553-874421b9-d1bb-4079-9e57-3d4441d01ee9.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

**Web-1: 10.0.0.5**

**Web-2: 10.0.0.6**


We have installed the following Beats on these machines:

**Filebeat**

**Metricbeat**


These Beats allow us to collect the following information from each machine:
- Filebeat collects system logs which can be used to track unauthorized changes in file system logs.
- Metricbeat collects machine metrics which can be used to track CPU  and memory usage.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the Ansible control node control node and follow the steps below use the playbook(s):
- Copy the  configuration file to ‘webservers’ (Web-1 VM and Web-2 VM) and ‘elk’ (ELK-SERVER VM).
- Update the `/etc/ansible/hosts` file with the internal IP addresses to configure.
- Run the playbook and navigate to `http://[ELKVMPublicIP]:5601/app/kibana` to check that the installation worked as expected.


Which file is the playbook? Where do you copy it?
- The file is [filebeat-config.yml](Ansible/filebeat-config.yml)
- To make a backup copy, copy it from `/etc/ansible/filebeat-config.yml` to `/etc/ansible/files/filebeat-config.yml`

Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?

- Updating the hosts file in `/etc/ansible/hosts` allows Ansible to run on a specific machine.
- Specifying the host group at the beginning of the playbook file determines the machines you install the ELK server and/or Fillebeat on (e.g. ‘webservers’ or ‘elk’).

![image](https://user-images.githubusercontent.com/86072553/139514009-c521c20f-0db1-422b-bd4d-edcda3f1042b.png)

Which URL do you navigate to in order to check that the ELK server is running?
- `http://[ELK-serverPublicIP]:5601/app/kibana`
- `http://40.122.232.247:5601/app/kibana`

As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

**__Steps to set up ELK server:__**

- User needs to set up ELK server to utilize Filebeat and Metricbeat
- Open GitBash/Terminal command line
- `ssh username@JumpBoxProvisioner-PrivateIP` #ssh to JumpBoxProvisioner
- List docker containers, start/attach ansible container:
  - `sudo docker container list -a`
  - `sudo docker start [name-of-container]` #if not already started
  - `sudo docker attach [name-of-container]`
- Update hosts file adding IPs of machines to be configured
  - `cd /etc/ansible`
  - `sudo nano hosts`
    - `[elk]`
    - `10.1.0.4 ansible_python_interpreter=/usr/bin/python3`
    - `save and exit hosts file`
- Update ansible config file with 'username'
  - `cd /etc/ansible` 
  - `sudo nano ansible.cfg` 
    - `remote_user = username`
    - #save and exit
- Install ELK 
  - `ansible-playbook install-elk.yml` [install-elk.yml](Ansible/install-elk.yml) #create, edit, and run ELK playbook
  - `ssh username@ELK-serverPrivateIP`

**__Install Filebeat:__**

- User will need to create `filebeat-config.yml` and `filebeat-playbook.yml` 
- Open GitBash/Terminal command line
- `ssh username@JumpBoxProvisioner-PrivateIP` #ssh to JumpBoxProvisioner
- `ssh username@ELK-serverPrivateIP`
- `cd /etc/ansible` 
- `curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > filebeat-config.yml` #download filebeat-config.yml file
- `cp filebeat-config.yml /etc/ansible/files` #backup filebeat-config.yml file
- `cd /etc/filebeat/` 
- `sudo nano filebeat-config.yml` [filebeat-config.yml](Ansible/filebeat-config.yml)
- Modify filebeat host IPs in config file.
  
![image](https://user-images.githubusercontent.com/86072553/139514339-bf4d2a3f-b89b-4280-beaf-7ce98dfda22c.png)

![image](https://user-images.githubusercontent.com/86072553/139514356-19324d16-c680-41ee-bebe-8305e8c4a5d2.png)
- `output.elasticsearch:`
	`hosts: ["ELK-serverPrivateIP:9200"]`
	`username: "elastic"`
	`password: "changeme"`
	...
	`setup.kibana:`
	`host: "ELK-serverPrivateIP:5601"`
	#save and exit
	
- `sudo nano filebeat-playbook.yml` [filebeat-playbook.yml](Ansible/filebeat-playbook.yml) #create filebeat playbook

![image](https://user-images.githubusercontent.com/86072553/139514426-ff5b7feb-f8a9-4ca5-bf8a-a84538945c66.png)

- `ansible-playbook filebeat-playbook.yml` #run filebeat playbook

**__Install Metricbeat:__**

- User will need to create 'metricbeat-config.yml' and 'metricbeat-playbook.yml'
- Open GitBash/Terminal command line
- `ssh username@JumpBoxProvisioner-PrivateIP` #ssh to JumpBoxProvisioner
- `ssh username@ELK-serverPrivateIP`
- `cd /etc/ansible`
- `curl https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > metricbeat-config.yml` #download metricbeat-config.yml
- `cp metricbeat-config.yml /etc/ansible/files` #backup filebeat-config.yml file
- `cd /etc/ansible/files`
- `sudo nano metricbeat-config.yml` [metricbeat-config.yml](Ansible/metricbeat-config.yml)
- Modify metricbeat hosts IPs in config file

![image](https://user-images.githubusercontent.com/86072553/139514562-cb2b4d1d-039b-4969-987f-9b1996b0c7fa.png)

![image](https://user-images.githubusercontent.com/86072553/139514575-a4e25471-e256-4b39-b8e1-dd4eab493ad5.png)

- `setup.kibana:`
- `host: "10.1.0.4:5601"`
- ...
  -  `hosts: ["10.1.0.4:9200"]`
  - `username: "elastic"`
  - `password: "changeme"`
- #save and exit
`- sudo nano metricbeat-playbook.yml` [metricbeat-playbook.yml](Ansible/metricbeat-playbook.yml) #create and edit metricbeat playbook file

![image](https://user-images.githubusercontent.com/86072553/139514707-2a9e9aaa-4e77-4710-ab80-7dcdde36b19d.png)

- `ansible-playbook metricbeat-playbook.yml` # run metricbeat playbook


___
__Additional Files Submitted as Part of Cloud Networking Project I__
[Cloud Networking Essay - Containers](ID_Container-Essay_SubmissionFile.md)

[Kibana Investigation Findings - SubmissionFile](ID_Kibana-Investigation_SubmissionFile.md)

___

