---
title: "Untrusted types: A researcher demonstrates a method for circumventing Google Chrome's Trusted Types protection. "
layout: post
date: 2022-06-28 22:00
image: /assets/images/
headerImage: true
tag:
- Cross-Site Scripting
- Trusted Types
- Hackers
- Google Chrome
category: Tech
author: RootHaktivity
description: Tech News, Hacker New
---



In some scenarios, security researchers discovered multiple unprotected properties that could be used to circumvent Trusted Types, a widely used web security mechanism.


Trusted Types is an important technology that allows websites to define strict rules for dealing with various DOM (Document Object Model) properties, which is a useful technique for preventing DOM-based cross-site scripting (XSS) attacks.


Masato Kinugawa discovered a bypass that uses attribute properties to circumvent the protection that Trusted Types would normally provide.


Kinugawa discovered that if a site used these properties and was vulnerable to DOM XSS, Trusted Types would not protect it.
If a site changed an existing attribute value using nodeValue/textContent, as explained in a post on a Chrome security mailing list, Trusted Types would completely disregard the assignment.


The flaw was discovered in Chrome v100.0.4892.0 (Official Build) canary (64-bit).
Other Chrome and browser versions may be vulnerable, but this has not been tested.


Chrome's most recent releases address the issue.


The vulnerability, identified as CVE-2022-1494 and involving "insufficient data validation in Trusted Types," was first reported on February 16, but details were only made public last week.


The Daily Swig sought comment from Kinugawa and Krzysztof Kotowicz, the Google software engineer who created Trusted Types.
There has been no response as of yet, but we will update this story as more information becomes available.
