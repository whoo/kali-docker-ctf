FROM kalilinux/kali-rolling:amd64

RUN <<EOF
## Install Packages
export DEBIAN_FRONTEND=noninteractive
apt -y update
apt -y install build-essential python3 python3-pip libssl-dev file git zsh wget vim procps locales iputils-ping
apt -y install qrencode pngcheck zbar-tools lolcat nmap pipx curl
apt -y install kali-linux-headless
EOF


RUN <<EOF
## Install packages on image

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -e 's/robbyrussell/agnoster/g' -i /root/.zshrc
mkdir -p /root/.config/pip

cat > /root/.config/pip/pip.conf <<TT
[global]
break-system-packages = true
TT

# Install python Tool

pip install requests pwntools pycryptodome

EOF

RUN <<EOF
## Create user
useradd kali -s /bin/zsh
echo "kali ALL=(ALL) NOPASSWD:  ALL" | tee -a /etc/sudoers
EOF


WORKDIR /home/kali
