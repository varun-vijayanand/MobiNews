import 'package:flutter/material.dart';
import 'package:updt/fetcher/news.dart';
import 'package:updt/main.dart';
import 'package:updt/models/article_model.dart';
import 'package:updt/models/categorymodel.dart';
import 'package:updt/views/article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  const CategoryNews({ Key? key,required this.category }) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = [];
  List<CategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    geCategoryNews();
  }

  geCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(55.0),
      child: AppBar(
        backgroundColor: primaryColor,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Mobi', style: TextStyle(color: Colors.blue, fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text('News', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ]
          ),
        actions: [
          Opacity(opacity: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.save),
          ),
          )
        ],
        elevation: 0.0,
      ),
      ),
      body:_loading ? Center(
        child: Container(child: 
        CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [

            SizedBox(height: 12),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10.0,
                    spreadRadius: 1.0
                  ), 
                ]
              ),
              child:
                  Text(widget.category.toUpperCase(),textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold
                      ),),
                  
            ),

            SizedBox(height: 5,),

            Container(
                  padding: EdgeInsets.only(top: 15),
                  child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return BlogTile(
                        imageUrl: articles[index].urlToImage, 
                        title: articles[index].title, 
                        desc: articles[index].description,
                        url: articles[index].url
                      );
                    })
                ),
          ],)
        ),
      ),
      
    );
  }
}

class BlogTile extends StatelessWidget {
  final String? imageUrl, title, desc, url;
  const BlogTile({ Key? key, required this.imageUrl, required this.title, required this.desc, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    ( onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=> ArticleView(
          blogUrl: url,
        )
        )
       );
    },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(20)),
           boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10.0,
                    spreadRadius: 5.0
                  ), 
                ]
        ),
        margin: EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(imageUrl!)
                ),
              SizedBox( height: 8), 
              Text(title!, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black87,
              ),
              ),
              SizedBox( height: 8), 
              Text(desc!, style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
