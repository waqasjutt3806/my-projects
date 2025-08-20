  const addBtn = document.getElementById("add-btn");
  const taskInput = document.getElementById("task-input");
  const taskList = document.getElementById("task-list");

  addBtn.addEventListener("click", addTask);
  taskInput.addEventListener("keypress", function(e) {
    if (e.key === "Enter") addTask();
  });

  function addTask() {
    const taskText = taskInput.value.trim();
    if (taskText === "") return;

    const li = document.createElement("li");

    const checkbox = document.createElement("input");
    checkbox.type = "checkbox";

    const span = document.createElement("span");
    span.className = "task-text";
    span.textContent = taskText;

    checkbox.addEventListener("change", function () {
      li.classList.toggle("completed", checkbox.checked);
    });

    const delBtn = document.createElement("button");
    delBtn.textContent = "Delete";
    delBtn.className = "delete-btn";
    delBtn.addEventListener("click", function () {
      li.style.opacity = "0";
      setTimeout(() => li.remove(), 300);
    });

    li.appendChild(checkbox);
    li.appendChild(span);
    li.appendChild(delBtn);

    taskList.appendChild(li);
    taskInput.value = "";
  }