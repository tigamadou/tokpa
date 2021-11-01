module ApplicationHelper

    def get_subcategories_pages(categeory, page)
        return Subcategory.where('category_id = ?', categeory.id).limit(10).offset((page-1)*10)
    end

    


end