import os
import csv
import statistics

pybank_csv = os.path.join('Resources','budget_data.csv')

total_months = 0
total_profit_losses = 0
greatest_increase_profits = 0
greatest_decrease_profits = 0
greatest_profit_month =''
greatest_loss_month = ''
average_change = 0
profit_loss_data = [] #To hold all the profit/loss data from the spreadsheet
changes_each_month = [] #To hold all the changes between each month

with open(pybank_csv, 'r') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    csv_header = next(csvreader)
    for row in csvreader:
        #set names 
        budget_date = str(row[0])
        profit_losses = int(row[1])

        total_months += 1
        total_profit_losses += profit_losses
        profit_loss_data.append(profit_losses) #Add the data from spreadsheet to the list

for i in range(len(profit_loss_data)-1):
    change = (profit_loss_data[i+1] - profit_loss_data[i])
    changes_each_month.append(change)   #Add the change between the 2 consecutive months in the list

greatest_increase_profits = max(changes_each_month)    
greatest_decrease_profits = min(changes_each_month) 
average_change = round(statistics.mean(changes_each_month),2)

print("Financial Analysis")
print("-----------------------------------------------")

print(f"Total Months: {total_months}")
print(f"Total: $ {total_profit_losses}")
print(f"Average Change is: ${average_change}")
print(f"Greatest Increase in Profits: {greatest_profit_month}   (${greatest_increase_profits})")
print(f"Greatest Decrease in Profits: {greatest_loss_month}   (${greatest_decrease_profits})")

f = open("C:/Users/jeyae/OneDrive/Documents/Data Analytics/Homework/Python_Challenge/PyBank/Analysis/Analysis.txt", "w")
f.write("Financial Analysis\n")
f.write("-----------------------------------------------\n")
f.write(f"Total Months: {total_months}\n")
f.write(f"Total: $ {total_profit_losses}\n")
f.write(f"Average Change is: ${average_change}\n")
f.write(f"Greatest Increase in Profits: {greatest_profit_month}    (${greatest_increase_profits})\n")
f.write(f"Greatest Decrease in Profits: {greatest_loss_month}    (${greatest_decrease_profits})\n")