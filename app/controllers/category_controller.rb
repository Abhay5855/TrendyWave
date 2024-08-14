class CategoryController < ApplicationController

# GET /categories or /categories.json
def index
 @category = Categorie.all
end

# GET /categories/1 or /categories/1.json


# GET /categories/1/edit
def edit 
end


def show
end

def new 
@category = Category.new
end

# POST /categories or /categories.json
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
def update 
@category = Category.update(params[:id])
respond_to do |format|
if @category.update!
  format.json {render :show, status: :ok}
else
format.json {render :edit, notice: "Failed to edit the category"}
end
end
end

#Delete All
def delete_all

@category = Category.all

respond_to do |format|

if @category.delete_all!
format.html {notice: "All Categories successfully deleted"}
format.json {head :no_content}
end
format.html {notice: "Unable to delete the post"}
end

# DELETE /categories/1 or /categories/1.json
def delete
@category = Category.find(params[:id])
respond_to do |format|
if @category.destroy!
format.html {notice: "Category successfully deleted"}
format.json {head :no_content}
else
format.html {notice: "Unable to delete the post"}
end
end
end


# Only allow a list of trusted parameters through.
private

def category_params 

params.require(:category).permit(:category_name, :description)

end