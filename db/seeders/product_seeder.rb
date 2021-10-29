def create_products(n, vendor)
    n.times do 

        name= Faker::Lorem.sentence
        name[0] = name[0,1].upcase
        
        prod = Product.new(
            name: name,
            slug: name.parameterize,
            description: Faker::Lorem.paragraph_by_chars,
            vendor_id: vendor.id,
            brand_id: rand(1..165),
            subcategory_id: rand(1..707),
            active: true,
            validated: true,
            available: true,
            product_options_attributes:[
                {
                    option_id: 1,
                    _destroy: 0
                },
                {
                    option_id: 2,
                    _destroy: 0
                }
            ]
        )
        if(prod.save)
            create_variants(rand(1..5),prod)
        end   
        
    end
end

def create_variants(n, product)
    n.times do
        variant = ProductVariant.new(
            price: [10000,20000,30000,50000,60000,70000,80000,90000,100000].sample,
            sku:  Faker::Alphanumeric.alphanumeric(number: 10),
            quantity: rand(20..5000),
            product_id: product.id,
            product_variant_options_attributes: [
                {
                    product_option_id:product.product_options.first.id,
                    value: 'Red',
                    _destroy: 0
                },
                {
                    product_option_id:product.product_options.last.id,
                    value: 'None',
                    _destroy: 0
                }
            ]
        )

        if(variant.save)
            dir = "app/assets/images/#{product.subcategory.category.slug}/*.jpg"
            images = Dir[dir].count { |file| File.file?(file) }
            variant.image.attach(io: File.open("app/assets/images/#{product.subcategory.category.slug}/#{rand(1..images)}.jpg"), filename: 'empty.jpg',  identify: false)
        else
            p variant.errors
        end
    end
end