"""Agentic planning workflow for the Student AI Planner."""

import from models.task { Task }
import from models.assignment { Assignment }
import from planning.planner {
    calculate_score,
    classify_score
}


node PlanningDecision {
    has title: str,
        reason: str,
        priority: str,
        score: int;
}


walker:pub GeneratePlan {
    has goal: str,
        days_remaining: int = 1,
        reports: list[PlanningDecision] = [];

    can start with Root entry {
        visit [-->];
    }

    can inspect_task with Task entry {
        if here.completed == False {
            score = calculate_score(
                here.priority,
                self.days_remaining
            );

            level = classify_score(score);

            decision = PlanningDecision(
                title=here.title,
                reason="Prioritized for your goal: " + self.goal + ".",
                priority=level,
                score=score
            );

            report decision;
        }
    }

    can inspect_assignment with Assignment entry {
        if here.completed == False {
            score = calculate_score(
                here.priority,
                self.days_remaining
            );

            level = classify_score(score);

            decision = PlanningDecision(
                title=here.title,
                reason="Assignment prioritized for your goal: " + self.goal + ".",
                priority=level,
                score=score
            );

            report decision;
        }
    }
}
