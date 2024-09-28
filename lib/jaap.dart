import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:jaap/history.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:signature/signature.dart';

class Jaap extends StatefulWidget {
  const Jaap({super.key});

  @override
  State<Jaap> createState() => _JaapState();
}


class Person {
  String id;
  String name;

  Person({required this.id, required this.name});
}

class _JaapState extends State<Jaap> with TickerProviderStateMixin {
//------------------------------------------------------------------------

  // final _audioPlayer = AudioPlayer();
  //
  // @override
  // Future<void> init() async {
  //   await _audioPlayer.setAudioSource(
  //     AudioSource.uri(Uri.parse('https://sahitya-mahakal.rizrv.net/audio/chapter_1/verse_01.mp3')),
  //   );
  // }
  //
  // @override
  // Future<void> play() async {
  //   await _audioPlayer.play();
  // }
  //
  // @override
  // Future<void> pause() async {
  //   await _audioPlayer.pause();
  // }
  //
  // @override
  // Future<void> stop() async {
  //   await _audioPlayer.stop();
  // }


  //----------------------JAAP TAB STARTS----------------------------



  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  // our jaap app tab controller
  late TabController _tabController;
  int tabIndex = 0;

  List<dynamic> myList = [];

  // jaap app background image
  String _selectedImage = 'assets/images/ram_3.png';

  bool _vibrationEnabled = true; // Default vibration state is on

