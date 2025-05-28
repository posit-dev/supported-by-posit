# Supported By Posit Ribbon

To add the "Supported By Posit" ribbon to a Quarto website, add the following to `_quarto.yml`:

```yaml
format:
  html:
    include-in-header:
      - text: |
          <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/ribbon.min.js"></script>
```
