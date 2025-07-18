# Supported By Posit Badge

The "Supported by Posit" badge is a clickable element that can be added to Quarto websites to indicate that [Posit, PBC](https://posit.co) supports the project.

## Installation

The badge is implemented as a single JavaScript file that can be easily added to any Quarto website. To add the badge, include the following in your `_quarto.yml` file:

```yaml
format:
  html:
    include-in-header:
      - text: |
          <script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js"></script>
```

## Customization

If the default colors don't match your website's design, you can customize the badge colors for both light and dark modes. The badge supports customization of the background color, text color, and the colors of the less-than and greater-than symbols (`<` and `>`).

**Note:** Dark mode colors are ignored if your Quarto website only supports light mode.

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
                  data-dark-text="#ffffff"
                  data-dark-lt="#ee6331"
                  data-dark-gt="#447099"></script>
```

**Best Practice:** Only include the `data-*` attributes for colors you want to override from the defaults.

To comply with Posit's brand guide, please choose from the following colors:

* Background color (`data-*-bg`): Any color that provides adequate contrast with the text and the logo
* Text color (`data-*-text`): Either `#404041` or `#ffffff`
* Less-than symbol (`data-*-lt`): Either `#ee6331` or `#ffffff`
* Greater-than symbol (`data-*-gt`): Either `#447099` or `#ffffff`

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

**Important:** All color parameters must be provided when calling the `addSupportedByPositBadge()` function. Once you're satisfied with the colors, add only the non-default ones to your `<script>` tag using the `data-*` attributes shown in the customization section.
