---
title: "Configuration"
date: 2017-07-01T21:40:14-06:00
weight: 40
---

## Database

```toml
[database]
  name = "malice-elastic"
  image = "blacktop/elasticsearch:5.4"
  server = "localhost"
  ports = [9200]
  timeout = 20
  enabled = true
```
