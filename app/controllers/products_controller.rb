class ProductsController < ApplicationController

    def index
        if params[:sort_params]
            @products = Product.order(params[:sort_params])
        else
            @products = Product.all
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        product = Product.new(product_params)

        if product.save
            flash[:notice] = "#{product.name} added!"
            redirect_to :root
        else
            flash[:errors] = product.errors.full_messages
            redirect_to :new_product
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        product = Product.find(params[:id])

        if product.update(product_params)
            flash[:notice] = "#{product.name} updated!"
            redirect_to :root
        else
            flash[:errors] = product.errors.full_messages
            redirect_to :edit_product
        end
    end

    def destroy
        product = Product.find(params[:id])
        if product.destroy
            flash[:notice] = "#{product.name} deleted!"
            redirect_to :root
        else
            flash[:errors] = product.errors.full_messages
            redirect_to :root
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :price)
    end
end
