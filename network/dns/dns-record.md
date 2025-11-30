# DNS Record

Common record types

- `A`: Address Record
- `MX`: Mail Exchange
- `TXT`: TXT Record
- `CNAME`: Canonical Name Record

## Commands

nslookup

```sh
nslookup example.com
```

host

```sh
host example.com
```

```sh
host -t A example.com
```

dig

```sh
dig example.com
```

```sh
dig A example.com
```

```sh
dig +short example.com
```
