import from models.goal { Goal }


walker:pub CreateGoal {
    has title: str,
        description: str,
        target_date: str,
        reports: list[Goal] = [];

    can create with Root entry {
        goal = Goal(
            title=self.title,
            description=self.description,
            target_date=self.target_date
        );

        root ++> goal;
        report goal;
    }
}


walker:pub ListGoals {
    can list with Root entry {
        report [-->][?:Goal];
    }
}


walker:pub UpdateGoalProgress {
    has goal_id: str,
        progress: int;

    can update with Root entry {
        visit [-->];
    }

    can modify with Goal entry {
        if jid(here) == self.goal_id {
            here.progress = self.progress;

            if self.progress >= 100 {
                here.completed = True;
            }

            report here;
        }
    }
}
