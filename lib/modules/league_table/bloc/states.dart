abstract class LeagueTableStates {}

class LeagueTableInitState extends LeagueTableStates{}
class LeagueTableLoadingState extends LeagueTableStates{}
class LeagueTableSuccessState extends LeagueTableStates{}
class LeagueTableErrorState extends LeagueTableStates{
  var error;
  LeagueTableErrorState(this.error);
}
class LeagueTableMorePostsState extends LeagueTableStates{}
class LeagueTableLoadingMoreState extends LeagueTableStates{}
