# Monorepo best practice

## Main Point

- npm workspaces
- turborepo

## Local

### Install Dependencies

```sh
npm install
```

### Build

```sh
npm run build
```

### Run

```sh
npm run start
```

## Docker

### Build

```sh
docker build . -t test --build-arg APP_NAME=backend
```

### Run

```sh
docker run test
```
