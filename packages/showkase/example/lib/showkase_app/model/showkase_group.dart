class ShowkaseGroup<SC> {
  final String name;
  final List<SC> items;

  ShowkaseGroup(
    this.name, {
    List<SC> items,
  }) : this.items = items ?? const [];
}
