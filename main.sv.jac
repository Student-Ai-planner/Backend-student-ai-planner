"""Student AI Planner backend server."""

import from walkers.task_walkers {
    CreateTask,
    ListTasks,
    CompleteTask
}

import from walkers.course_walkers {
    CreateCourse,
    ListCourses
}

import from walkers.assignment_walkers {
    CreateAssignment,
    ListAssignments,
    CompleteAssignment
}

import from walkers.study_walkers {
    CreateStudySession,
    ListStudySessions
}

import from walkers.goal_walkers {
    CreateGoal,
    ListGoals,
    UpdateGoalProgress
}

import from planning.agent { GeneratePlan }


