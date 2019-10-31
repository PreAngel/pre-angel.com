---
title: The $100B+ Commercial OSS Company Index (COSSI)
author: ossc
categories: news
tags:
  - opensource
image: assets/2018/07-opensource-cossi/opensource.jpg
---

In January 2016, I previously wrote about the paradoxical cognitive dissonance surrounding commercial OSS dynamics, possibilities and questions/opinions thereof. Motivating that post was a lively Twitter exchange of thoughts and ideas between Luke Kanies, the founder of Puppet, and Derek Collison, the founder of Cloud Foundry.

After that Twitter exchange, I was inspired to open source a spreadsheet I had been maintaining — entitled “Commercial Open Source Software Index”. From here on, I’ll just call it “COSSI”, pronounced “cozy”.

This first post is a re-introduction to COSSI, its company selection criteria, how COSSI is maintained, and various COSSI-driven topics we will explore in future posts!

## Reintroducing COSSI

Check out COSSI here: <http://OSS.Cash>

![sheet](/assets/2018/07-opensource-cossi/sheet.png)

COSSI: Commercial Open Source Software Index

COSSI is a public, read-only, comment-friendly, actively maintained Google Sheet that lists the “top quartile” companies building B2B (enterprise-focused) and/or B2C (developer-focused) software businesses relying on OSS.

But what defines a COSS company? This question has been the source of great contention across many discussions.
Here is my definition of what constitutes a COSS company:

> If a given company heavily relies on and/or builds upon/extends an OSS project as the fundamental building block justifying its existence, it is definitionally a COSS company.

## Examples:

- GitHub would not exist without Git. Yes, they may not contribute back to Git as much as some other companies (Google, others) and yes their product may mostly be closed source (open core.. future posts will elaborate on this), but they fundamentally rely on Git — an OSS project.
- Fastly would not exist without Varnish. Sure, they could build their own proprietary version of Varnish, but they are fundamentally reliant on Varnish as the core software ingredient of their product and business.
- Cloudera would not exist without Hadoop.
- Elastic would not exist without ElasticSearch.
- Databricks would not exist without Spark.

## Company Criteria (What it takes to be added)

- Metric: I chose a top-line revenue metric as the main criteria since this is the best way to determine the overall health of a high-growth startup / company.
- Number: $100M, specifically, because this number is usually associated with large M&A events, IPO-readiness, a level of revenue predictability and quality that takes years to develop and business durability.
- Timeframe: A given company must have either A) generated $100M or more in revenue within a full previous calendar year / 12 trailing months or B) be on a $100M run-rate — meaning the (growing) revenue within a single quarter meets or exceeds $25M

## How COSSI is maintained

Once a month, I manually parse through the sheet and edit the values for employee count, total VC raised (but this is more asynchronous.. I usually notice the funding events) and revenue / valuation data go hand-in-and — I’ll share some heuristics on how I compute these numbers in the future.

Here is some commentary on the data tracked in COSSI:

- Company Name (pretty important detail)
- Year Founded (looking at this for all the companies offers some rough insight into how long — on average — it takes to reach a baseline level of maturity)
- Total amount of VC money raised (exactly how capital-intensive is it to build a “successful” COSS company?)
- Total # of Employees (how many people does it take to reach $100M+ in commercial OSS revenue?)
- Estimated Revenue (emphasis on estimated, but more on this soon)
- Estimated Valuation (even more of a grey area and valuations are meaningless until exits happen, but this is fun to compute, even heuristically)
- Public or Private (is the company stock liquid on a public exchange or is it private?)
- Exit Outcome Size (how much the company exited at, if they did?)
- Exit Date (when did they exit, if they did?)
- Technology Area (what layer in the evolving tech stack does this company predominantly serve?)
- Monetization / Business Model (how does the company make money?)
- Core Project (name and link to the core OSS project in question?)
- OSS License (what is the OSS license of the core OSS project the company relies on? if many projects, what is the primary/dominant license?)
- Foundation-Based (is the core project in a foundation or not?)

## Data sources:

- LinkedIn for employee count (very accurate)
- Talking with VCs and founders for revenue and valuation #s (when I can’t/don’t engage these sources, I have a heuristic that is quite accurate)
- Crunchbase for funding (which is usually conservative since CB omits seed/A/B extensions and other notes that are unreported)

## Topics for future posts

OK! You’ve been reintroduced to COSSI. What can we dig into in the future?

Here are some topics I’ll cover in future bite-size weekly posts (no particular order):

- OSS Business Models, Progressions, Trends, Motivators and Implementations
- Open Core: Spectrum of Implementations and Application Tradeoffs
- OSS License Models, Trends, Drivers and Applications
- Major Legacy Enterprise Software Markets Getting Eaten by OSS
- “Qual-tify” commercial OSS variables — qualitative and quantitative variables that can be identified and measured to best understand the optimal levers for commercial OSS success
- COSS company IPO-Readiness
- How to determine if a given OSS project can be commercialized “at scale”?
- OSS and indemnification — the insurance policy driver
- OSS Foundations — good or bad for commercialization?
- What is the difference between an OSS project and an OSS product?
- What macro conclusions about software markets can be drawn/made from COSSI?
- Commercial OSS Lingo/Terminology and Disambiguation
- Commercial OSS Cannibalization — Is the OSS project friend or foe?
- The Value of OSS Ecosystems for Commercialization
- Creating and Capturing Value: The Fundamental OSS Paradox!
- Enumerating Implications: In a world of OSS eating enterprise software, what changes? Almost everything!
- Single and Multi-Vendor OSS
- OSS and Venture Capital: Implications and Opportunities
- Commercial OSS and Decentralized Networks for Coordinating Resources and Value (aka Blockchains)
- Commercial OSS and the Question of Sustainability
- Highest growth COSSI companies and what sets them apart
- + many many more!

> Source: [Medium](https://medium.com/open-consensus/1-the-100b-commercial-oss-company-index-cossci-f808ae3a16ab)
