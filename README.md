# andVidToGif
Simple script to create a gif from a standard android screen grab .mp4 video via imagemagick and ffmpeg

## Dependencies

### OSX
* imagemagick
  * brew install imagemagick
* ffmpeg
  * brew install ffmpeg

## Usage
./andVidToGif.sh -i screendump.mp4 -o screendump.gif

## File to large?
I recommend shrinking your gif via https://github.com/pornel/giflossy

./gifsicle -O3 --lossy=80 -o screendump_shrunk.gif ./sreendump_source.gif 

## Method
* create tmp folder
* dump each frame into the tmp folder as a png
* shrink each png down to 1/4 original size
* stitch pngs together into output gif
* nuke tmp folder



