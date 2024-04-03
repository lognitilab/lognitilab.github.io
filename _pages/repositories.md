---
layout: page
permalink: /repositories/
title: Repositories
description: List of GitHub repositories.
nav: true
nav_order: 5
---

---

#### Data

{% if site.data.repositories.github_data %}

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_data %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

---

#### Tools

{% if site.data.repositories.github_tools %}

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_tools %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

---

#### Projects

{% if site.data.repositories.github_projects %}

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_projects %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}
