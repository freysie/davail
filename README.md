# `davail` 1.0

**`davail`** is a command line utility for easily determining domain name availability.

## Installation

Run `gem install davail`.

## Usage

```
davail [options...] names...

    -h, --help                       Display this help and exit
    -v, --version                    Display version and exit

    -a, --all-tlds                   Check all TLDs

    -b, --blink-available            Blink when available

    -e, --detailed-errors            Detailed error messages
```

## Configuration

Place a YAML file at `~/.davailrc`, e.g.:

```yaml
data_format: '%e %b %Y'
queried_tlds: [org com lol codes]
result_delimiter: "  "
```

## Requirements

Only tested with Ruby 2.2.0, 2.2.2, and 2.2.3.

## Known Issues

* Tests are missing.
* Specific domains can’t be looked up like `davail foo.com bar.net`.
* Lookups are not asynchronous.
* Proper config options documentation is missing.
* Everything shouldn’t be in `bin`.
* That whole `rescue Interrupt` thing is hopefully superfluous.
