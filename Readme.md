# Boxlang Feature Audit

The Boxlang Feature Audit module puts a CommandBox module around the built in Boxlang Feature Audit in the core Boxlang Jar

## Installation

1. Install Boxlang according to the directions [here](https://boxlang.ortusbooks.com/getting-started/installation)
2. Run `install commandbox-BoxLangCompat` from CommandBox

## Usage

When installing Boxlang, the installer sets the BOX_LANG environmental variable which is key to using this module.

`BoxlangFeatureAudit audit <options>`

@source - Defaults to the current directory but accepts an absolute file or directory path

@reportFile - Accepts a filename or absolute file path. If set, the results of the audit will be written.

@missing - Defaults to false. If true, only displays any BIFs or components in your code which are missing in Boxlang

@aggregate - Defaults to false. If true, will aggregate based on the BIF or components found.

@summarize - Defaults to false. If true, will provide a summary of the aggregate. If both aggregate and summary are true, summary takes precendence.

@quiet - Defaults to false. If true, only the filenames being processed will appear in the console, not the details found.

## Changelog

0.0.8 - formatting in Readme improved

0.0.7 - better jar location in Linux

0.0.6 - better jar location in Linux

0.0.5 - updated github URLs in box.json to <https://github.com/djcard/boxlangFeatureAudit>

0.0.4 - expanded findBoxLang() to find updated versions of boxlang in the BOXLANG_HOME\lib folder and declared datatypes in the audit command to allow `--` syntax

0.0.2 - expanded findBoxLang() to look for boxlang-home in addition to BOXLANG_HOME

0.0.1 - initial release
