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

# variants

| Attribute  | Type    | Default |
| ---------- | ------- | ------- |
| product_id | uuid    |         |
| price      | float   | 0.0     |
| sku        | string  | ''      |
| barcode    | string  | ''      |
| stock      | integer | 0       |
| alt_name   | string  | ''      |

## attribute_option_variants (option_variants)
<!-- product_id -->
<!-- attribute_id -->
| Attribute  | Type | Default |
| ---------- | ---- | ------- |
| variant_id | uuid |         |
| option_id  | uuid |         |

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

```

ActiveRecord::Schema.define(version: 2018_02_02_154750) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
  end

  create_table "attributes", force: :cascade do |t|
    # t.bigint "product_id"
    # t.index ["product_id"], name: "index_attributes_on_product_id"
    t.string "name"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "attribute_id"
    t.string "name"
    t.index ["attribute_id"], name: "index_options_on_attribute_id"
  end

  create_table "variants", force: :cascade do |t|
    t.bigint "product_id"
    t.string "sku"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.boolean "is_master"
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  create_table "attribute_option_variants", force: :cascade do |t|
    t.bigint "option_id"
    t.bigint "variant_id"
    t.index ["option_id"], name: "index_attribute_option_variants_on_option_id"
    t.index ["variant_id"], name: "index_attribute_option_variants_on_variant_id"
  end

  add_foreign_key "attributes", "products"
  add_foreign_key "options", "attributes"
  add_foreign_key "variants", "products"
  add_foreign_key "attribute_option_variants", "options"
  add_foreign_key "attribute_option_variants", "variants"
end

```
