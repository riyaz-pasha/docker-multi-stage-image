# === BUILD STAGE ===
FROM golang:latest as build
WORKDIR /app
COPY . .
RUN make build-linux

# === RUN STAGE ===
FROM ubuntu
WORKDIR /app
COPY --from=build /app/out/go-app ./
CMD ["./go-app"]