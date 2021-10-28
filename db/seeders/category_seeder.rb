def create_categories
    categories = [
        'Agriculture & Food',
        'Apparel,Textiles & Accessories',
        'Auto & Transportation',
        'Bags, Shoes & Accessories',
        'Electronics',
        'Electrical Equipment, Components & Telecoms',
        'Gifts, Sports & Toys',
        'Health & Beauty',
        'Home, Lights & Construction',
        'Machinery, Industrial Parts & Tools',
        'Metallurgy, Chemicals, Rubber & Plastics',
        'Packaging, Advertising & Office'
    ]
    puts 'seeding categories...'
    categories.each do |category|
        Category.create(name: category, slug: category.parameterize)
    end
    puts "#{categories.count} categories seeded!"
end