# Start from apline, a minimal docker image
FROM arm64v8/alpine:latest

# Add in SSL certificates for use with https, curl to call the update endpoint,
# bash used by the namecheap-ddns-update script, and gawk to parse the response
RUN apk add --update ca-certificates curl bash gawk

# Copy the pre-built go executable and the static files
ADD namecheap-ddns-update.sh /
RUN chmod +x /namecheap-ddns-update.sh

# This script registers subdomains to a domain you own and hosted by namecheap
CMD ["/namecheap-ddns-update.sh"]
