# stage1 - build react app first
FROM node:14-alpine3.15 as build
# Override the base log level (info).
ENV NPM_CONFIG_LOGLEVEL warn

# Install `serve`.
RUN npm install -g serve

# Install all dependencies of the current project.
COPY package.json package.json
RUN npm install

# Copy all local files into the image.
COPY . .

# Build for production.
RUN npm run build

# serve static files in dist folder
CMD serve -p $PORT -s dist