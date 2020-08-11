import 'package:chalenge/ui/components/e_appbar.dart';
import 'package:chalenge/ui/components/e_scaffold.dart';
import 'package:chalenge/ui/components/tappable.dart';
import 'package:chalenge/ui/news/about_news_page.dart';
import 'package:chalenge/ui/themes/fond_and_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AScaffold(
        appBar: AAppBar(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
            Expanded(
              child: StreamBuilder(
                stream: Firestore.instance.collection('news').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Text('Загрузка..');
                  return ListView.builder(
                    itemExtent: 140,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) =>
                        _newsListItem(context, snapshot.data.documents[index]),
                  );
                },
              ),
            ),
          ],
        ));
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

  Widget _newsListItem(BuildContext context, DocumentSnapshot document) {
    return Tappable(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutNewsPage(
              title: document['title'],
              author: document['author'],
              descriptionHeader: document['description'],
            descriptionBody: document['description_body'],
            descriptionFooter: document['description_footer'],
            namazQuoter: document['namaz_quote'],
          )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(
                  'assets/unnamed.jpg',
                  width: 110.0,
                  height: 140.0,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          document['title'],
                          style: Thm.of(context).contentBodyPrimary,
                          maxLines: 2,
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          document['subtitle'],
                          style: Thm.of(context).contentBodySecondary,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.75,
                      child: Row(
                        children: <Widget>[
                          Container(
                              child: Text(document['author'],
                                  style: Thm.of(context).contentBodySecondaryLess)),
                          Spacer(),
                          Container(
                              child: Text(document['date'],
                                  style: Thm.of(context).contentBodySecondaryLess)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
