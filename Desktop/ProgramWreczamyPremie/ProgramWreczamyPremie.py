import requests
import json

r = requests.get("https://jsonplaceholder.typicode.com/todos")

def count_task_frequency(tasks):
    completedTasksFrequencyByUser = dict()
    for entry in tasks:
        if (entry["completed"] == True):
            try:
                completedTasksFrequencyByUser[entry['userId']] += 1
            except KeyError:
                completedTasksFrequencyByUser[entry['userId']] = 1

    return completedTasksFrequencyByUser

def users_with_top_completed_tasks(completedTasksFrequencyByUser):
    usersIdWithMaxCompletedAmountOfTasks = []

    maxAmountOfCompletedTask = max(completedTasksFrequencyByUser.values())
                

    for userId, numberOfCompletedTask in completedTasksFrequencyByUser.items():         
        if (numberOfCompletedTask == maxAmountOfCompletedTask):
            usersIdWithMaxCompletedAmountOfTasks.append(userId)

    return usersIdWithMaxCompletedAmountOfTasks

try:
    tasks = r.json()
except json.decoder.JSONDecodeError:
    print("Niepoprawny format")
else:
     completedTasksFrequencyByUser = count_task_frequency(tasks)
     usersWithTopCompletedTasks = users_with_top_completed_tasks(completedTasksFrequencyByUser)
     print( 'Wreczamy premie userowi o ID: ', usersWithTopCompletedTasks)


