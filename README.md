# Port-Scanner-Bash-
A port scanner is a crucial cybersecurity tool that identifies open ports and services on a networked device. It sends requests to specific ports to assess security and discover vulnerabilities. Common scanning methods include TCP SYN scans, which determine the status of ports (open, closed, or filtered).

# Port Scanner Bash

This is a simple and effective port scanner written in Bash. It helps to identify open ports and services running on a networked device.

## Prerequisites

Make sure you have `nmap` installed on your system, as this script relies on it for scanning.

## Installation

You can easily clone this repository using the following command:

```bash
git clone https://github.com/xrl3y/Port-Scanner-Bash.git
```
Usage
Navigate to the directory:

```bash
cd Port-Scanner-Bash
```

Give execution permissions to the script:

```bash
chmod +x port_scanner.sh
```

Run the script:

```bash
./port_scanner.sh <IP_or_hostname> [options]
```
Replace <IP_or_hostname> with the target IP address or hostname. You can also include options to customize your scan (e.g., specify ports, scan type, etc.).

Options
```bash
-h, --help: Show help message.
-p, --ports: Specify ports to scan (e.g., 1-1000).
-s, --scan-type: Define the type of scan (e.g., -sS for SYN scan).
-o, --output: Save results to a file.
-A, --aggressive: Perform an aggressive scan (detect versions and OS).
-v, --verbose: Show detailed information during the scan.
-iL, --input-list: Read IP addresses from a file.
```
Example
To scan the first 1000 ports on a target IP with an aggressive scan, use:

```bash
./port_scanner.sh 192.168.1.1 -p 1-1000 -A
```

Disclaimer
This tool is intended for educational purposes only. Always obtain permission before scanning networks or systems that are not your own.
