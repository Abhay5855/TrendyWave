class CategoryController < ApplicationController

# GET /categories or /categories.json

def index

total_records = Category.count
processed_records = 0
puts "Total categories: #{total_records}"

Category.find_each(batch_size: 500) do |category|

puts "Processing category: #{category.category_name}"

processed_records += 1

puts "Processed #{processed_records} out of #{total_records} categories" if processed_records % 100 == 0

end

end



# GET /categories/1 or /categories/1.json


# GET /categories/1/edit


# POST /categories or /categories.json


def show
end

def new 

@category = Category.new

end


def create(category_params)

@category = Category.new(category_params)

respond_to do |format| 


  if @category.save

     format.json {render :show}
     puts "Category saved"
  
  else
     
    puts "Failed to save the category"
  
  end

  
end


end


# PATCH/PUT /categories/1 or /categories/1.json



# DELETE /categories/1 or /categories/1.json


# Only allow a list of trusted parameters through.


private

def category_params 

params.require(:category).permit(:category_name, :description)

end