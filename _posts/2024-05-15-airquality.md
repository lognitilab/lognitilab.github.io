---
layout: post
title: Monitoring Daily Air Quality
date: 2024-05-15 13:28:00
description: Monitor daily air quality updates to index, level, and prominent pollutant across different cities in India.
tags: miscellaneous
author: Anmol Pahwa
---

Air Quality is a crucial tool to communicate the quality of air in a given area, indicating the level of pollution and its potential impact on public health. It is calculated based on the concentrations of eight prominent pollutants, namely, Particulate Matter (PM~10~ and PM~2.5~), Nitrogen Dioxide (NO~2~), Sulfur Dioxide (SO~2~), Carbon Monoxide (CO), Ozone (O~3~), Ammonia (NH~3~), and Lead (Pb). The estimation procedure involves continuous monitoring of these pollutants using a network of air quality monitoring stations across the country. Each pollutant's concentration is measured and then converted into a normalized index value using standard formulas and breakpoint tables provided by the Central Pollution Control Board (CPCB). The highest index value among the pollutants determines the overall AQI for that location. This value is then categorized into six levels—ranging from 'Good' to 'Severe'—to convey the health implications effectively to the public, aiding in the adoption of necessary precautio nary measures and policy decisions aimed at improving air quality.

<div class="l-page">
  <iframe src="{{ '/assets/plotly/index.html' | relative_url }}" frameborder='0' scrolling='no' height="455" width="800"></iframe>
</div>

<div class="l-page">
  <iframe src="{{ '/assets/plotly/level.html' | relative_url }}" frameborder='0' scrolling='no' height="605" width="450"></iframe>
</div>

<div class="l-page">
  <iframe src="{{ '/assets/plotly/index.html' | relative_url }}" frameborder='0' scrolling='no' height="455" width="800"></iframe>
</div>
