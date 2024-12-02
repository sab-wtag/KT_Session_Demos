# KT Presentation Demo Projects
This repo contains different short demo projects for demonstrating different security vulnerabilites and how coldfusion tackles them.
It also shows the best practices in terms of security in coldfusion.

## Running Locally
First you need to clone the entire repository
```
git clone --depth 1 git@github.com:sab-wtag/KT_Session_Demos.git
```
To run the SQLi project, go into the repository directory and run the command
```
cd KT/SQLi
docker compose up --build
```
To run any of the other projects you must change the following line according to your file path,
```
-v "/Users/ahbab/CFML/KT/${FOLDER_NAME}:/var/www/"
```
Here you must add your file path.
After setting your file path here, you can run the below command to set script execution permission
```
chmod +x run_script.sh
```
Then you can simply run,
```
./run_script.sh {folder_name}
```
This will run you application on address,
```
http://localhost:8080
```