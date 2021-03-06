#!/bin/bash
# Installs required prerequisites for running corona_model.py

# Confirms if user wants to install new software
printf "This program installs prerequsites for this repository: Python3, pip3, python3-lib-pandas, python3-lib-matplotlib, 
and python3-lib-sklearn will be installed if these files do not exist. This is preceeded by a system update. All of this 
will not be harmful to your computer apart from storage issues.\n";
echo -n "Do you wish to proceed? [y / n] ";
read userInput;
if [[ $userInput = 'n' ]] || [[ $userInput = 'N' ]]
then
	echo "Exiting...";
	exit 1;
elif ! [[ $userInput = 'y' ]] && ! [[ $userInput = 'Y' ]]
then
	echo "Please respond with y or n. Exiting...";
	exit 1;
fi

# Update system to not ruin user's computer
echo "Updating...";
sudo apt-get update > /dev/null;

# Install python3 if not already installed
if [ -z $(which python3) ]
then
	echo "Installing python3.7...";
	sudo apt-get install -y python3 > /dev/null;
fi

# Install pip3 if not already installed
if [ -z $(which pip3) ]
then
	echo "Installing pip3...";
	sudo -H apt-get install -y python3-pip > /dev/null;
fi

# Install pandas if not already installed
if [[ -z `pip3 list --format=columns | grep "pandas"` ]]
then
	echo "Installing Panda...";
	pip3 install pandas > /dev/null;
fi

# Install matplotlib if not already installed
if [[ -z `pip3 list --format=columns | grep "matplotlib"` ]]
then
	echo "Installing Matplotlib...";
	pip3 install matplotlib > /dev/null;
fi

echo "Finished Setup!"
