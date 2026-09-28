import from models.course { Course }


walker:pub CreateCourse {
    has name: str,
        code: str,
        lecturer: str = "",
        reports: list[Course] = [];

    can create with Root entry {
        course = Course(
            name=self.name,
            code=self.code,
            lecturer=self.lecturer
        );

        root ++> course;
        report course;
    }
}


walker:pub ListCourses {
    can list with Root entry {
        report [-->][?:Course];
    }
}