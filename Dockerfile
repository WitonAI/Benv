FROM witonai/benv:git

RUN git clone --depth=1 --recursive -b scarthgap git://git.yoctoproject.org/poky /src