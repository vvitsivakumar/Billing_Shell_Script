#!/bin/bash
source current_stock.sh

# Function to display available products
display_available_products() {
    echo "Available Products:"
    echo "-------------------------------------------------"
    echo "Product     Cost (Rs)  Available Qty"
    echo "-------------------------------------------------"
    
    echo "$product1     Rs $price1       $quantity1"
    echo "$product2     Rs $price2       $quantity2"
    echo "$product3     Rs $price3       $quantity3"
    
    echo "-------------------------------------------------"
}

# Display available products to the user
display_available_products

# Initialize the total bill to zero
total_bill=0
# Initialize quantities purchased
quantity1_purchased=0
quantity2_purchased=0
quantity3_purchased=0

# Get user input for Apple
while true; do
    read -p "Enter quantity for $product1 (0 to skip, max $quantity1): " quantity1_input
    if ! [[ "$quantity1_input" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
    elif [ "$quantity1_input" -gt "$quantity1" ]; then
        echo "Sorry, we only have $quantity1 of $product1 available. Please enter a valid quantity."
    elif [ "$quantity1_input" -lt 0 ]; then
        echo "Please enter a non-negative number."
    elif [ "$quantity1_input" -eq 0 ]; then
        echo "You chose not to buy $product1."
        break
    else
        quantity1_purchased=$quantity1_input
        item_total=$((quantity1_purchased * price1))
        total_bill=$((total_bill + item_total))
        quantity1=$((quantity1 - quantity1_purchased))
        break
    fi
done

# Get user input for Orange
while true; do
    read -p "Enter quantity for $product2 (0 to skip, max $quantity2): " quantity2_input
    if ! [[ "$quantity2_input" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
    elif [ "$quantity2_input" -gt "$quantity2" ]; then
        echo "Sorry, we only have $quantity2 of $product2 available. Please enter a valid quantity."
    elif [ "$quantity2_input" -lt 0 ]; then
        echo "Please enter a non-negative number."
    elif [ "$quantity2_input" -eq 0 ]; then
        echo "You chose not to buy $product2."
        break
    else
        quantity2_purchased=$quantity2_input
        item_total=$((quantity2_purchased * price2))
        total_bill=$((total_bill + item_total))
        quantity2=$((quantity2 - quantity2_purchased))
        break
    fi
done

# Get user input for Banana
while true; do
    read -p "Enter quantity for $product3 (0 to skip, max $quantity3): " quantity3_input
    if ! [[ "$quantity3_input" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
    elif [ "$quantity3_input" -gt "$quantity3" ]; then
        echo "Sorry, we only have $quantity3 of $product3 available. Please enter a valid quantity."
    elif [ "$quantity3_input" -lt 0 ]; then
        echo "Please enter a non-negative number."
    elif [ "$quantity3_input" -eq 0 ]; then
        echo "You chose not to buy $product3."
        break
    else
        quantity3_purchased=$quantity3_input
        item_total=$((quantity3_purchased * price3))
        total_bill=$((total_bill + item_total))
        quantity3=$((quantity3 - quantity3_purchased))
        break
    fi
done

# Display the bill summary
echo "-------------------------------------------------"
echo "Bill Summary:"
echo "-------------------------------------------------"
echo "Product     Quantity     Cost (Rs)      Total (Rs)"
echo "-------------------------------------------------"

if [ "$quantity1_purchased" -gt 0 ]; then
    item_total=$((quantity1_purchased * price1))
    printf "%-15s %-10d Rs %-10d Rs %-10d\n" "$product1" "$quantity1_purchased" "$price1" "$item_total"
fi
if [ "$quantity2_purchased" -gt 0 ]; then
    item_total=$((quantity2_purchased * price2))
    printf "%-15s %-10d Rs %-10d Rs %-10d\n" "$product2" "$quantity2_purchased" "$price2" "$item_total"
fi
if [ "$quantity3_purchased" -gt 0 ]; then
    item_total=$((quantity3_purchased * price3))
    printf "%-15s %-10d Rs %-10d Rs %-10d\n" "$product3" "$quantity3_purchased" "$price3" "$item_total"
fi

echo "-------------------------------------------------"
printf "Total Bill: Rs %d\n" "$total_bill"
echo "-------------------------------------------------"
echo "Thank You !!!"

# Update the current_stock.sh file with the new available quantities
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
