#!/bin/bash

# File to store the tasks
TODO_FILE="todo.txt"

# Function to display the menu
display_menu() {
  echo "Simple To-Do List"
  echo "=================="
  echo "1. Add a Task"
  echo "2. View Tasks"
  echo "3. Remove a Task"
  echo "4. Exit"
  echo -n "Please choose an option (1-4): "
}

# Function to add a task
add_task() {
  echo -n "Enter the task description: "
  read task
  echo "$task" >> "$TODO_FILE"
  echo "Task added!"
}

# Function to view tasks
view_tasks() {
  if [ -s "$TODO_FILE" ]; then
    echo "To-Do List:"
    nl -w2 -s'. ' "$TODO_FILE"
  else
    echo "No tasks to display."
  fi
}

# Function to remove a task
remove_task() {
  if [ -s "$TODO_FILE" ]; then
    echo "To-Do List:"
    nl -w2 -s'. ' "$TODO_FILE"

    echo -n "Enter the task number to remove: "
    read task_number

    # Check if the task number is valid
    total_tasks=$(wc -l < "$TODO_FILE")
    if [ "$task_number" -ge 1 ] && [ "$task_number" -le "$total_tasks" ]; then
      # Use sed to remove the task
      sed -i "${task_number}d" "$TODO_FILE"
      echo "Task removed!"
    else
      echo "Invalid task number!"
    fi
  else
    echo "No tasks to remove."
  fi
}

# Main program loop
while true; do
  display_menu
  read option

  case $option in
    1)
      add_task
      ;;
    2)
      view_tasks
      ;;
    3)
      remove_task
      ;;
    4)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid option. Please choose a number between 1 and 4."
      ;;
  esac
done

