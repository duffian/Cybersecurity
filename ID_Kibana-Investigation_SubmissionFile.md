Activity File: Exploring Kibana
•	You are a DevOps professional and have set up monitoring for one of your web servers. You are collecting all sorts of web log data and it is your job to review the data regularly to make sure everything is running smoothly.
•	Today, you notice something strange in the logs and you want to take a closer look.
•	Your task: Explore the web server logs to see if there's anything unusual. Specifically, you will:
⚠ Heads Up: These sample logs are specific to the time you view them. As such, your answers will be different from the answers provided in the solution file.
________________________________________
Instructions
1.	Add the sample web log data to Kibana.
2.	Answer the following questions:
- In the last 7 days, how many unique visitors were located in India?
•	250
- In the last 24 hours, of the visitors from China, how many were using Mac OSX?
•	9
- In the last 2 days, what percentage of visitors received 404 errors? How about 503 errors?
•	33.333%
•	0%
- In the last 7 days, what country produced the majority of the traffic on the website?
•	Bangladesh
- Of the traffic that's coming from that country, what time of day had the highest amount of activity?
•	12pm EST (noon)
- List all the types of downloaded files that have been identified for the last 7 days, along with a short description of each file type (use Google if you aren't sure about a particular file type).
•	‘css’ – cascading style sheet used for formatting contents of webpage
•	‘deb’ – Debian file used mainly in Unix-based OS
•	‘gz’ – gun zip files used for zipped files
•	‘rpm’ – installation package originally for Red Hat Linux OS now common among other Linux distros
•	‘zip’ – archives that store zipped/compressed files
3.	Now that you have a feel for the data, Let's dive a bit deeper. Look at the chart that shows Unique Visitors Vs. Average Bytes.
- Locate the time frame in the last 7 days with the most amount of bytes (activity).
•	2021-10-28 15:00
- In your own words, is there anything that seems potentially strange about this activity?
•	Average bytes and unique visitors seem directly opposite – average bytes are low while unique visitors are high
4.	Filter the data by this event.
- What is the timestamp for this event?
•	2021-10-28 15:00
- What kind of file was downloaded?
•	‘gz’
- From what country did this activity originate?
•	China
- What HTTP response codes were encountered by this visitor?
•	HTTP 200 OK – request has succeeded
5.	Switch to the Kibana Discover page to see more details about this activity.
- What is the source IP address of this activity?
•	1.145.31.121
- What are the geo coordinates of this activity?
•	"lat": 28.28980556, "lon": -81.43708333
- What OS was the source machine running?
•	Win 8
- What is the full URL that was accessed?
•	https://artifacts.elastic.co/downloads/kibana/kibana-6.3.2-linux-x86_64.tar.gz
- From what website did the visitor's traffic originate?
•	http://www.elastic-elastic-elastic.com/success/aleksandr-serebrov
6.	Finish your investigation with a short overview of your insights.
- What do you think the user was doing?
•	Downloading Kibana on their Linux machine.
- Was the file they downloaded malicious? If not, what is the file used for?
•	Not in any obvious way – installing Kibana
- Is there anything that seems suspicious about this activity?
•	Geo coordinates don’t match – geo source – China, geo destination – Nigeria, and geo coordinates are in Florida 
- Is any of the traffic you inspected potentially outside of compliance guidelines?
•	Not if they are using a VPN
•	Possibly if there is malicious activity being routed through multiple destinations to make attribution difficult or to disguise malicious activity in normal traffic.
