import 'package:chalenge/ui/components/e_appbar.dart';
import 'package:chalenge/ui/components/e_scaffold.dart';
import 'package:chalenge/ui/components/tappable.dart';
import 'package:chalenge/ui/themes/fond_and_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AboutNewsPage extends StatelessWidget {
  final String title;
  final String descriptionHeader;
  final String descriptionBody;
  final String descriptionFooter;
  final String namazQuoter;
  final String author;

  const AboutNewsPage({Key key, this.title, this.descriptionHeader, this.author, this.descriptionBody, this.descriptionFooter, this.namazQuoter}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AScaffold(
      appBar: AAppBar(
        leadingIcon: Container(
          padding: EdgeInsets.only(left: 5),
          child: Tappable(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: (){
                Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
        title: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/star.png',
                  width: 30,
                  height: 30,
                  color: Thm.of(context).acceptedColor,
                )),
            Text(
              'UMMA PAY',
              style: Thm.of(context).toolbarTitle,
            ),
          ],
        ),
      ),
      body: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Expanded(
             child: CustomScrollView(
               slivers: <Widget>[
                 SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text('Время намаза'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.42,
                              height: 40,
                              child: StreamBuilder(
                                stream: Firestore.instance.collection('test').snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) return Text('Загрузка..');
                                  return ListView.separated(
                                    separatorBuilder: (_, i) => SizedBox(width: 15,),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) =>
                                        _timeListItem(context, snapshot.data.documents[index]),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                          child: Column(

                            children: <Widget>[
                              Container(
                                child: Text(title, style: Thm.of(context).contentBodyTitleBold, textAlign: TextAlign.center,),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18.0),
                                  child: Image.asset(
                                    'assets/unnamed.jpg',
                                    height: 150,
                                    width: MediaQuery.of(context).size.width / 1,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text('Автор: ', style: Thm.of(context).author,),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(author, style: Thm.of(context).author,),
                                  ),
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(descriptionHeader, style: Thm.of(context).contentBodyTitleSecondary,),
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(descriptionBody, style: Thm.of(context).contentBodyPrimary,),
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(descriptionFooter, style: Thm.of(context).contentBodyPrimary,),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text('В коране сказано: ', style: Thm.of(context).contentBodyPrimary,),
                                  ),
                                  Container()
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(namazQuoter, style: Thm.of(context).description,),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                 )
               ],
             ),
           ),


          ],
        ),
      ),
    );
  }

  Widget _timeListItem(BuildContext context, DocumentSnapshot document) {
    return Row(
      children: <Widget>[
        Container(
          decoration: document.documentID == 'cBLyYysaGaQoRiQTO7eq'
              ? BoxDecoration(
            color: Thm.of(context).acceptedColor,
            border: Border.all(
                width: 3.0, color: Thm.of(context).acceptedColor),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ) : null,
          child: Text(
            document['time'],
          ),
        ),
      ],
    );
  }
}
