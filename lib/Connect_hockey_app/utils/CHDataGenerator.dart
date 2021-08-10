import 'package:connect_hockey/Connect_hockey_app/models/CHFeedModel.dart';
import 'package:connect_hockey/Connect_hockey_app/models/CHModel.dart';
import 'package:connect_hockey/Connect_hockey_app/models/CHTrainingModels.dart';
import 'CHImages.dart';
List<ChoosePlanModel> getSubscriptionChoosePlanList() {
  List<ChoosePlanModel> subscriptionChoosePlanList = List<ChoosePlanModel>();
  subscriptionChoosePlanList.add(ChoosePlanModel(title: 'Monthly', subTitle: '6,99\$ /month'));
  subscriptionChoosePlanList.add(ChoosePlanModel(title: 'Annual', subTitle: '4,99\$ /month'));
  subscriptionChoosePlanList.add(ChoosePlanModel(title: 'Free Code', subTitle: 'My organisation is paying for me. '));

  return subscriptionChoosePlanList;
}

List<CHLogModel> getList() {
  List<CHLogModel> list = List<CHLogModel>();
  CHLogModel model = CHLogModel();
  model.name = "Lower Body";
  model.Image = t6_ic_work1;
  model.type = "Beginner";
  model.info = "7 * 4 Challence";

  CHLogModel model1 = CHLogModel();
  model1.name = "Chest Intermediate";
  model1.info = "7 * 4 Challence";
  model1.type = "Intermediate";
  model1.Image = t6_ic_work2;

  CHLogModel model2 = CHLogModel();
  model2.name = "ABS Advanced";
  model2.info = "7 * 4 Challence";
  model2.type = "Advanced";
  model2.Image = t6_ic_work3;

  CHLogModel model3 = CHLogModel();
  model3.name = "Incline Dumbbell Fly";
  model3.info = "7 * 4 Challence";
  model3.type = "Intermediate";
  model3.Image = t6_ic_work1;

  CHLogModel model4 = CHLogModel();
  model4.name = "Lower Body";
  model4.info = "7 * 4 Challence";
  model4.type = "Beginner";
  model4.Image = t6_ic_work2;

  list.add(model);
  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);

  return list;
}

List<CHSlider> getSliders() {
  List<CHSlider> list = List<CHSlider>();
  CHSlider model1 = CHSlider();
  model1.name = "Superset Solider";
  model1.Image = t6_ic_work1;
  model1.info = "Full Body + weights";
  model1.duration = "12 min";

  CHSlider model2 = CHSlider();
  model2.name = "Superset Solider";
  model2.Image = t6_ic_work2;
  model2.info = "Full Body";
  model2.duration = "10 min";

  CHSlider model3 = CHSlider();
  model3.name = "Superset Solider";
  model3.Image = t6_ic_work1;
  model3.info = "Full Body + weights";
  model3.duration = "12 min";

  list.add(model1);
  list.add(model2);
  list.add(model3);
  return list;
}

List<CHLogModel> getData() {
  List<CHLogModel> list = List<CHLogModel>();
  CHLogModel model = CHLogModel();
  model.name = "   On-Ice   ";
  model.Image = 'images/theme6/goalie_icon.svg';

  CHLogModel model1 = CHLogModel();
  model1.name = "   Off-Ice  ";
  model1.Image = t6_ic_running;

  CHLogModel model2 = CHLogModel();
  model2.name = "Visualization";
  model2.Image = 'images/theme6/visualization_icon.svg';

  list.add(model);
  list.add(model1);
  list.add(model2);

  return list;
}

List<CHFeedModel> getListings() {
  List<CHFeedModel> list = List<CHFeedModel>();
  list.add(CHFeedModel("dumont_bouchard", "2021/02/04", "Win 3-2 Baie-Comeau", "Voltigeurs de Drummondville", t1_ic_user1));
  list.add(CHFeedModel("dumont_bouchard", "2021/01/04", "Lost 4-2 Lévis", "Voltigeurs de Drummondville", t1_ic_user2));
  list.add(CHFeedModel("dumont_bouchard", "2021/24/03", "Win 6-5 Québec", "Voltigeurs de Drummondville", t1_ic_user3));
  list.add(CHFeedModel("dumont_bouchard", "2021/23/03", "Lost 2-1 Drummondville", "Voltigeurs de Drummondville", t1_ic_user2));
  list.add(CHFeedModel("dumont_bouchard", "2021/15/03", "Win 4-1 Val d'Or", "Voltigeurs de Drummondville", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user1));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user2));
  list.add(CHFeedModel("John", "12 min ago", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "ceo", t1_ic_user3));
  return list;
}