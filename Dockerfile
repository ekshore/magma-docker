FROM fedora:latest

# Install dependencies
RUN sudo dnf install java-17-openjdk.x86_64 -y
RUN sudo dnf install unzip -y

# Create Server directories
RUN mkdir /server

#Download magma version
WORKDIR /server
RUN curl https://git.magmafoundation.org/api/v4/projects/5/packages/maven/org/magmafoundation/Magma/1.18.2-40.1.92-f79b38cf/Magma-1.18.2-40.1.92-f79b38cf-server.jar --output magma.jar

ENTRYPOINT [ "java", "-jar", "-Xmx4096m", "magma.jar", "-accepteula", "-dua"]