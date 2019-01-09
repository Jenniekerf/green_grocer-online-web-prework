def consolidate_cart(cart)
  new_cart = {}
  cart.each do |hash|
    hash.each do |name, describe|
      if new_cart[name]
        new_cart[name][:count] += 1 
      else 
        new_cart[name] = describe
        new_cart[name][:count] =1
    end
  end
end
new_cart
end



def apply_coupons(cart, coupons)
      
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end


