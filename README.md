# README

## Directions (local server)
Follow these steps to run a local server, which will require Rails v5.1 and PostgresQL
1. Install Rails v5.1 or greater
2. Install PostgresQL
3. Extract the zip file
4. Open a terminal window at the extracted folder
5. Install Gems with 
```
bundle install
```
6. Create the database, load schema, and generate seed data with 
```
rails db:setup
```
7. Run a local server with 
```
rails s
```

### API Endpoints

#### 1. Number of items purchased by Customer and Category
http://localhost:3000/api/customers/number_purchased_by_category

returns values for all customers/categories

Sample response:
```
[
  {
    "customer_id": 1,
    "customer_first_name": "alice",
    "category_id": 1,
    "category_name": "food",
    "number_purchased": 5
  },
  {
    "customer_id": 1,
    "customer_first_name": "alice",
    "category_id": 2,
    "category_name": "toys",
    "number_purchased": 6.5
  },
  {
    "customer_id": 1,
    "customer_first_name": "alice",
    "category_id": 3,
    "category_name": "clothing",
    "number_purchased": 3.8
  },
  {
    "customer_id": 2,
    "customer_first_name": "bob",
    "category_id": 1,
    "category_name": "food",
    "number_purchased": 16
  },
  {
    "customer_id": 2,
    "customer_first_name": "bob",
    "category_id": 2,
    "category_name": "toys",
    "number_purchased": 3.4
  }
]
```

Limit the request to specific customers by specifying their customer_id:

http://localhost:3000/api/customers/2/number_purchased_by_category

Sample response:

```
[
  {
    "customer_id": 2,
    "customer_first_name": "bob",
    "category_id": 1,
    "category_name": "food",
    "number_purchased": 16
  },
  {
    "customer_id": 2,
    "customer_first_name": "bob",
    "category_id": 2,
    "category_name": "toys",
    "number_purchased": 3.4
  }
]
```

#### 2. Number of Products Sold within Date Range

Use query params start_date, end_date, and interval ('day', 'week', or 'month') to filter the search

The interval indicates quantity shown is either 'per day', 'per week', or 'per month' during the date range

http://localhost:3000/api/products/quantities_sold?start_date=2018/2/1&end_date=2018/2/28&interval=week

Sample response:

```
{
  "start_date": "2018-02-01",
  "end_date": "2018-02-28",
  "interval": "week",
  "total_weeks": 4,
  "products": [
    {
      "product_id": 1,
      "product_name": "Big Mac",
      "quantity": 4.5
    },
    {
      "product_id": 2,
      "product_name": "French Fries",
      "quantity": 0.75
    },
    {
      "product_id": 3,
      "product_name": "Hulk Figure",
      "quantity": 1.375
    },
    {
      "product_id": 4,
      "product_name": "Rubik's Cube",
      "quantity": 1.1
    },
    {
      "product_id": 5,
      "product_name": "Tinfoil Hat",
      "quantity": 0.125
    },
    {
      "product_id": 6,
      "product_name": "Prophetic Spectacle",
      "quantity": 0.825
    }
  ]
}
```

Add a '.csv' after 'quantities_sold' to instead download a csv file with the results

http://localhost:3000/api/products/quantities_sold.csv?start_date=2018/2/1&end_date=2018/2/28&interval=day

#### 3. Customer Orders

View all order information for a specific customer

http://localhost:3000/api/customers/1/orders

Sample response:

```
[
  {
    "order_id": 1,
    "order_date": "2018-02-01",
    "status": "waiting for delivery",
    "products": [
      {
        "product_id": 1,
        "product_name": "Big Mac",
        "number_purchased": 3
      },
      {
        "product_id": 2,
        "product_name": "French Fries",
        "number_purchased": 2
      },
      {
        "product_id": 3,
        "product_name": "Hulk Figure",
        "number_purchased": 5.5
      }
    ]
  },
  {
    "order_id": 3,
    "order_date": "2018-02-21",
    "status": "delivered",
    "products": [
      {
        "product_id": 4,
        "product_name": "Rubik's Cube",
        "number_purchased": 1
      },
      {
        "product_id": 5,
        "product_name": "Tinfoil Hat",
        "number_purchased": 0.5
      },
      {
        "product_id": 6,
        "product_name": "Prophetic Spectacle",
        "number_purchased": 3.3
      }
    ]
  }
]
```

## Directions (heroku server)
If you do not wish to install Rails v5.1 and/or PostgresQL, you may connect to the API endpoints by replacing

"https://product-ordering.herokuapp.com" above with "https://product-ordering.herokuapp.com"

#### 1. Number of items purchased by Customer and Category

https://product-ordering.herokuapp.com/api/customers/number_purchased_by_category

https://product-ordering.herokuapp.com/api/customers/2/number_purchased_by_category

#### 2. Number of Products Sold within Date Range

https://product-ordering.herokuapp.com/api/products/quantities_sold?start_date=2018/2/1&end_date=2018/2/28&interval=week

https://product-ordering.herokuapp.com/api/products/quantities_sold.csv?start_date=2018/2/1&end_date=2018/2/28&interval=day

#### 3. Customer Orders

https://product-ordering.herokuapp.com/api/customers/1/orders