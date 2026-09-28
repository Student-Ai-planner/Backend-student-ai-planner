node StudySession {
    has title: str,
        course_code: str,
        date: str,
        start_time: str,
        duration_minutes: int,
        completed: bool = False;
}