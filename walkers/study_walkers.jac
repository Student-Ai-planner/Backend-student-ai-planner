import from models.study_session { StudySession }


walker:pub CreateStudySession {
    has title: str,
        course_code: str,
        date: str,
        start_time: str,
        duration_minutes: int,
        reports: list[StudySession] = [];

    can create with Root entry {
        session = StudySession(
            title=self.title,
            course_code=self.course_code,
            date=self.date,
            start_time=self.start_time,
            duration_minutes=self.duration_minutes
        );

        root ++> session;
        report session;
    }
}


walker:pub ListStudySessions {
    can list with Root entry {
        report [-->][?:StudySession];
    }
}