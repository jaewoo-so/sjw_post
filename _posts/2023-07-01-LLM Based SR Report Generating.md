---
layout: post
title:  "LLM Based SR Report Generating"
date:   2023-03-01
tags: [time2]
---

# Introduction
---
Recently, the majority of companies have been publishing Sustainability Reports (SR). However, due to a lack of ESG (Environmental, Social, and Governance) expertise, many companies outsource the report writing to ESG consulting firms. From the perspective of these consulting firms, they often lack knowledge of the specialized areas of the commissioning companies.

For this project, we conducted a survey among employees experienced in writing SR reports to identify the stages that require the most time and effort. The interviews consistently revealed the two major challenges:

Extracting keywords through company research and using them to craft appropriate sentences.
Studying the commissioning company's expertise to create relevant content.
Among these, drafting content based on extracted keywords was the most time-consuming and challenging aspect. Hence, this project aims to address these issues to improve work efficiency.
<br>

# Objective
---
Considering the automation potential and work processes involved in report production, our project has the following three objectives:

Report Writing Style Automation
Sentence Generation based on Keywords
Image Generation related to Keywords
These objectives were determined through surveys and interviews.
<br>

# Survey Results
---
The difficulty and specialization of an SR report can vary, but considering the criterion of one section and one image, it can be observed that a significant proportion of time is invested in the overall report writing process.
</p>
<p align="center">
    <img width="800" src="/assets/2023/llm/survey1.png">
</p>

<p align="center">
    <img width="800" src="/assets/2023/llm/survey1.png">
</p>
<br>

# Methodology
---
In the initial design phase, if a discrepancy of more than 1% occurs in the outputs, prompt designs are modified for effectiveness.
However, if discrepancies are below 1%, unintended outputs are adjusted for consistency through post-processing at the code level.
Fine-tuning for each sentence generation topic (e.g., precise and factual sentences for specialized terms rather than creative sentences).
Achievements
Approximately 80% reduction in time taken for sentence and image composition.
Average report writing time reduced from approximately 70 hours to less than 40 hours.
<br>

# Demo Link
---
<a href="http://report.jaewoo-so.online/" style="color: blue; text-decoration: underline;">Demo Link</a>

[Demo Result Report Link]({{ site.baseurl }}/assets/2023/llm/sr_report_demo.pdf) 

For the demo, we have utilized the SR report of Lego Chem Bio, adapted in a report writing style.
The demo includes image generation in four different styles.
<br>