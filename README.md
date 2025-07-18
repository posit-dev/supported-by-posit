# Supported By Posit Badge

The "Supported by Posit" badge is a clickable element that can be added to a Quarto website, to indicate that [Posit, PBC](https://posit.co) supports the project.

## Install

The badge is implemented as a single JavaScript file that can easily be added.
To add the badge to a Quarto website, add the following to `_quarto.yml`:

```yaml
format:
  html:
    include-in-header:
      - text: |
          <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js"></script>
```

## Customize

If the default colors do not look right on the particular Quarto website, then the colors of the background, the text, the two signs can be customized, for both light and dark mode.
The dark colors are ignored when the Quarto website only supports light mode.

```yaml
format:
  html:
    include-in-header:
      - text: |
          <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js"
                  data-light-bg="#404041"
                  data-light-text="#ffffff"
                  data-light-lt="#ee6331"
                  data-light-gt="#447099"
                  data-dark-bg="#404041"
                  data-dark-text="ffffff"
                  data-dark-lt="#ee6331"
                  data-dark-gt="#447099"></script>
```

It's best to only include the `data-*` attributes for the colors you wish to override.


## Dry Run

You can test how the badge looks by running the following snippet in the JavaScript Console once:

```javascript
script = document.createElement('script');
script.src = 'https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js';
document.head.appendChild(script);
```

Then, you can repeatedly try out different colors by running the following:

```javascript
addSupportedByPositBadge({
  'lightBg': "#404041",
  'lightText': "#ffffff",
  'lightLt': "#ee6331",
  'lightGt': "#447099",
  'darkBg': "#404041",
  'darkText': "#ffffff",
  'darkLt': "#ee6331",
  'darkGt': "#447099",
});
```

Note that all colors must be passed to the `addSupportedByPositBadge()` function.
Once you're satisfied, you can pass any non-default colors to the `<script>` tag as demonstrated in the previous section.
