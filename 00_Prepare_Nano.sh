#!/bin/bash

# The purpose of this script is to remove Ubuntu packages, that are deemed unnecessary to run ML/AI/CNN/CUDA and others.

echo "Removing LibreOffice and its associates"

# LibreOffice and its supporting package are removed in this step.
sudo apt remove -y libreoffice-writer libreoffice-impress libreoffice-math libreoffice-calc libreoffice-base-core libreoffice-core libreoffice-common libdjvulibre21 libdjvulibre-text

echo "Removing games, music, bit torrent and emailclient"

#Second the games, and music (some video and music players will still be present after this)
sudo apt remove -y aisleriot compton gnome-mahjongg gnome-mines gnome-sudoku leafpad thunderbird transmission-common rhythmbox lxmusic

echo "Removing fonts (non-english)"

# Remove Indian fonts
sudo apt remove -y fonts-lohit-beng-bengali fonts-lohit-deva fonts-lohit-gujr fonts-lohit-guru fonts-lohit-knda fonts-lohit-mlym fonts-lohit-orya fonts-lohit-taml fonts-lohit-taml-classical fonts-lohit-telu

echo "Removing, Utilitis, scaning, and onscreen keyboard, etc.,"

# Removing utilities, such as Scan, onscreen keyboard, etc.,
sudo apt remove -y gpicview xterm simple-scan shotwell deja-dup gnome-todo yelp onboard 

echo "Removing orphaned packages with Autoremove"
# Cleaning up any lingering packages
sudo apt -y autoremove

echo "----------------------------------------------------------------"

echo "Upgrading Ubuntu, and installing zram to increase swap, and nano a much nicer editor than vi"
# Update upgrade and install some packages that we will use.

sudo apt update -y
echo "you will be requested to enter 'Y' a couple time, and selected 'Yes' for Docker"
sudo apt upgrade -y 

sudo apt install zram-config nano

echo "Permission change to support Docker"

#an issue with docker, when running the service
sudo usermod -aG docker ${USER} 

sudo chmod 666 /var/run/docker.sock

echo "sudo command will not ask for password anymore for the ${USER}"
#remove sudo from asking password - another annoyance
echo " " | sudo EDITOR='tee -a' visudo
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo


