class OrderDetailsController < ApplicationController
    def OrderDetails
        @a=Order.find(params[:id])
    end

    def CreateNewOrder
        @order =OrderDetail.new
      
    end
    
    def create
        @order = OrderDetail.new(order_params)
        @order.user_id=current_user.id
        @order.order_id=params[:id]
        
    
    
        if @order.save!
          redirect_to @order
        else
          render :CreateNewOrder
        end
    end
    
    private
        def order_params
          params.permit(:item, :user_id,:order_id,:amount ,:price , :comment)
        end
end
