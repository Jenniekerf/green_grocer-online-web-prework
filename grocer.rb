def consolidate_cart(cart)
  cart.each_with_object({}) do |item, result|
    item.each do |type, attributes|
      if result[type]
        attributes[:count] += 1
      else
        attributes[:count] = 1
        result[type] = attributes
      end
    end
  end
end



def apply_coupons(cart, coupons)
  new_cart = cart
coupons.each do |coupon|
    name = coupon[:item] 
    num_of_c = coupon[:num]
    if cart.include?(name) && cart[name][:count] >= num_of_c
       new_cart[name][:count] -= num_of_c
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:count] += 1
       else
         new_cart["#{name} W/COUPON"] = {
           :price => coupon[:cost],
           :clearance => new_cart[name][:clearance],
           :count => 1
         }
       end
     end
   end
   new_cart
end




def apply_clearance(cart)
  new_cart = {}
  cart.each do |name, hash|
    if hash[:clearance] 
      new_cart[name][:price] = (cart[name][:price] * 0.8).round(2) 
    end 
  end 
  new_cart
end

def checkout(cart, coupons)
  # code here
end


