## Slack Mass Uploader 

A command line tool to upload a directory of images as custom emojis to your Slack workspace. 

Loosely based on Kinduff's [Slack Big Emoji](https://github.com/kinduff/slack-big-emoji). 

## Support

Make sure you're using Ruby 2.4.0 (will support native OS X version soon) and you have a working installation of ImageMagick.

The tool can only process static image files (only png, jpg, jpeg).

## Installation

Installation is done through RubyGems, to install run:

```
$ gem install slack-mass-uploader
```

Once completed you should be ready to go.

## Usage

Ensure that you have a directory of images named with what you'd like them to be named as Slack emojis. 

Locate this directory and run: 
```
$ slack-mass-uploader <path>/<to>/<directory>
```

The script will resize all of the images into a `slack-mass-uploader` (or otherwise specified) directory and upload them all under the same file names (through a small wizard) to your team's Slack.

You can also run `slack-mass-emoji --help` for more options.