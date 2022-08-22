# React Vars Nginx container

This repo is to provide a staple guidance and primary example of persisting environment variables through nginx containers. 

The objective of environment variables is to inject through build time. When compiled, environment variables is processed through a giant compiled javascript file that lives underneath the build directory. 

When deploying to specific environments and working through a build once and deploy many scenario is that you would need to essentially build each and every single time for each environment in order to persist the environment variables through build process. 


## Objective 
This template / solution primarily solves that assuming you are deploy to cloud services in example (GCP, AWS, etc.). Objective is simple, while building and containerising the entire application, we essentially need to rewrite the environment variables that will inject into the window object. 

We do this by writing an automation script that will persist any variable that starts with 'REACT_APP', and rewrite any values into an env.js that will be referenced in the index.html file under script tags.