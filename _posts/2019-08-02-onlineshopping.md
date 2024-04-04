---
layout: post
title: Is online shopping environment friendly?
date: 2019-08-02 16:03:00
description: Should I visit a store or should I just check out Amazon? You might have asked yourself this question quite a few times by now. But have you ever considered the impacts of this decision on the environment Well, this article should help you make an informed decision next time.
tags:
categories: moving-goods
chart:
  echarts: true
---

**Should I visit a store or should I just check out Amazon? You might have asked yourself this question quite a few times by now. But have you ever considered the impacts of this decision on the environment? Well, this article should help you make an informed decision next time.**

August 11, 1994 marks the day when the first ever online transaction was made, and since then, the internet has continuously reshaped the way we shop. E-commerce, a term completely unknown to us a couple of decades ago, has gradually become a fundamental part of our daily lives.

With the increasing influence of internet on our decisions as to what and when to shop, how and how much to shop, the underlying question posed onto us is whether online shopping is good for us? i.e. whether online shopping is substituting (replacing) or complementing (co-existing with) in-store shopping? The literature on this largely weighs towards the complementary behavior, thus arguing for an increased travel activity, one from the delivery vans serving the online retail demand, and the other from the personal trips to stores. Yet another aspect of online shopping is the induced demand – an increase in number of purchases made by a consumer, be it online or in-store. Remember this, because it will come to bite us later.

To answer the question posed above, I modeled the shopping choice – whether to shop online, to shop in-store, or to not shop at all, with socioeconomic parameters of the individual (such as age, income, education level etc.), city related parameters and some other temporal parameters. The resulting model tells us which factors influence one’s choice to shop online or in-store, or not shop at all. This dis-aggregate model was then applied over the synthetically generated population of the city of San Francisco (SF) to determine people who shop in-store and/or online. The resulting externalities, i.e. traffic in terms of vehicle miles traveled (VMT), and pollution in terms of greenhouse gas emissions (CO and CO2), as well as criteria pollutant emissions (NOx and PM) were estimated from the shopping related travel.

First, I present here one-to-one direct comparison of externalities from in-store and online shopping in terms of equivalence of one with the other, i.e. how many online purchases produce the same amount of externalities as the in-store purchase. Turns out, around 8 online purchases produce as much vehicle travel as 1 in-store purchase, thus reducing the traffic. Consequently, if everyone was to only shop online, significant reduction in emissions can be produced, barring NOx emissions. Note, delivery trucks are heavy emitters of criteria pollutant emissions, especially NOx emissions.

```echarts
{
  "title": {
    "text": "Comparison of in-store and online shopping"
  },
  "responsive": true,
  "tooltip": {},
  "xAxis": {
    "data": ["VMT", "CO", "CO2", "PM", "NOx"]
  },
  "yAxis": {},
  "series": [
    {
      "name": "ratio of in-store to online",
      "type": "bar",
      "data": [8.1, 7.8, 2.7, 1.8, 0.8]
    }
  ]
}
```

<br/>
Having established a direct one-to-one comparison, I then estimated the impact of online shopping accounting for the consumer behavior through the shopping choice model. Note, the current omni-channel retail scenario implies that some people shop in-store while others shop online. The results showcase a 7% reduction in overall VMT due to online purchases. Consequently, the urban environment witnesses a significant reduction in emissions, barring of course the NOx emissions.

```echarts
{
  "title": {
    "text": "Impact of online shopping"
  },
  "responsive": true,
  "tooltip": {},
  "xAxis": {
    "data": ["VMT", "CO", "CO2", "PM", "NOx"]
  },
  "yAxis": {},
  "series": [
    {
      "name": "percentage change",
      "type": "bar",
      "data": [7.0, 7.0, 4.9, 3.4, -1.8]
    }
  ]
}
```

<br/>
These results therefore pose the question, why push for cleaner freight movement? Well, because these results are founded on current consumer behavior and retailer practices. It is important to consider the potential impact on consumer behavior as e-commerce can induce demand and conseuqently vehicle travel. Further, consumer-focused retail practices with lucrative offers such as expedited shipping and free returns render frequent less-than-truckloads goods flow. Hence, while e-commerce has the potential to offer environmentally efficient means of goods distribution, changing consumer behavior and retailer practices puts sustianability of urban goods flow at risk.

To conclude, what can you do the next time you have to shop? The direct comparison of in-store and online shopping showcase benefits of online shopping. Hence, you could try to replace your trips to store with online shopping. Further, you could try to consolidate your needs into a single purchase, enabling the e-retailer to make fewer vehicle trips to your house. With this I hope you can make an informed decision the next time you shop.
