FROM fedora:latest

ENV MODPACK_URL <URL destination for modpack of choice>
ENV MAGMA_URL https://git.magmafoundation.org/api/v4/projects/5/packages/maven/org/magmafoundation/Magma/1.18.2-40.1.92-f79b38cf/Magma-1.18.2-40.1.92-f79b38cf-server.jar

# Install dependencies
RUN sudo dnf install java-17-openjdk.x86_64 -y
RUN sudo dnf install unzip -y

# Create Server directories
RUN mkdir /server

# Download modpack and unzip it
RUN curl ${MODPACK_URL} -o modpack.zip
RUN unzip modpack.zip -d modpack

# Copy Modpack into server directory.
RUN cp -r /modpack/*/config /server/config
RUN cp -r /modpack/*/defaultconfigs /server/defaultconfigs
RUN cp -r /modpack/*/mods /server/mods
RUN cp -r /modpack/*/scripts /server/scripts
RUN cp -r /modpack/*/server-icon.png /server/server-icon.png

#Download magma version
WORKDIR /server
RUN curl ${MAGMA_URL} --output magma.jar

ENTRYPOINT [ "java", "-jar", "-Xmx4096m", "magma.jar", "-accepteula", "-dua"]