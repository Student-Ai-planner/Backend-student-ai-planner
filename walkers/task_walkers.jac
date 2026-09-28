import from models.task { Task }


walker:pub CreateTask {
    has title: str,
        description: str,
        priority: str,
        reports: list[Task] = [];

    can create with Root entry {
        task = Task(
            title=self.title,
            description=self.description,
            priority=self.priority
        );

        root ++> task;
        report task;
    }
}


walker:pub ListTasks {
    can list with Root entry {
        report [-->][?:Task];
    }
}


walker:pub CompleteTask {
    has task_id: str;

    can complete with Root entry {
        visit [-->];
    }

    can update with Task entry {
        if jid(here) == self.task_id {
            here.completed = True;
            report here;
        }
    }
}