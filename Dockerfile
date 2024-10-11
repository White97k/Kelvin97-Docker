# Stage 1: Build the C++ application
FROM ubuntu:20.04 AS builder

# Set environment variables
ENV APP_HOME=/app
ENV BUILD_DIR=$APP_HOME/build
ENV OUTPUT_FILE=$BUILD_DIR/output.html

# Metadata labels
LABEL maintainer="you@example.com"
LABEL version="1.0"
LABEL description="This image builds and serves a C++ app output using NGINX."

# Install necessary packages to build the C++ application
RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    make \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR $APP_HOME

# Copy the C++ source code to the container
COPY app/ .

# Create a build directory and compile the C++ program
RUN mkdir $BUILD_DIR && cd $BUILD_DIR && \
    cmake .. && \
    make

# Stage 2: Use NGINX to serve the application output
FROM nginx:alpine

# Set environment variables
ENV APP_HOME=/usr/share/nginx/html

# Metadata labels for this stage
LABEL maintainer="you@example.com"
LABEL version="1.0"
LABEL description="This stage serves the compiled C++ application using NGINX."

# Copy custom NGINX configuration to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the C++ program's output (HTML file) from the build stage
COPY --from=builder $OUTPUT_FILE $APP_HOME/index.html

# Expose port 80 to the outside world
EXPOSE 80

# Define a health check to monitor if the NGINX service is running
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl --fail http://localhost:80 || exit 1

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
