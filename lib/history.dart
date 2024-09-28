import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  final int product;
  List data;
  List pressCounts;
  final int index;
  late final int counter;
  final String currentTime;
  final String selectedItem; // Add this parameter
  History({required this.product, required this.data, required this.index, required this.counter, required this.pressCounts, required this.selectedItem, required this.currentTime});


  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with TickerProviderStateMixin{

  int _counter = 0;
  List<int> _savedCounts = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _saveCount() {
    setState(() {
      _savedCounts.add(_counter);
      _counter = 0;
    });
  }

  TabController? _tabController;
  int? totalCount;
  int? totalCounts;


  void _deleteItem(int index) {
    setState(() {
      widget.data.removeAt(index);
      totalCount = widget.data.length; // Update total count
    });
  }

  void _deleteItems(int index) {
    setState(() {
      widget.pressCounts.removeAt(index);
      totalCount = widget.pressCounts.length; // Update total count
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController = TabController(length: 2, vsync: this);
    // _tabController!.animateTo(widget.index);
    totalCount = widget.data.length; // Initialize total count
    totalCounts = widget.pressCounts.length; // Initialize total count
  }
  Widget build(BuildContext context) {
    int totalSum = 0;
    for(int item in widget.data) {
      totalSum += item;
    }
    int totalSums = 0;
    for(int items in widget.pressCounts) {
      totalSums += items;
    }
    double screenwidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      initialIndex: widget.index,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            // SizedBox(height: 125),
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 1,
                indicatorColor: Colors.orange,
                tabs: [
                  Tab(
                    child: Container(
                      child: Center(
                          child: Text(
                            "Jaap",
                            style: TextStyle(fontSize: screenwidth * 0.04),
                          )),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Center(
                          child: Text(
                            "Ram Lekhan",
                            style: TextStyle(fontSize: screenwidth * 0.039),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [


                  SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(height: 15),
                        // Container(
                        //   color: Colors.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("मंत्र",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                        //         Padding(
                        //           padding: EdgeInsets.only(left: 20),
                        //           child: Text("गड़ना",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                        //         ),
                        //         Text("दिनांक / समय",style: TextStyle(fontSize: screenwidth * 0.039,fontWeight: FontWeight.bold),),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        Stack(
                          children: [
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("मंत्र",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text("गड़ना",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                                    ),
                                    Text("दिनांक / समय",style: TextStyle(fontSize: screenwidth * 0.039,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // height: 400,
                              // color: Colors.red,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.data.length,
                                itemBuilder: (context, index) {
                                  var _selectedItem;
                                  var _currentTime;
                                  return   Container(
                                    padding: EdgeInsets.all(1),
                                    margin: EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade100,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), // Shadow color
                                          spreadRadius: 1, // Shadow spread radius
                                          blurRadius: 9, // Shadow blur radius
                                          offset: Offset(0, 3), // Shadow offset
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 14),
                                              child: Text("जाप", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                            ),
                                          ],
                                        ),
                                      // जाप
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${widget.data[index]}",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Text(
                                              "6 Jul 2024",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) => CupertinoAlertDialog(
                                                    title: Text('Delete Item'),
                                                    //content: Text('Are you sure you want to delete this item?'),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        child: Text('Cancel',style: TextStyle(color: Colors.blueAccent),),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                      CupertinoDialogAction(
                                                        child: Text('Delete',style: TextStyle(color: Colors.red),),
                                                        onPressed: () {
                                                          _deleteItem(index);
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Count: ${totalSum}',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),

                              GestureDetector(
                                onTap: () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                      title: Text('Reset'),
                                      //content: Text('Are you sure you want to reset the data?'),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: Text('Cancel',style: TextStyle(color: Colors.blueAccent),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        CupertinoDialogAction(
                                          child: Text('Reset',style: TextStyle(color: Colors.red),),
                                          onPressed: () {
                                            widget.data.clear();
                                            totalCount = 0;
                                            setState(() {});
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "reset",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  width: 70,
                                  height: 43,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.orange,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //-----------------------------------JAAP HISTORY ENDS-------------------------------------



                  //-------------------------------RAM LEKHAN HISTORY STARTS-----------------------------
                  SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(height: 15),
                        // Container(
                        //   color: Colors.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("मंत्र",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                        //         Padding(
                        //           padding: EdgeInsets.only(left: 20),
                        //           child: Text("गड़ना",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                        //         ),
                        //         Text("दिनांक / समय",style: TextStyle(fontSize: screenwidth * 0.039,fontWeight: FontWeight.bold),),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        Stack(
                          children: [
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("मंत्र",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text("गड़ना",style: TextStyle(fontSize: screenwidth * 0.043,fontWeight: FontWeight.bold),),
                                    ),
                                    Text("दिनांक / समय",style: TextStyle(fontSize: screenwidth * 0.039,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              // height: 400,
                              // color: Colors.red,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.pressCounts.length,
                                itemBuilder: (context, index) {
                                  return   Container(
                                    padding: EdgeInsets.all(1),
                                    margin: EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade100,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2), // Shadow color
                                          spreadRadius: 1, // Shadow spread radius
                                          blurRadius: 9, // Shadow blur radius
                                          offset: Offset(0, 3), // Shadow offset
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 14),
                                              child: Text("Ram Lekhan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                            ),
                                          ],
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${widget.pressCounts[index]}",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Text(
                                              "6 Jul 2024",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) => CupertinoAlertDialog(
                                                    title: Text('Delete Item'),
                                                    //content: Text('Are you sure you want to delete this item?'),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        child: Text('Cancel',style: TextStyle(color: Colors.blueAccent),),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                      CupertinoDialogAction(
                                                        child: Text('Delete',style: TextStyle(color: Colors.red),),
                                                        onPressed: () {
                                                          _deleteItems(index);
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Count: ${totalSums}',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),

                              GestureDetector(
                                onTap: () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                      title: Text('Reset'),
                                      //content: Text('Are you sure you want to reset the counts?'),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: Text('Cancel',style: TextStyle(color: Colors.blueAccent),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        CupertinoDialogAction(
                                          child: Text('Reset',style: TextStyle(color: Colors.red),),
                                          onPressed: () {
                                            widget.pressCounts.clear();
                                            totalCount = 0;
                                            setState(() {});
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "reset",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  width: 70,
                                  height: 43,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.orange,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //-------------------------------RAM LEKHAN HISTORY ENDS-----------------------------


                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
