FROM witonai/benv:yoctoproject-poky-scarthgap-src AS src

FROM witonai/benv:yoctoproject-poky-scarthgap-core-image-minimal-downloads as downloads

FROM witonai/benv:yocto as build

COPY --from=src /src /src

COPY --from=downloads /downloads /src/build/downloads

RUN groupadd -r bitbake && useradd -r -g bitbake bitbake

RUN chown -R bitbake:bitbake /src

USER bitbake

SHELL ["/bin/bash", "-c"]

WORKDIR /src

RUN source oe-init-build-env && \
    bitbake core-image-full-cmdline --runall=fetch

FROM alpine as final

COPY --from=build /src/build/downloads /downloads