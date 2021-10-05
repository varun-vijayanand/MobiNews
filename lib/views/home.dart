import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:updt/fetcher/data.dart';
import 'package:updt/fetcher/news.dart';
import 'package:updt/models/article_model.dart';
import 'package:updt/models/categorymodel.dart';
import 'package:updt/views/article_view.dart';
import 'package:updt/views/category_news.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // ignore: deprecated_member_use
  List<ArticleModel> articles = [];
  List<CategoryModel> categories = [];
  // ignore: unused_field
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(55.0),
      child: AppBar(
        backgroundColor:Colors.white,
        title:Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' Mobi', style: TextStyle(color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text('News', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ]
                ),
            ],
          ),
        ),
        shadowColor: Colors.grey.shade400,
        elevation: 5.0,
      ),
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(children: [

            //SizedBox(height: 15),
      
            ///CATEGORIES
            
           Container(               
              child: Container(
                height:95,
                child: ListView.builder(
                  padding: EdgeInsets.only(top:25, bottom: 10, left: 10),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal ,
                  itemBuilder: (context, index){
                    return CategoryCard(
                      imageUrl: categories[index].imageUrl,
                      categoryname: categories[index].CategoryName,
                    );
                  }
                ),
              ),
            ),
      
            
            ///BLOGS
            
            Container(
                height: 630,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left:20, top: 20, bottom: 20),
                    itemCount: articles.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
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
          ],),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final imageUrl, categoryname;
  const CategoryCard({ Key? key, this.imageUrl, this.categoryname }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryNews(
          category: categoryname.toString().toLowerCase(),
        )));
      },
      child: Container(
        //padding: EdgeInsets.all(7),
        margin: EdgeInsets.only(right: 16),
        child:
        Container(
           decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black26,
                  //border: Border.all(color: Colors.grey.shade50),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 7.0,
                    spreadRadius: 2.0
                  ), 
                ]
                ) ,
          child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,)
                ),
                
                Container(
                  alignment: Alignment.center,
                  width: 120, height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black26,
                  ) ,
                  child:  Text(categoryname, style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
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
        height: 600,
        width: 350,
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
        margin: EdgeInsets.only(right: 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(imageUrl!)
                ),
              SizedBox( height: 15), 
              Text(title!, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Colors.black87,
              ),
              ),
              SizedBox( height: 15), 
              Text(desc!, style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade700,),
                ),
            ],
          ),
        ),
      ),
    );
  }
}