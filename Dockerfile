FROM debian:buster

# Install dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    sudo \
    wget \
    xvfb \
    curl \
    haxe

# Install Haxelib
RUN mkdir ~/haxelib && haxelib setup ~/haxelib

# Install HaxeFlixel and related add-ons
RUN haxelib install flixel
RUN haxelib install flixel-addons
RUN haxelib install flixel-ui 

# Install game libraries
RUN haxelib install firetongue 
RUN haxelib install compiletime

# Set hxcpp to a version we can actually use
RUN haxelib install hxcpp 3.4.64
