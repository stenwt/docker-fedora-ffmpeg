FROM fedora:24

RUN dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-24.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-24.noarch.rpm && dnf clean all && dnf -y install ffmpeg && dnf clean all

WORKDIR /tmp/ffmpeg

ENTRYPOINT ["ffmpeg"]

# In ~/.bashrc:
# function ffmpeg { sudo docker run -i --privileged -v=$(pwd):/tmp/ffmpeg ffmpeg $* ; }
# sudo if you're not in docker group, --priviliged to read $CWD (on systems with properly configured security)
