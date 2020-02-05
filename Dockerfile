FROM centos:centos7 AS base-dependencies
LABEL maintainer="Abdelrahman Hosny <abdelrahman_hosny@brown.edu>"

RUN yum group install -y "Development Tools" && \
    yum update -y && yum install -y libffi-devel python3 tcl-devel which && \
    yum localinstall https://www.klayout.org/downloads/CentOS_7/klayout-0.26.3-0.x86_64.rpm -y

WORKDIR /OpenROAD-flow
RUN mkdir -p /OpenROAD-flow

COPY --from=openroad /OpenROAD/build ./OpenROAD/build
COPY --from=openroad/yosys /build ./OpenROAD/build/src/yosys
COPY --from=openroad/tritonroute /build ./OpenROAD/build/src/TritonRoute
COPY ./setup_env.sh .
COPY ./setup_env_docker.sh .
COPY ./flow ./flow
RUN chmod o+rw -R /OpenROAD-flow/flow
