FROM jc21/registry-ui as origin

FROM node:alpine
COPY --from=origin /app /app

WORKDIR /app
CMD node --max_old_space_size=250 --abort_on_uncaught_exception src/backend/index.js