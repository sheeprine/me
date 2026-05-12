FROM nginx:alpine

COPY index.html resume.html style.css script.js /usr/share/nginx/html/
COPY img/ /usr/share/nginx/html/img/
COPY stephane-albert-resume.pdf /usr/share/nginx/html/
