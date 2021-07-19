sudo docker build -t pub-karaoke .
sudo docker images
sudo docker tag pub-karaoke arupiot/pub-karaoke:latest
sudo docker push arupiot/pub-karaoke
