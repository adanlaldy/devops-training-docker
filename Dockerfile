# using apache
FROM httpd
# copy the Hello World
COPY /html/ /usr/local/apache2/htdocs/
