# Quotation

## Use of Single Quotation(') vs Double Quotation(")

Single Quoted(') string refers to the exact quotation value. Such as

```sh
name='your-name'
echo 'Hello, ${name}'

> Hello, ${name}
```

Double quoted(") string replace the variable with the value before executing the command. Such as

```sh
name='your-name'
echo "Hello, ${name}"

> Hello, your-name
```
