---
title: Malice Documentation
type: index
weight: 0
---


![Malice Logo](/images/malice.png)

Malice's mission is to be a free open source version of VirusTotal that anyone can use at any scale from an independent researcher to a fortune 500 company.

## Quick start

Install with `brew`:

```sh
$ brew install maliceio/tap/malice
```

```
Usage: malice [OPTIONS] COMMAND [arg...]

Open Source Malware Analysis Framework

Version: 0.3.8-beta

Author:
  blacktop - <https://github.com/blacktop>

Options:
  --debug, -D  	Enable debug mode [$MALICE_DEBUG]
  --help, -h   	show help
  --version, -v	print the version

Commands:
  scan		Scan a file
  watch		Watch a folder
  lookup	Look up a file hash
  elk		Start an ELK docker container
  plugin	List, Install or Remove Plugins
  help		Shows a list of commands or help for one command

Run 'malice COMMAND --help' for more information on a command.
```

## Features

- Single [binary]({{< relref "getting-started/index.md#changing-the-color-palette" >}}).

- [API]({{< relref "api/index.md" >}}) first design.

- Plugins run in [docker]({{< relref "plugins/index.md#docker" >}}).

- Many [database]({{< relref "configuration/index.md#database" >}}) backends to choose from.

- Built with **cloud** in mind from day one.

See the [getting started guide]({{< relref "getting-started/index.md" >}}) for instructions how to get
it up and running.
