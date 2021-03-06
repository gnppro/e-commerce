# Data Base

## products

| Attribute             | Type                                      | Default |
| --------------------- | ----------------------------------------- | ------- |
| id                    | uuid                                      |         |
| name                  | string                                    |         |
| slug                  | string                                    |         |
| description           | string                                    |         |
| short_description     | string                                    |         |
| sku                   | string                                    |         |
| regular_price         | string                                    |         |
| sale_price            | string                                    |         |
| price                 | string                                    |         |
| purchase_note         | string                                    |         |
| weight                | string                                    |         |
| external_url          | string                                    |         |
| parent_id             | integer                                   |         |
| total_sales           | integer                                   |         |
| download_limit        | integer                                   | -1      |
| download_expiry       | integer                                   | -1      |
| stock_quantity        | integer                                   |         |
| rating_count          | integer                                   |         |
| menu_order            | integer                                   |         |
| average_rating        | float                                     |         |
| featured              | boolean                                   |         |
| on_sale               | boolean                                   |         |
| purchasable           | boolean                                   |         |
| virtual               | boolean                                   |         |
| downloadable          | boolean                                   |         |
| manage_stock          | boolean                                   |         |
| backorders_allowed    | boolean                                   |         |
| backordered           | boolean                                   |         |
| sold_individually     | boolean                                   | true    |
| shipping_required     | boolean                                   |         |
| reviews_allowed       | boolean                                   |         |
| date_on_sale_from     | datetime                                  |         |
| date_on_sale_from_gmt | datetime                                  |         |
| date_on_sale_to       | datetime                                  |         |
| date_on_sale_to_gmt   | datetime                                  |         |
| type                  | enum(simple, grouped, external, variable) | simple  |
| status                | enum(draft, pending, private, publish)    | publish |
| stock_status          | enum(instock, outofstock, onbackorder)    | instock |
| backorders            | enum(no, notify, yes)                     | notify  |
| dimensions            | json                                      |         |
| meta_data             | json                                      |         |

| related_ids           | array                                     |         |
| upsell_ids            | array                                     |         |
| cross_sell_ids        | array                                     |         |

<!-- | attributes            | array                                     |         | -->
| variants              | array                                     |         |
| categories            | array                                     |         |
| images                | array                                     |         |
| downloads             | array                                     |         |
| tags                  | array                                     |         |
| grouped_products      | array                                     |         |
| tax_status            | string                                    |         |
| tax_class             | string                                    |         |
| tax_class_id          | integer                                   |         |
| shipping_class        | string                                    |         |
| shipping_class_id     | integer                                   |         |


## attributes

| Attribute        | Type    | Default |
| ---------------- | ------- | ------- |
| name             | string  |         |
| slug             | string  |         |
| component        | string  | select  |
| position         | integer |         |
| count            | integer | 0       |
| visible          | boolean | false   |
| variation        | boolean | false   |
| options          | string  | []      |
| options_order_by | column  | order   |

## options

| Attribute    | Type     | Default |
| ------------ | -------- | ------- |
| attribute_id | uuid     |         |
| name         | string   |         |
| slug         | string   |         |
| description  | string   |         |
| order        | integer  | 0       |
| count        | interger | 0       |

## attribute_option_variants (attribute_variants)
<!-- product_id -->
<!-- attribute_id -->
| Attribute           | Type | Default |
| ------------------- | ---- | ------- |
| variant_id          | uuid |         |
| attribute_option_id | uuid |         |

# variants

| Attribute  | Type    | Default |
| ---------- | ------- | ------- |
| product_id | uuid    |         |
| price      | float   | 0.0     |
| sku        | string  | ''      |
| barcode    | string  | ''      |
| stock      | integer |         |
| alt_name   | string  |         |




```
{
  "stock_quantity": 10,
  "variation": [
    {
      "name": "Size",
      "option": "16GB"
    },
    {
      "name": "Color",
      "option": "Black"
    }
  ],
  "allowOutOfStockPurchases": true
},
{
  "stock_quantity": 1,
  "variation": [
    {
      "name": "Size",
      "option": "32GB"
    },
    {
      "name": "Color",
      "option": "Red"
    }
  ],
  "allowOutOfStockPurchases": false
}
```
