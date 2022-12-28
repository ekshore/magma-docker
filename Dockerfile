FROM fedora:latest

# Install dependencies
RUN sudo dnf install java-17-openjdk.x86_64 -y

# Create Server directories
RUN mkdir /server
WORKDIR /server

RUN mkdir ./config
RUN mkdir ./defaultconfigs
RUN mkdir ./mods
RUN mkdir ./scripts

#Download magma version
RUN curl https://git.magmafoundation.org/api/v4/projects/5/packages/maven/org/magmafoundation/Magma/1.18.2-40.1.92-f79b38cf/Magma-1.18.2-40.1.92-f79b38cf-server.jar --output magma.jar

# Copy Modpack into server directory.
COPY modpack/config ./config
COPY modpack/defaultconfigs ./defaultconfigs
COPY modpack/mods ./mods
COPY modpack/scripts ./scripts
COPY modpack/server-icon.png ./server-icon.png

ENTRYPOINT [ "java", "-jar", "-Xmx4096m", "magma.jar", "-accepteula", "-dua"]