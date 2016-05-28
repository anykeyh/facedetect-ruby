# Facedetect

This is just a ruby wrapper for the tool [facedetect](https://www.thregr.org/~wavexx/software/facedetect/).

## Installation

### Requirements

This gem need python and opencv installed.

On Linux (Ubuntu and Debian):

```bash
sudo apt-get install python python-opencv libopencv-dev
```

On Mac OSX using homebrew:

```bash
brew tap homebrew/science
brew install python opencv
```

### Installing the gem

Add this line to your application's Gemfile:

```ruby
gem 'facedetect', github: "anykeyh/facedetect-ruby"
```

And then execute:

    $ bundle

Or install it yourself using [specific_install](https://github.com/rdp/specific_install) as:

    $ gem specific_install https://github.com/anykeyh/facedetect-ruby.git

## Usage


You can then use facedetect binary like this:

```bash
facedetect -o test.jpg input.jpg
```

Or into your ruby code/program:

```ruby
Facedetect::run("-o test.jpg", "input.jpg").each do |face|
  face_rectangle = [face.x,face.y,face.width,face.height]
end
```

All the arguments of [facedetect](https://www.thregr.org/~wavexx/software/facedetect/) can be used. Please check the documentation of the lib for more info.
`facedetect-ruby` add however the new argument `--strict` which help to remove the false positives discrimining the output through multiple cascades.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anykeyh/facedetect. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

According to the wavexx facedetect initial code, the gem is available as open source under the terms of the [GPLv2 License](https://opensource.org/licenses/GPL-2.0).

