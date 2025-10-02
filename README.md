# Supported By Posit Badge

The "Supported by Posit" badge is a clickable element that can be added to Quarto and pkgdown websites to indicate that Posit, PBC supports the project.
It appears on the far right of the top navigation bar or at the bottom of the hamburger menu.
It links to [Posit's main website](https://posit.co).

## Installation

The badge is implemented as a single JavaScript file that can be easily added to any Quarto or pkgdown website. To add the badge, include the following in your `_quarto.yml` or `_pkgdown.yml` file:

::: {.panel-tabset group="language"}

## _quarto.yml

```yaml
format:
  html:
    include-in-header:
      - text: |
          <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js"></script>
```

## _pkgdown.yml

```yaml
template:
  includes:
    in_header: |
      <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js"></script>
```
:::


## Customization

If the default colors don't match your website's design, you can customize the badge colors for both light and dark modes. The badge supports customization of the background color, text color, and the colors of the less-than and greater-than symbols (`<` and `>`).

**Note:** Dark mode colors are ignored if your website only supports light mode.

::: {.panel-tabset group="language"}

## _quarto.yml

```yaml
format:
  html:
    include-in-header:
      - text: |
          <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js"
                  data-light-bg="#ffffff"
                  data-light-fg="#404041"
                  data-dark-bg="#404041"
                  data-dark-fg="#ffffff"></script>
```

## _pkgdown.yml

```yaml
template:
  includes:
    in_header: |
      <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js"
              data-light-bg="#ffffff"
              data-light-fg="#404041"
              data-dark-bg="#404041"
              data-dark-fg="#ffffff"></script>
```
:::

**Best Practice:** Only include the `data-*` attributes for colors you want to override from the defaults.

To comply with Posit's brand guide, please choose from the following colors:

* Background color (`data-*-bg`): Any color that provides adequate contrast with the text and the logo
* Foreground color (`data-*-fg`): Either `#404041` or `#ffffff`

For questions, message the `#supported-by-posit` channel on Slack.


## Testing

You can test how the badge will look on your website before making permanent changes by using your browser's JavaScript Console.

### Step 1: Load the Badge Script

Run this snippet once to load the badge:

```javascript
script = document.createElement('script');
script.src = 'https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js';
document.head.appendChild(script);
```

### Step 2: Test Different Colors

After loading the script, you can experiment with different color combinations by running:

```javascript
addSupportedByPositBadge({
  'lightBg': '#ffffff',
  'lightFg': '#404041',
  'darkBg': '#404041',
  'darkFg': '#ffffff'
});
```

**Important:** All color parameters must be provided when calling the `addSupportedByPositBadge()` function. Once you're satisfied with the colors, add only the non-default ones to your `<script>` tag using the `data-*` attributes shown in the customization section.


## Deploying

When the script itself is updated on GitHub, purge the CDN cache to ensure users receive the latest version.
To purge the script, visit: [purge.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js](https://purge.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js).
