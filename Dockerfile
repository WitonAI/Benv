FROM witonai/benv:yoctoproject-poky-scarthgap-src AS src

FROM witonai/benv:yocto as build

RUN groupadd -r bitbake && useradd -r -g bitbake bitbake

USER bitbake

SHELL ["/bin/bash", "-c"]

COPY --from=src /src /src

RUN chown -R bitbake:bitbake /src

WORKDIR /src

RUN source oe-init-build-env && \
    bitbake core-image-minimal --runall=fetch

FROM alpine as final

COPY --from=build /src/build/downloads /downloads