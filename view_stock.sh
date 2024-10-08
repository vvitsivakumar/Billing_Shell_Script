#!/bin/bash

# Source the current_stock.sh file to get the current product details
source ./current_stock.sh  # Ensure current_stock.sh exists in the same directory

# Function to display available stock
display_available_stock() {
    echo "Available Stock:"
    echo "-------------------------------------------------"
    echo "Product     Price (Rs)     Available Quantity"
    echo "-------------------------------------------------"
    echo "1. $product1     Rs $price1         $quantity1"
    echo "2. $product2     Rs $price2         $quantity2"
    echo "3. $product3     Rs $price3         $quantity3"
    echo "-------------------------------------------------"
}

# Call the function to display the stock
display_available_stock
