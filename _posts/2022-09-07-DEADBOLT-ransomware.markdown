---
title: "DeadBolt Ransomware Zero-Day Exploit Attacks QNAP"
layout: post
date: 2022-09-07 22:00
image: /assets/images/zero-day-exploit-banner.png
headerImage: true
tag:
- zero-day
- ransomware
- QNAP
category: Tech
author: RootHaktivity
description: Tech News, Hacker New
---


#### About the attack

The operators take advantage of the zero-day vulnerability, which allows them to encrypt the content of infected systems.

After encrypting the device, the ransomware appends an extension to the names of the extracted files and searches the QNAP NAS login page for a warning message.


A ransom note appears on the hijacked QNAP login screen, demanding a payment of approximately $1,277 in order to receive a decryption key to recover the files.

The ransom note also includes a link to a page that sells technical details about the alleged zero-day vulnerability in QNAP NAS devices for around $212,000.

Furthermore, the operators are selling the QNAP master decryption key for 50 BTC, which could allow all victims of this ransomware family to decrypt their files.

#### QNAP releases security updates

Twelve hours after DeadBolt began using the zero-day vulnerability in attacks, QNAP released Photo Station security updates.

QTS 5.0.1 needs Photo Station 6.1.2 or later, QTS 5.0.0/4.5.x needs Photo Station 6.0.22 or later, QTS 4.3.6 needs Photo Station 5.7.18 or later, QTS 4.3.3 needs Photo Station 5.4.15 or later, and QTS 4.2.6 needs Photo Station 5.2.14 or later.

#### Past attacks

Since January, the DeadBolt ransomware gang has been targeting NAS devices by exploiting zero-day vulnerabilities on internet-connected NAS devices.
In May and June, threat actors conducted extensive attacks on QNAP devices.


What should I do?

The company strongly advises users to place their QNAP NAS behind a firewall rather than directly expose it to the internet.
Users are also advised to enable the VPN service or use QNAP's myQNAPcloud Link feature to effectively fortify the devices and reduce the likelihood of being attacked.
