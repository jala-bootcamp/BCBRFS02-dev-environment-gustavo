
FROM node:20

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json pnpm-lock.yaml ./

# Install dependencies using PNPM
RUN npm install -g pnpm && pnpm install

# Copy the rest of the app's code
COPY . .

# Build the app
RUN pnpm run build

# Expose the app's port
EXPOSE 3000

# Start the app
CMD ["pnpm", "run", "start"]