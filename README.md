## Rootless Prowlarr 🚀  
- #### Built straight from the latest [Prowlarr release](https://github.com/Prowlarr/Prowlarr/releases) 📚. 
- #### The difference between this image and others is that this runs as an *unprivileged user*, using a uid (1000) and gid (1000) 👥. 

## Why run as an unprivileged user? 🔒  
- Running Prowlarr as an unprivileged user helps to: 
  - Reduce the attack surface of your container 
  - (Possibly) Prevent potential security vulnerabilities in case of a compromise 🤖     

## Usage 📁  
- This image can be used in the same way as any other Docker Prowlarr image. Simply pull and run it using Docker, make sure the volumes mounted are owned by 1000:1000 (likely your user) 🔄.

**Example docker-compose.yml**
```docker-compose.yml
  prowlarr:
    image: fthffs/prowlarr:1.25.4.4818
    container_name: prowlarr
    environment:
      - TZ=Europe/Stockholm
    volumes:
      - /containers/torrents/prowlarr:/config
    restart: unless-stopped
``` 

[Prowlarr wiki](https://wiki.servarr.com/prowlarr)

[Trash Guides](https://trash-guides.info/Prowlarr/)
