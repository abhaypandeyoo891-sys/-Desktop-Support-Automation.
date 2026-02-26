# -Desktop-Support-Automation.
# PC Health Check Script" "A PowerShell script to monitor Disk Space, RAM, and Service status for Desktop Support."
# 🛠️ Desktop Automation: PC Health Check Script

## 📌 Project Overview
As a Desktop Support Engineer, manual system checks are time-consuming. I developed this *PowerShell script* to automate the process of auditing local workstation health. It provides an instant snapshot of critical system metrics, helping technicians diagnose performance issues faster.

## 🚀 Key Features
* *Disk Space Audit:* Checks the C: drive and calculates free space in GB.
* *Memory Usage:* Monitors available physical RAM vs. total capacity.
* *Service Monitoring:* Automatically checks the status of the *Print Spooler* service (a common point of failure).
* *Visual Feedback:* Uses color-coded console output (Green for OK, Red for Attention) for quick identification of issues.

## 💻 Technical Skills Demonstrated
* *Language:* PowerShell
* *Frameworks:* Windows Management Instrumentation (WMI)
* *Logic:* Conditional statements (If/Else) and Mathematical rounding for data clarity.
* *Administration:* System-level information gathering via administrative permissions.

## 📖 How to Use
1. Download the PC_Health_Check.ps1 file.
2. Right-click the file and select *"Run with PowerShell"* (or run via PowerShell ISE as Administrator).
3. View the generated report in the console window.

## 🛠️ Future Improvements
* [ ] Add an export feature to save reports as a .csv or .html file.
* [ ] Integrate email alerts when disk space falls below 10%.
* [ ] Add CPU Temperature monitoring.

---
*Author:* [abhay pandey]  
*Role:* Desktop Support Engineer 
