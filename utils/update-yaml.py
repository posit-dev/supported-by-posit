#!/usr/bin/env -S uv run
# /// script
# requires-python = ">=3.9"
# dependencies = [
#     "ruamel.yaml>=0.18.0",
# ]
# ///
"""
Update _pkgdown.yml files to include Posit support badge script.

This script finds _pkgdown.yml in the specified directory and adds the
Posit support badge script tag to template.includes.in_header if not already present.
"""

import argparse
import sys
from pathlib import Path
from ruamel.yaml import YAML
import ruamel

SCRIPT_TAG = '<script src="https://cdn.jsdelivr.net/gh/posit-dev/supported-by-posit/js/badge.min.js" data-max-height="43" data-light-bg="#666f76" data-light-fg="#f9f9f9"></script>'


def find_pkgdown_yml(directory: Path) -> Path | None:
    """Find _pkgdown.yml file in directory or subdirectories."""
    # Check root first
    root_yml = directory / "_pkgdown.yml"
    if root_yml.exists():
        return root_yml

    # Search recursively
    for yml_file in directory.rglob("_pkgdown.yml"):
        return yml_file

    return None


def update_yaml_file(file_path: Path) -> bool:
    """
    Update the YAML file to include the script tag.

    Returns True if file was modified, False if no changes needed.
    """
    yaml = YAML()
    yaml.preserve_quotes = True
    yaml.default_flow_style = False
    yaml.width = 4096  # Prevent line wrapping

    # Load existing YAML
    with open(file_path, "r") as f:
        data = yaml.load(f)

    if data is None:
        data = {}

    # Navigate/create the nested structure
    if "template" not in data:
        data["template"] = {}

    if "includes" not in data["template"]:
        data["template"]["includes"] = {}

    # Handle in_header
    if "in_header" not in data["template"]["includes"]:
        # Create new in_header with just the script tag
        data["template"]["includes"]["in_header"] = SCRIPT_TAG + "\n"
        modified = True
    else:
        existing_content = data["template"]["includes"]["in_header"]

        # Check if script tag already exists
        if SCRIPT_TAG in existing_content:
            return False  # No modification needed

        # Prepend script tag to existing content
        if existing_content:
            # Ensure existing content doesn't start with newline to avoid double newlines
            existing_content = existing_content.lstrip("\n")
            data["template"]["includes"]["in_header"] = (
                SCRIPT_TAG + "\n" + existing_content
            )
        else:
            data["template"]["includes"]["in_header"] = (
                ruamel.yaml.scalarstring.LiteralScalarString(SCRIPT_TAG + "\n")
            )

        modified = True

    # Write back to file
    if modified:
        with open(file_path, "w") as f:
            yaml.dump(data, f)

    return modified


def main():
    parser = argparse.ArgumentParser(
        description="Update _pkgdown.yml to include Posit support badge script"
    )
    parser.add_argument(
        "directory",
        type=Path,
        help="Directory containing _pkgdown.yml (searches recursively)",
    )

    args = parser.parse_args()

    # Validate directory
    if not args.directory.exists():
        print(f"Error: Directory '{args.directory}' does not exist", file=sys.stderr)
        sys.exit(1)

    if not args.directory.is_dir():
        print(f"Error: '{args.directory}' is not a directory", file=sys.stderr)
        sys.exit(1)

    # Find _pkgdown.yml
    yml_file = find_pkgdown_yml(args.directory)
    if yml_file is None:
        print(
            f"Error: Could not find _pkgdown.yml in '{args.directory}'", file=sys.stderr
        )
        sys.exit(1)

    print(f"Found _pkgdown.yml at: {yml_file}")

    # Update the file
    modified = update_yaml_file(yml_file)

    if modified:
        print("✓ Successfully updated _pkgdown.yml with Posit support badge script")
    else:
        print("✓ Script tag already present, no changes needed")

    return 0


if __name__ == "__main__":
    sys.exit(main())
