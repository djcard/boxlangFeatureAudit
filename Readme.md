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
