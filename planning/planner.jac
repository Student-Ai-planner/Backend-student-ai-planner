"""Core planning logic for the Student AI Planner."""


def priority_weight(priority: str) -> int {
    if priority == "high" {
        return 3;
    }

    if priority == "medium" {
        return 2;
    }

    return 1;
}


def urgency_weight(days_remaining: int) -> int {
    if days_remaining <= 0 {
        return 4;
    }

    if days_remaining <= 1 {
        return 3;
    }

    if days_remaining <= 3 {
        return 2;
    }

    return 1;
}


def calculate_score(
    priority: str,
    days_remaining: int
) -> int {
    return (
        priority_weight(priority) * 10
        + urgency_weight(days_remaining) * 10
    );
}


def classify_score(score: int) -> str {
    if score >= 60 {
        return "urgent";
    }

    if score >= 40 {
        return "important";
    }

    return "normal";
}