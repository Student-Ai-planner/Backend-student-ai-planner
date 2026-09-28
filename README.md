# Student AI Planner API

This Jac API service provides persistent graph-backed endpoints for tasks, courses, assignments, study sessions, goals, and study-plan generation. It is based on the backend in `~/Desktop/jac project/planner_backend`.

## Run locally

Install Jac in the active Python environment, then run from this directory:

```powershell
jac start --dev main.sv.jac --no_client
```

The service listens on `http://localhost:8000` by default. Jac exposes the imported public walkers as `POST /walker/<WalkerName>` endpoints and provides interactive API docs at `/docs`.

## Endpoints

All endpoints accept and return Jac's standard response envelope. Created/listed/updated records are available in `data.result` or `data.reports`.

| Operation | Walker | Request fields |
| --- | --- | --- |
| Create task | `CreateTask` | `title`, `description`, `priority` |
| List tasks | `ListTasks` | none |
| Complete task | `CompleteTask` | `task_id` |
| Create course | `CreateCourse` | `name`, `code`, optional `lecturer` |
| List courses | `ListCourses` | none |
| Create assignment | `CreateAssignment` | `title`, `description`, `course_code`, `due_date`, `priority` |
| List assignments | `ListAssignments` | none |
| Complete assignment | `CompleteAssignment` | `assignment_id` |
| Create study session | `CreateStudySession` | `title`, `course_code`, `date`, `start_time`, `duration_minutes` |
| List study sessions | `ListStudySessions` | none |
| Create goal | `CreateGoal` | `title`, `description`, `target_date` |
| List goals | `ListGoals` | none |
| Update goal progress | `UpdateGoalProgress` | `goal_id`, `progress` |
| Generate prioritized plan | `GeneratePlan` | `goal`, optional `days_remaining` |

Example:

```powershell
Invoke-RestMethod -Method Post -Uri http://localhost:8000/walker/CreateTask `
  -ContentType 'application/json' `
  -Body '{"title":"Review lecture notes","description":"Week 2","priority":"high"}'
```

The graph is stored by Jac under this project directory's `.jac` data area. The API currently uses Jac's shared guest graph, so this starter backend is intended for local development and demo use rather than multi-user production accounts.

## Web planner connection

The planner client uses the current site origin for API requests. `web/main.jac` imports the backend walkers so the Jac server registers their `/walker/...` routes alongside the site. If the API runs as a separate process, configure its base URL in the browser before opening the planner:

```js
localStorage.setItem("planner_api_url", "http://localhost:8000");
```

The Tasks page supports listing, creation, and completion; Goals supports listing, creation, and progress updates; AI Planner requests prioritized task and assignment recommendations. These views show API errors when the service is unavailable.
