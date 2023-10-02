@echo off
setlocal

rem create local tagged image using local image
rem Create a local Docker image from the loaded image
rem docker tag :%IMAGE_TAG% %LOCAL_IMAGE_NAME%:%LOCAL_IMAGE_TAG%

rem Set the variable for the image name and tag
set IMAGE_NAME=simple-springboot-local-image
set IMAGE_TAG=latest

rem Set the minikube container ID where you want to copy the image
set CONTAINER_ID=26cf4f455eb75343d368a8a80648248af79147a51256ac7c1ff2121a12168033



rem Set the name of the image tar file
set IMAGE_TAR=%IMAGE_NAME%.tar

rem Step 1: Save the Docker image to a tar file
docker save -o %IMAGE_TAR% %IMAGE_NAME%:%IMAGE_TAG%

rem Step 2: Copy the image tar file to the Docker container
docker cp %IMAGE_TAR% %CONTAINER_ID%:/

rem Step 3: Load the image from the tar file inside the container
docker exec %CONTAINER_ID% docker load -i /%IMAGE_TAR%

rem Cleanup: Remove the local image tar file (optional)
del %IMAGE_TAR%

endlocal
