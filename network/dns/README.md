# DNS

Common record types

- `A`: Address Record
- `MX`: Mail Exchange
- `TXT`: TXT Record
- `CNAME`: Canonical Name Record

## Commands

nslookup

```bash
nslookup example.com
```

host

```bash
host example.com
```

```bash
host -t A example.com
```

dig

```bash
dig example.com
```

```bash
dig A example.com
```

```bash
dig +short example.com
```
