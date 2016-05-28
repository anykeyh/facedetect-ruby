require File.expand_path("../facedetect/version", __FILE__)

module Facedetect
  # Your code goes here...

  LIB_PATH = File.expand_path("..", __FILE__)
  GEM_PATH = File.expand_path('..', LIB_PATH)

  ERROR_MESSAGE =
"""It seems like you miss some dependencies.
You should install OpenCV and Python 

On Linux (Ubuntu and Debian):
  sudo apt-get install python python-opencv libopencv-dev

On Mac OSX using homebrew:
  brew tap homebrew/science
  brew install python opencv
"""

  class Face
    attr_accessor :x, :y, :width, :height

    def initialize str
      @x, @y, @width, @height = str.split(" ").map(&:to_i)
    end

    def center_x
      ( x + width / 2 )
    end

    def center_y
      ( y + height / 2 )
    end

    def to_s
      "#{x} #{y} #{width} #{height}"
    end
  end

  class << self
    def py_file
      "python " + File.join(LIB_PATH, "facedetect.py")
    end

    def strict_run *args

    end

    def run *args
      begin
        out = ""
        pipe = IO.popen("FACEDETECT_RB_PATH='#{GEM_PATH}' #{py_file} #{args.join(" ")}", 'r'){|io|
          out << io.read
        }
      rescue Exception => e
        raise "Execution of command #{py_file} #{args.join(" ")} unsuccessful"
      end

      out.split("\n").map{ |l| Face.new(l) }
    end
  end

end
