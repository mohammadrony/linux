# Use of Single Quotation(') vs Double Quotation(")

Single Quoted(') string refers to the exact quotation value. Such as

```bash
name='your-name'
echo 'Hello, ${name}'

> Hello, ${name}
```

Double quoted(") string replace the variable with the value before executing the command. Such as

```bash
name='your-name'
echo "Hello, ${name}"

> Hello, your-name
```
