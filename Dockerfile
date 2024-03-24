FROM witonai/benv:yoctoproject-poky-scarthgap-src AS src

FROM witonai/benv:yocto as build

COPY --from=src /src /src

SHELL ["/bin/bash", "-c"]

WORKDIR /src

RUN source oe-init-build-env && \
    bitbake core-image-minimal --runall=fetch

FROM alpine as final

COPY --from=build /src/build/downloads /downloads