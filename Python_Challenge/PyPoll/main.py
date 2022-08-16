import os
import csv
from collections import OrderedDict

pypoll_csv = os.path.join('Resources','election_data.csv')

total_votes = 0
candidate_name = []
Candidates = [] #List the candidates after removing duplicates
candidate_vote_percentage =[]
candidate_votes=[]
winner = 0

with open(pypoll_csv,'r') as csvfile:
    csvreader =csv.reader(csvfile, delimiter=',')
    csv_header = next(csvreader)

    for row in csvreader:
        Voter_ID = int(row[0])
        County = str(row[1])
        Candidate = str(row[2])
        candidate_name.append(Candidate)
    Candidates = list(OrderedDict.fromkeys(candidate_name))
  
    for i in range(len(Candidates)):
            votes = 0
            for j in range(len(candidate_name)):
                if Candidates[i] == candidate_name[j]:
                    votes += 1
            candidate_votes.append(votes)
            total_votes += votes
       
    print("Election Results")
    print("---------------------------------")
    print(f"Total Votes: {total_votes}")
    print("---------------------------------")

    f = open("C:/Users/jeyae/OneDrive/Documents/Data Analytics/Homework/Python_Challenge/PyPoll/Analysis/Analysis.txt", "w")
    f.write("Election Results\n")
    f.write("---------------------------------\n")
    f.write(f"Total Votes: {total_votes}\n")
    f.write("---------------------------------\n")
    
    for i in range(len(Candidates)):
        vote_percentage = round((candidate_votes[i]/total_votes*100),2)
        candidate_vote_percentage.append(vote_percentage)
        print(f"{Candidates[i]} : {candidate_vote_percentage[i]}% ({candidate_votes[i]})")
        f.write(f"{Candidates[i]} : {candidate_vote_percentage[i]}% ({candidate_votes[i]})\n")

        winner_votes = max(candidate_votes)
        winner_index = candidate_votes.index(winner_votes)
        winner_name = Candidates[winner_index]
    print("---------------------------------")
    print (f"Winner: {winner_name}")
    print("---------------------------------")
    f.write("---------------------------------\n")
    f.write(f"Winner: {winner_name}\n")
    f.write("---------------------------------\n")
