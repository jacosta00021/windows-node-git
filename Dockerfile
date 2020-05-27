FROM mcr.microsoft.com/windows:1903

RUN @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

RUN echo "Installing node" \
&& choco install nodejs --version=10.14.0 -y
WORKDIR C:\\Program Files\\nodejs
RUN SET PATH=%PATH%;%CD%

RUN echo "Installing git" \
&& choco install git -y
WORKDIR C:\\Program Files\\Git\\bin
RUN SET PATH=%PATH%;%CD%

RUN npm install -g npm@6.4.1 \
&& npm i --global gulp http-server

WORKDIR /

