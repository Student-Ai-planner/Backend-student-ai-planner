node Goal {
    has title: str,
        description: str,
        target_date: str,
        progress: int = 0,
        completed: bool = False;
}