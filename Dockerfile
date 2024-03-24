FROM alpine as base

FROM witonai/benv:yoctoproject-poky-scarthgap-src AS src

FROM witonai/benv:yocto as build

COPY --from=src /src /src

RUN source /src/oe-init-build-env && \
    bitbake core-image-minimal --runall=fetch

COPY --from=build /build/downloads /downloads