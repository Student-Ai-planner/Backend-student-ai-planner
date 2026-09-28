import from models.assignment { Assignment }


walker:pub CreateAssignment {
    has title: str,
        description: str,
        course_code: str,
        due_date: str,
        priority: str,
        reports: list[Assignment] = [];

    can create with Root entry {
        assignment = Assignment(
            title=self.title,
            description=self.description,
            course_code=self.course_code,
            due_date=self.due_date,
            priority=self.priority
        );

        root ++> assignment;
        report assignment;
    }
}


walker:pub ListAssignments {
    can list with Root entry {
        report [-->][?:Assignment];
    }
}


walker:pub CompleteAssignment {
    has assignment_id: str;

    can complete with Root entry {
        visit [-->];
    }

    can update with Assignment entry {
        if jid(here) == self.assignment_id {
            here.completed = True;
            report here;
        }
    }
}