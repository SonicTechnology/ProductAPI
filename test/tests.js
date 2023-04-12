import http from 'k6/http';
// require('dotenv').config();

export const options = {
  stages: [
    { target: 1000, duration: '2m' }, // simulate ramp-up of traffic from 1 to 50 users over 3 minutes.
    { duration: '3m', target: 1000 }, // stay at 50 users for 5 minutes
    // { duration: '2m', target: 0 }, // ramp-down to 0 users
  ],
  // vus: 100,
  thresholds: {
    http_req_failed: ['rate<0.01'], // http errors should be less than 1%
    http_req_duration: ['p(95)<200'], // 95% of requests should be below 200ms
  },
};

export default function () {
    let id = Math.floor(Math.random() * (1000011 - 1 + 1) + 1)
    http.get(`http://localhost:${__ENV.PORT}/products/${id}`, {
      tags: { name: 'getProductsByID' },
    });
    http.get(`http://localhost:${__ENV.PORT}/products/${id}/styles`, {
      tags: { name: 'getStylesByID' },
    });
}