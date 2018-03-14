FROM debian:buster

# Install dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    sudo \
    wget \
    xvfb \
    curl \
    git \
    haxe \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    g++ \
    g++-multilib \
    gcc-multilib \
    libasound2-dev \
    libx11-dev \
    libxext-dev \
    libxi-dev \
    libxrandr-dev \
    libxinerama-dev

# Install Haxelib
RUN mkdir ~/haxelib && haxelib setup ~/haxelib

# Install HaxeFlixel and related add-ons
RUN haxelib install flixel
RUN haxelib install flixel-addons
RUN haxelib install flixel-ui 

# Install game libraries
RUN haxelib install firetongue 
RUN haxelib install compiletime

# Install native libraries
RUN haxelib git openfl-webm https://github.com/23rd/haxe-openfl-webm.git
RUN sh ~/haxelib/openfl-webm/git/build_linux.sh

RUN haxelib git steamwrap https://github.com/larsiusprime/SteamWrap.git
RUN haxelib git crashdumper http://github.com/larsiusprime/crashdumper

# Install hxcpp
RUN yes | haxelib set hxcpp 3.4.64
