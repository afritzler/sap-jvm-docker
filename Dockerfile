FROM debian:stable-slim

ARG SAP_JVM_VERSION="8.1.059"

RUN rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends curl ca-certificates wget unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate --header "Cookie: eula_3_1_agreed=tools.hana.ondemand.com/developer-license-3_1.txt; path=/;" -S https://tools.hana.ondemand.com/additional/sapjvm-$SAP_JVM_VERSION-linux-x64.zip \
    && unzip sapjvm-$SAP_JVM_VERSION-linux-x64.zip -d /opt/ \
    && rm /sapjvm-$SAP_JVM_VERSION-linux-x64.zip

ENV JAVA_HOME=/opt/sapjvm_8/ \
    PATH="/opt/sapjvm_8/bin:$PATH"
#ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"