  // setting bottom sheet 3 circle in row
  int itemColorIndex = 0;
  void _showsettingsheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {

        return Container(
          height: 185,
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Switch(
                      value: _vibrationEnabled,
                      onChanged: (value) {
                        setState(() {
                          Navigator.pop(context);
                          _vibrationEnabled = value;
                        });
                      },
                      activeColor: Colors.orangeAccent,
                      inactiveTrackColor: Colors.white30,
                    ),
                    SizedBox(width: 7),
                    Text(_vibrationEnabled ? 'Vibration On' : 'Vibration Off',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              // ListTile(
              //   title: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Switch(
              //         value: _vibrationEnabled,
              //         onChanged: (value) {
              //           setState(() {
              //             Navigator.pop(context);
              //             _vibrationEnabled = value;
              //           });
              //         },
              //       ),
              //       SizedBox(width: 7),
              //       Text(_vibrationEnabled ? 'Sound On' : 'Sound Off',style: TextStyle(color: Colors.deepPurple),),
              //     ],
              //   ),
              // ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      Container(
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 1.5),
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(300),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Background",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Center(
                          child: Icon(
                            Icons.history,
                            size: 30,
                          ),
                        ),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 1.5),
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(300),
                        ),
                      ),
                      SizedBox(width: 15),
                      TextButton(
                        onPressed: () {
                          setState(() {
                          _tabController.animateTo(2);
                        });
                        Navigator.pop(context);
                        },
                        child: Text("History",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          itemColorIndex = 0;
                          Navigator.pop(context);
                        });
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/ram_3.png',
                          width: 45,  // Set the desired width
                          height: 45, // Set the desired height
                          fit: BoxFit.cover, // Ensures the image fits within the circle
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          itemColorIndex = 1;
                          Navigator.pop(context);
                        });
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/ram_4.png',
                          width: 45,  // Set the desired width
                          height: 45, // Set the desired height
                          fit: BoxFit.cover, // Ensures the image fits within the circle
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          itemColorIndex = 2;
                          Navigator.pop(context);
                        });
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/ram_5.png',
                          width: 45,  // Set the desired width
                          height: 45, // Set the desired height
                          fit: BoxFit.cover, // Ensures the image fits within the circle
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 10),
              // ListTile(
              //   title: Row(
              //     children: [
              //       Container(
              //         child: Center(
              //           child: Icon(
              //             Icons.history,
              //             size: 30,
              //           ),
              //         ),
              //         width: 50,
              //         height: 50,
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.orange, width: 1.5),
              //           color: Colors.white.withOpacity(0.2),
              //           borderRadius: BorderRadius.circular(300),
              //         ),
              //       ),
              //       SizedBox(width: 15),
              //       Text(
              //         "History",
              //         style:
              //             TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //       ),
              //     ],
              //   ),
              //   onTap: () {
              //     setState(() {
              //       _tabController.animateTo(2);
              //     });
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }

  // jaap page mantra list
  String _selectedItem = '';
  List<Person> people = [
    Person(id: 'राम! राम! राम! राम', name: 'Ram Naam Jaap(राम नाम जाप)'),
    Person(id: 'ॐ नमः शिवाय', name: 'Shiv Jaap(शिव जाप)'),
    Person(id: '!!हरे कृष्ण हरे राम!!', name: 'Krishna Jaap(कृष्ण जाप)'),
    Person(id: '!!ॐ गं गणपतये नमः!!', name: 'Ganesh Jaap(गणेश जाप)'),
    Person(id: 'ॐ भूर्भुवः स्वः तत्सवितुर्वरेण्यं भर्गो दैवस्य धीमहि। धियो यो नः प्रचोदयात्॥', name: 'Gayatri Mantra Jaap(गायत्री मंत्र जाप)'),
    Person(id: '!!ओम नमः भगवते वासुदेवाय नमः!!', name: 'Vishnu Mantra Jaap(विष्णु मंत्र जाप)'),
    Person(id: '!!श्री राम जय राम जय जय राम!!', name: 'Ram Jaap(राम जाप)'),
    Person(id: 'ॐ दुर्गा नमः', name: 'Durga Jaap(दुर्गा जाप)'),
    Person(id: 'ॐ नमो नारायणाय!!', name: 'Vishnu Jaap(विष्णु जाप)'),
    Person(id: 'ॐ श्रीं महा लक्ष्मीयै नमः!!', name: 'Laxmi Mantra Jaap(लक्ष्मी मंत्र जाप)'),
    Person(id: 'ॐ हौं जूं सः ॐ भूर्भुवः स्वः ॐ त्र्यम्बकं यजामहे सुगन्धिं पुष्टिवर्धनम् उर्वारुकमिव बन्धनान्मृ त्योर्मुक्षीय मामृतात् ॐ स्वः भुवः भूः ॐ सः जूं हौं ॐ।', name: 'Mahamrityunjay Jaap(महामृत्युंजय जाप)'),
  ];
  double getFontSize(String name, num screenwidth) {
    double fontSizeRatio;

    switch (name) {
      case 'Ram Naam Jaap(राम नाम जाप)':
        fontSizeRatio = 0.11;
        break;
      case 'Shiv Jaap(शिव जाप)':
        fontSizeRatio = 0.13;
        break;
      case 'Krishna Jaap(कृष्ण जाप)':
        fontSizeRatio = 0.11;
        break;
      case 'Ganesh Jaap(गणेश जाप)':
        fontSizeRatio = 0.1;
        break;
      case 'Gayatri Mantra Jaap(गायत्री मंत्र जाप)':
        fontSizeRatio = 0.07;
        break;
      case 'Vishnu Mantra Jaap(विष्णु मंत्र जाप)':
        fontSizeRatio = 0.11;
        break;
      case 'Ram Jaap(राम जाप)':
        fontSizeRatio = 0.11;
        break;
      case 'Durga Jaap(दुर्गा जाप)':
        fontSizeRatio = 0.14;
        break;
      case 'Vishnu Jaap(विष्णु जाप)':
        fontSizeRatio = 0.10;
        break;
      case 'Laxmi Mantra Jaap(लक्ष्मी मंत्र जाप)':
        fontSizeRatio = 0.11;
        break;
      case 'Mahamrityunjay Jaap(महामृत्युंजय जाप)':
        fontSizeRatio = 0.05;
        break;
      default:
        fontSizeRatio = 0.05;
    }
    return fontSizeRatio * screenwidth;
  }


  // jaap count animation
  late AnimationController _animationController;
  late Animation<double> _animation;

  // jaap page loop count
  int _loopCounter = 0;
  // jaap page main big circle count
  int _tapCounter = 0;
  // jaap page score count
  int product = 0;
  // jaap page loop count from list 11,20,30
  int _tapsPerLoop = 11;
  void _onButtonTap() {
    setState(() {
      _tapCounter++;
      if (_tapCounter > _tapsPerLoop) {
        _loopCounter++;
        _tapCounter = 1;
      }
      product++;
    });
    _animationController.forward(from: 0.0);
    Future.delayed(const Duration(milliseconds: 200), () {
      _animationController.reverse();
    });
  }
  void _showBottomSheets() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 220,
          child: ListView(
            children: [
              ListTile(
                title: Text('11', textAlign: TextAlign.center),
                onTap: () {
                  setState(() {
                    _tapsPerLoop = 10;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('20', textAlign: TextAlign.center),
                onTap: () {
                  setState(() {
                    _tapsPerLoop = 20;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('30', textAlign: TextAlign.center),
                onTap: () {
                  setState(() {
                    _tapsPerLoop = 30;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('40', textAlign: TextAlign.center),
                onTap: () {
                  setState(() {
                    _tapsPerLoop = 40;
                  });
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // jaap total count saved and pass to score page
  List<int> _savedCounts = [];
  void _submitCount() {
    setState(() {
      _selectedItem;
      _savedCounts.add(product);
    });
  }

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  //----------------------JAAP TAB ENDS----------------------------


  //----------------------RAM LEKHAN TAB STARTS----------------------------

  final ScrollController _scrollController = ScrollController();


  // ram lekhan signature pen decoration
  final controllers = SignatureController(
    penColor: Colors.orange,
    penStrokeWidth: 3,
    exportPenColor: Colors.orange,
    exportBackgroundColor: Colors.white,
  );

  // ram lekhan signature saved here
  List<Uint8List> signatures = [];

  // ram lekhan ram word saved here
  List<Widget> _texts = [];
  void _addText() {
    setState(() {
      _texts.add(Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.amber.shade200,
              width: 1.0,
            ),
            left: BorderSide(
              color: Colors.amber.shade200,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: Colors.amber.shade200,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 11, left: 11, top: 15, bottom: 15),
          child: Text(
            'राम',
            style: TextStyle(fontSize: 23.7, color: Colors.orange, height: 1),
          ),
        ),
      ));
    });
  }

  // ram lekhan keyboard word saved here
  List<String> _textstype = [];

  // // ram lekhan Variable to toggle keyboard visibility
  // bool _showKeyboard = true;
  // void _toggleKeyboard() {
  //   setState(() {
  //     _showKeyboard = !_showKeyboard; // Toggle the keyboard visibility
  //   });
  // }

  // ram lekhan Controller for the text field keyboard TextEditingController
  final TextEditingController _textController = TextEditingController();
  // String _inputText = ''; // Variable to store the text input
  // void _updateText(String text) {
  //   setState(() {
  //     _inputText = text; // Update the displayed text
  //     _textstype.add(_textController.text);
  //   });
  // }

  // ram lekhan Variable to toggle signature pad visibility
  bool _isSignatureVisible = false;

  // ram lekhan total count start
  int _buttonPressCount = 0;
  int _buttonPressCounts = 0;
  int _totalPressCount = 0;
  int _currentIndex = 0;

  void _incrementButtonPressCount() {
    setState(() {
      _buttonPressCount++;
      _totalPressCount = _buttonPressCount + _buttonPressCounts;
    });
  }

  void _incrementButtonPressCounts() {
    setState(() {
      _buttonPressCounts++;
      _totalPressCount = _buttonPressCount + _buttonPressCounts;
    });
  }
  // ram lekhan total count End

  //----------------------RAM LEKHAN TAB STARTS----------------------------

  List<dynamic> _pressCounts = [];

  String _currentTime = '';

  void _showCurrentTime() {
    final now = DateTime.now();
    String hour;
    if (now.hour > 12) {
      hour = (now.hour - 12).toString();
    } else if (now.hour == 0) {
      hour = '12';
    } else {
      hour = now.hour.toString();
    }
    // String ampm = now.hour > 11 ? 'PM' : 'AM'
    // $ampm
    final formattedTime = '$hour:${now.minute.toString().padLeft(2, '0')} , ${now.day} ${_getMonth(now.month)} ${now.year.toString().substring(2)} ';
    setState(() {
      _currentTime = formattedTime;
    });
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _isSignatureVisible = false; // Initialize with true
    // _tabController.addListener(() {
    //   _currentIndex = _tabController.index;
    // });
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 1.2).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });
  }

  void dispose() {
    controllers.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white30,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Jaap',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            GestureDetector(
              onTap: _showsettingsheet,
              child: Icon(Icons.settings, color: Colors.white),
            ),
            SizedBox(width: 15)
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: itemColorIndex == 0
                    ? AssetImage('assets/images/ram_3.png')
                    : itemColorIndex == 1
                    ? AssetImage('assets/images/ram_4.png')
                    : itemColorIndex == 2
                    ? AssetImage('assets/images/ram_5.png')
                    : AssetImage('assets/images/$_selectedImage'),
                fit: BoxFit.cover,

              ),
            ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.11),
              Padding(
                padding: EdgeInsets.only(left: 18, right: 18),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicatorWeight: 1,
                  indicatorColor: Colors.orange,
                  onTap: (index) {
                    setState(() {
                      _tabController.index = index;
                    });
                  },
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
                          style: TextStyle(fontSize: screenwidth * 0.034),
                        )),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Center(
                            child: Text(
                          "Score",
                          style: TextStyle(fontSize: screenwidth * 0.036),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [

                    // --------------------------------JAAP TAB STARTS------------------------------

                    SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/animation_1.gif")
                          )
                        ),
                        child: Column(
                          children: [

                            // IconButton(
                            //     onPressed: (){Vibrate.feedback(FeedbackType.warning);},
                            //     icon: Icon(Icons.tap_and_play, color: Colors.orange),
                            // ),


                            // Center(
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: <Widget>[
                            //       Text(
                            //         _currentTime,
                            //         style: TextStyle(fontSize: 24,color: Colors.red),
                            //       ),
                            //       SizedBox(height: 20),
                            //       ElevatedButton(
                            //         child: Text('OK'),
                            //         onPressed: _showCurrentTime,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Text(_selectedItem,style: TextStyle(color: Colors.red,fontSize: 20),),

                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 3, top: 10),
                              child: Row(
                                children: [
                                  Text("मंत्र",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                                  SizedBox(width: 10),
                                  Container(
                                    width: screenwidth * 0.78,
                                    padding: EdgeInsets.only(left:9),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.5),
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: DropdownButton<String>(
                                      hint: Text(_selectedItem.isEmpty ? 'Select Item' : _selectedItem,
                                        style: TextStyle(color: Colors.white,fontSize: screenwidth * 0.036,fontWeight: FontWeight.w600),
                                      ),
                                      icon: Padding(
                                        padding: const EdgeInsets.only(left: 0.5),
                                        child: Icon(Icons.arrow_drop_down, color: Colors.white),
                                      ),
                                      iconSize: 20,
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedItem = people.firstWhere((person) => person.id == value).name;
                                          //_selectedItem = people.firstWhere((person) => person.id == value).name;
                                        });
                                      },
                                      items: people.map((person) {
                                        int index = people.indexOf(person);
                                        return DropdownMenuItem<String>(
                                          value: person.id,
                                          child: Text(person.name),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  // SizedBox(width: screenwidth * 0.03,),
                                  // Icon(
                                  //   Icons.history,
                                  //   color: Colors.white,
                                  //   size: 20,
                                  // )
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 18, right: 18, top: 10),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.orange)),
                                height: screenHeight * 0.17,
                                width: double.infinity,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),

                                    child: Text(
                                      _selectedItem.isEmpty ? 'Select Item' : people.firstWhere((person) => person.name == _selectedItem).id,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: getFontSize(_selectedItem.isEmpty ? '' : people.firstWhere((person) => person.name == _selectedItem).name, screenwidth),
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // ----------------------------------0 loop-0  reset---------------------
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 35, right: 35, top: 10),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: _selectedItem.isEmpty ? null : _showBottomSheets,
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "$_tapsPerLoop",
                                                style: TextStyle(
                                                    fontSize: screenwidth * 0.05,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            width: screenwidth * 0.17,
                                            height: screenHeight * 0.08,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white, width: 1),
                                              color: Colors.orange.withOpacity(0.4), // highlight color
                                              borderRadius: BorderRadius.circular(300),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'माला : $_loopCounter',
                                          style: TextStyle(
                                              fontSize: screenwidth * 0.07,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: _selectedItem.isEmpty ? null : () {
                                            setState(() {
                                              _tapCounter = 0;
                                              _tapsPerLoop = 11;
                                              _loopCounter = 0;
                                              product = 0;
                                            });
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "reset",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: screenwidth * 0.04),
                                              ),
                                            ),
                                            width: screenwidth * 0.17,
                                            height: screenHeight * 0.08,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white, width: 1),
                                              color: Colors.orange.withOpacity(0.4), // highlight color
                                              borderRadius: BorderRadius.circular(300),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 9999999999900000,
                                    ),
                                    onPressed: () {
                                      if (_selectedItem.isEmpty) {
                                        // Show alert message
                                        showCupertinoDialog(
                                          context: context,
                                          builder: (context) => CupertinoAlertDialog(
                                            title: Text('Please select the Jaap'),
                                            //content: Text('You must select a Jaap before tapping'),
                                            actions: [
                                              CupertinoDialogAction(
                                                child: Text('OK', style: TextStyle(color: Colors.blueAccent),),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        setState(() {
                                          if (_vibrationEnabled) {
                                            Vibrate.feedback(FeedbackType.warning); // Enable vibration
                                          }
                                          //play();
                                          _animationController.forward();
                                          _onButtonTap();
                                          _incrementCounter();
                                        });
                                      }
                                    },
                                    child: Transform.scale(
                                      scale: _animation.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: screenwidth * 0.8,
                                            height: screenHeight * 0.37,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/flower.png")
                                              ),
                                              border: Border.all(color: Colors.transparent, width: 3),
                                              color: Colors.transparent.withOpacity(0.01),
                                              borderRadius: BorderRadius.circular(300),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${_tapCounter.toString().padLeft(2, '0')}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenwidth * 0.23,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),

                                        ]
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ----------------------------------0 loop-0  reset---------------------

                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Center(
                                      child: TextButton(
                                        child: Text(
                                          "Score",
                                          style: TextStyle(
                                              fontSize: screenwidth * 0.027,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          if (_selectedItem.isEmpty) {
                                            // Show alert message
                                            showCupertinoDialog(
                                              context: context,
                                              builder: (context) => CupertinoAlertDialog(
                                                title: Text('Please select the Jaap'),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: Text('OK',style: TextStyle(color: Colors.blueAccent),),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            // Navigate to ResultPage and pass the product
                                            // Use DefaultTabController.of(context) to access TabController
                                            setState(() {
                                              _submitCount();
                                              _showCurrentTime();
                                              tabIndex = 0;
                                              _tabController.animateTo(2);
                                              _tabController.index =  2;
                                              _tapCounter = 0;
                                              _loopCounter = 0;
                                              product = 0;
                                            });

                                            // Switch to the third tab (index 2)
                                          }
                                        },
                                      ),
                                    ),
                                    width: screenwidth * 0.15,
                                    height: screenHeight * 0.07,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // --------------------------------JAAP TAB ENDS---------------------------


                    // --------------------------------RAM LEKHAN TAB STARTS------------------------------
                    SingleChildScrollView(
                      controller: _scrollController,
                      physics: ClampingScrollPhysics(), // or ClampingScrollPhysics()
                      child: Container(
                        height: screenHeight * 0.835,
                        color: Colors.white,
                        child: Stack(
                          children: [

                            Container(
                              height: screenHeight * 0.5,
                              width: double.infinity,
                              color: Colors.white, // optional, for visualization
                              child: Scrollbar(

                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  physics: ClampingScrollPhysics(), // or ClampingScrollPhysics()
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        spacing: 0, // Spacing between items in the same row
                                        runSpacing: 0, // Spacing between rows
                                        children: [
                                          // Display the signatures
                                          for (int i = 0; i < signatures.length; i++)
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                      color: Colors.amber.shade200,
                                                      width: 1.0,
                                                    ),
                                                    left: BorderSide(
                                                      color: Colors.amber.shade200,
                                                      width: 1.0,
                                                    ),
                                                    bottom: BorderSide(
                                                      color: Colors.amber.shade200,
                                                      width: 1.0,
                                                    ),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 8, left: 8),
                                                child: Image.memory(
                                                  signatures[i]!,
                                                  width: screenwidth * 0.0959,
                                                  height: screenHeight * 0.063,
                                                ),
                                              ),
                                            ),
                                  
                                          // for (int i = 0; i < _textstype.length; i++)
                                          //   Padding(
                                          //     padding: const EdgeInsets.all(8.0),
                                          //     child: Text(
                                          //       _textstype[i],
                                          //       style: TextStyle(
                                          //           fontSize: screenwidth * 0.034, color: Colors.red),
                                          //     ),
                                          //   ),
                                  
                                          for (var text in _texts) text,
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Wrap(
                            //       spacing: 0, // Spacing between items in the same row
                            //       runSpacing: 0, // Spacing between rows
                            //       children: [
                            //         // Display the signatures
                            //         for (int i = 0; i < signatures.length; i++)
                            //           Container(
                            //             decoration: BoxDecoration(
                            //                 border: Border(
                            //               right: BorderSide(
                            //                 color: Colors.amber.shade200,
                            //                 width: 1.0,
                            //               ),
                            //               left: BorderSide(
                            //                 color: Colors.amber.shade200,
                            //                 width: 1.0,
                            //               ),
                            //               bottom: BorderSide(
                            //                 color: Colors.amber.shade200,
                            //                 width: 1.0,
                            //               ),
                            //             )),
                            //             child: Padding(
                            //               padding: const EdgeInsets.only(
                            //                   right: 8, left: 8),
                            //               child: Image.memory(
                            //                 signatures[i]!,
                            //                 width: screenwidth * 0.097,
                            //                 height: screenHeight * 0.069,
                            //               ),
                            //             ),
                            //           ),
                            //
                            //         for (int i = 0; i < _textstype.length; i++)
                            //           Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Text(
                            //               _textstype[i],
                            //               style: TextStyle(
                            //                   fontSize: screenwidth * 0.034, color: Colors.red),
                            //             ),
                            //           ),
                            //
                            //         for (var text in _texts) text,
                            //       ],
                            //     ),
                            //     SizedBox(height: 20),
                            //   ],
                            // ),

                            // Fixed container with a position
                            _isSignatureVisible
                                ? Positioned(
                                    top: screenHeight * 0.57,
                                    child: Column(
                                      children: [
                                        // Conditionally show the Signature Container
                                        Container(
                                          height: screenHeight * 0.26,
                                          width: screenwidth * 0.999,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            border: Border.all(
                                                color: Colors.red, width: 2),
                                          ),
                                          child: Signature(
                                            controller: controllers,
                                            //height: 270,
                                            width: double.infinity,
                                            backgroundColor: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : SizedBox(),

                            // Positioned(
                            //   top: screenHeight * 0.68,
                            //   child: Column(
                            //     children: [
                            //       if (_showKeyboard)
                            //         Padding(
                            //           padding: const EdgeInsets.symmetric(horizontal: 12,),
                            //           child: SizedBox(
                            //             // Add a SizedBox with a specific width
                            //             width: screenwidth * 0.560, //// or any other width you want
                            //             height: screenHeight * 0.06,
                            //             child: TextFormField(
                            //               controller: _textController,
                            //               decoration: InputDecoration(
                            //                 suffixIcon: IconButton(
                            //                   icon: Icon(Icons.send),
                            //                   onPressed: () {
                            //                     _updateText(_textController.text);
                            //                     _textController.clear(); // Clear text field after updating
                            //                     _toggleKeyboard(); // Hide keyboard after input
                            //                   },
                            //                 ),
                            //                 hintText: 'Type here...',
                            //                 border: OutlineInputBorder(
                            //                     borderRadius: BorderRadius.circular(100)),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),

                    Center(
                      child: History(product: product, data: _savedCounts, index: tabIndex, counter: _counter, pressCounts: _pressCounts, selectedItem: _selectedItem, currentTime: _currentTime, ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: _tabController.index == 1
            ? Stack(
                children: [
                  _isSignatureVisible
                      ? Positioned(
                          bottom: 10,
                          right: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isSignatureVisible =
                                    false; // Toggle the visibility
                                  });
                                },
                                icon: Icon(
                                  _isSignatureVisible ? Icons.cancel : Icons.edit,
                                  size: 30,
                                ),
                              ),
                              SizedBox(height: 5),
                              IconButton(
                                  onPressed: () async {
                                    controllers.clear();
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.undo),
                              ),

                              SizedBox(height: 5),
                              IconButton(
                                  onPressed: () async {
                                    Uint8List? newSignature =
                                    await controllers.toPngBytes();
                                    if (newSignature != null) {
                                      signatures.add(newSignature);
                                      setState(() {});
                                    }
                                    _incrementButtonPressCounts();
                                    // Clear the signature pad after saving
                                    controllers.clear();
                                  },
                                  icon: Icon(Icons.done),
                              ),
                            ],
                          ),
                        )
                      : Positioned(
                          top: screenHeight * 0.71,
                          left: screenwidth * 0.06,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: screenwidth * 0.73,height: screenHeight * 0.11),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "${_totalPressCount.toString().padLeft(2, '0')}",
                                        style: TextStyle(
                                            fontSize: screenwidth * 0.070,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple.shade300),
                                      ),
                                    ),
                                    width: screenwidth * 0.17,
                                    height: screenHeight * 0.08,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.purple.shade300,
                                          width: 1),
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(300),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: screenwidth * 0.73),
                                  Container(
                                    child: Center(
                                      child: TextButton(
                                        child: Text(
                                          "Score",
                                          style: TextStyle(
                                              fontSize: screenwidth * 0.034,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple.shade300),
                                        ),
                                        onPressed: () {
                                          if (_totalPressCount == 0 && _texts.isEmpty && signatures.isEmpty && _textstype.isEmpty) {
                                            // Show alert message
                                            showCupertinoDialog(
                                              context: context,
                                              builder: (context) => CupertinoAlertDialog(
                                                title: Text('Please perform some action'),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: Text('OK',style: TextStyle(color: Colors.blueAccent),),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            // Navigate to ResultPage and pass the product
                                            // Use DefaultTabController.of(context) to access TabController
                                            setState(() {
                                              tabIndex = 1;
                                              _pressCounts.add(_totalPressCount);
                                              _tabController.animateTo(2);
                                              _tabController.index =  2;
                                              _totalPressCount = 0;
                                              _texts.clear();
                                              signatures.clear();
                                              _buttonPressCount = 0;
                                              _buttonPressCounts = 0;
                                              _totalPressCount = 0;
                                              _textController.clear();
                                              _textstype.clear();
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    width: screenwidth * 0.17,
                                    height: screenHeight * 0.08,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.purple.shade300,
                                          width: 1),
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(300),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  //SizedBox(height: screenHeight * 0.04),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            showCupertinoDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CupertinoAlertDialog(
                                                  title: Text('Clear All'),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(color: Colors.blue),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      child: Text(
                                                        'Clear',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        _texts.clear();
                                                        signatures.clear();
                                                        _buttonPressCount = 0;
                                                        _buttonPressCounts = 0;
                                                        _totalPressCount = 0;
                                                        _textController.clear();
                                                        _textstype.clear();
                                                        setState(() {});
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: Image.network(
                                            'https://w7.pngwing.com/pngs/892/810/png-transparent-computer-icons-eraser-icon-design-graphic-design-eraser-angle-logo-black-thumbnail.png',
                                            width: 24, // adjust the width and height to your liking
                                            height: 24,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 15.0,
                                        // ),
                                        // ElevatedButton(
                                        //   onPressed: _toggleKeyboard,
                                        //   child: Icon(Icons.keyboard),
                                        // ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isSignatureVisible =
                                                  true; // Toggle the visibility
                                            });
                                          },
                                          icon: Icon(
                                            _isSignatureVisible
                                                ? Icons.done
                                                : Icons.edit,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenwidth * 0.440,
                                        ),
                                        // SizedBox(
                                        //   width: 8.0,
                                        // ),
                                        // ElevatedButton(
                                        //   onPressed: () {
                                        //     _addText();
                                        //     _incrementButtonPressCount();
                                        //   },
                                        //   child: Text('Ram'),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(height: screenHeight * 0.10),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            if (_vibrationEnabled) {
                                              Vibrate.feedback(FeedbackType.warning); // Enable vibration
                                            }
                                            _addText();
                                            _incrementButtonPressCount();
                                            _scrollToLastSignature();
                                          });
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              "Ram",
                                              style: TextStyle(
                                                  fontSize: screenwidth * 0.034,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.purple.shade300),
                                            ),
                                          ),
                                          width: screenwidth * 0.17,
                                          height: screenHeight * 0.08,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.purple.shade300,
                                                width: 1),
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(300),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                ],
              )
            : SizedBox(),

      ),
    );
  }
  void _scrollToLastSignature() {
    if (signatures.isNotEmpty) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}

