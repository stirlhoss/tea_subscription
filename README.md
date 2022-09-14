# Tea Subscription Api
![db](./assets/images/'Screenshot from 2022-09-06 15-50-25.png')

## Prerequisites
- Rails 7.0.3.1
- Ruby 3.1.0

## Installation
- Fork and clone this repo
- run `bundle` to install gems
- run `rails db:{drop,create,migrate,seed}` to set up the database
- run `rails s` to start the app on localhost:3000

## Endpoints
### Create a subscription
- Sample request
  `POST /api/v1/subscriptions?title=Subscription&price=9.99&status=active&frequency=4&customer_id=1&tea_id=1`

- Sample response
```
  {
    "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "title": "Subscription",
            "price": 9.99,
            "status": "active",
            "frequency": 4,
            "customer_id": 1,
            "tea_id": 1
        }
    }
}
```

### Cancel a subscription
- Sample request
  `PATCH /api/v1/subscriptions/2?status=cancelled'`
- Sample response
```
{
  "response": "Subscription has been cancelled"
 }
```
### Request all subscriptions from one customer
- Sample request
  `GET /api/v1/customer_subscriptions/1`
- Sample response
  ```
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "New Subscription",
                "price": 9.99,
                "status": "cancelled",
                "frequency": 4,
                "customer_id": 1,
                "tea_id": 1
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Newer Subscription",
                "price": 9.99,
                "status": "cancelled",
                "frequency": 4,
                "customer_id": 1,
                "tea_id": 1
            }
        }
    ]
}
  ```