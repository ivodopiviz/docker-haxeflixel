FROM debian:buster

# Install dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    sudo \
    wget \
    xvfb \
    curl \
    git \
    haxe

# Install Haxelib
RUN mkdir ~/haxelib && haxelib setup ~/haxelib

# Install hxcpp
RUN haxelib install hxcpp

# Install HaxeFlixel and related add-ons
RUN haxelib install flixel
RUN haxelib install flixel-addons
RUN haxelib install flixel-ui 

# Install game libraries
RUN haxelib install firetongue 
RUN haxelib install compiletime

# Install native libraries
RUN haxelib install openfl-webm
RUN haxelib git steamwrap https://github.com/larsiusprime/SteamWrap.git
