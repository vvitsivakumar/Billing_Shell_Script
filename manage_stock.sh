#!/bin/bash

# Source the stock file to get current product data
source current_stock.sh

# Function to display current stock and prices
display_current_stock() {
    echo "Current Stock:"
    echo "-------------------------------------------------"
    echo "Product     Price (Rs)  Available Qty"
    echo "-------------------------------------------------"
    
    echo "$product1       $price1        $quantity1"
    echo "$product2       $price2        $quantity2"
    echo "$product3       $price3        $quantity3"
    
    echo "-------------------------------------------------"
}

# Display current stock and prices to the seller
display_current_stock

# Function to update stock and prices
update_stock() {
    # Update quantity for each product
    read -p "Enter quantity to add for $product1 (current: $quantity1, 0 to skip): " new_quantity1
    read -p "Enter quantity to add for $product2 (current: $quantity2, 0 to skip): " new_quantity2
    read -p "Enter quantity to add for $product3 (current: $quantity3, 0 to skip): " new_quantity3
    
    # Update price for each product
    read -p "Enter amount to add for $product1 price (current: $price1, 0 to skip): " add_price1
    read -p "Enter amount to add for $product2 price (current: $price2, 0 to skip): " add_price2
    read -p "Enter amount to add for $product3 price (current: $price3, 0 to skip): " add_price3

    # Update quantities by adding the new input only if it's a valid number and not zero
    if [[ "$new_quantity1" =~ ^[0-9]+$ && "$new_quantity1" -ne 0 ]]; then
        quantity1=$((quantity1 + new_quantity1))
    fi
    
    if [[ "$new_quantity2" =~ ^[0-9]+$ && "$new_quantity2" -ne 0 ]]; then
        quantity2=$((quantity2 + new_quantity2))
    fi

    if [[ "$new_quantity3" =~ ^[0-9]+$ && "$new_quantity3" -ne 0 ]]; then
        quantity3=$((quantity3 + new_quantity3))
    fi

    # Update prices by adding the new input only if it's a valid number and not zero
    if [[ "$add_price1" =~ ^[0-9]+$ && "$add_price1" -ne 0 ]]; then
        price1=$((price1 + add_price1))
    fi
    
    if [[ "$add_price2" =~ ^[0-9]+$ && "$add_price2" -ne 0 ]]; then
        price2=$((price2 + add_price2))
    fi

    if [[ "$add_price3" =~ ^[0-9]+$ && "$add_price3" -ne 0 ]]; then
        price3=$((price3 + add_price3))
    fi

    echo "Stock and prices updated successfully."
}

# Update the stock and prices
update_stock

# Save the updated stock and prices back to current_stock.sh
{
    echo "# Define products and their prices"
    echo "product1=\"$product1\""
    echo "price1=$price1"
    echo "quantity1=$quantity1"
    echo ""
    echo "product2=\"$product2\""
    echo "price2=$price2"
    echo "quantity2=$quantity2"
    echo ""
    echo "product3=\"$product3\""
    echo "price3=$price3"
    echo "quantity3=$quantity3"
} > current_stock.sh

# Confirm the stock and prices have been updated
echo "Contents of current_stock.sh after update:"
cat current_stock.sh

