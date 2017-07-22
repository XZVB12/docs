---
title: "Configuration"
weight: 50
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
