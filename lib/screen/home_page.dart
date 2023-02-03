import 'package:flutter/material.dart';
import 'package:rendom_profile_app/model/rendom_people_data_model.dart';
import '../Helper/rendom_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 20),
        ],
        title: const Text("Random People Data"),
        centerTitle: true,
        backgroundColor: const Color(0xffD6A4A4),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffD6A4A4),
              Color(0xffDAE2F8),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: FutureBuilder(
                future: APIHelper.apiHelper.fetchRendomData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error : ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    Rendomdata? data = snapshot.data;

                    return (data != null)
                        ? Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(data.photo),
                                    radius: 60,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      " ${data.title} ${data.first} ${data.last}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 40),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                const Text(
                                                  "Gender",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  " ${data.gender}",
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 50),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Column(
                                                        children: [
                                                          const Text(
                                                            "City",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                          ),
                                                          Text(
                                                            " ${data.city}",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 1,
                                                          color: Colors.grey,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              width: 1,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      const Text(
                                                                        "Country",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 20),
                                                                      ),
                                                                      Text(
                                                                        " ${data.country}",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 50),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 60),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Age",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              " ${data.age}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 80),
                                      Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 1,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 40),
                                      Column(
                                        children: [
                                          const Text(
                                            "Phone Number",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            " ${data.Phone}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Center(
                            child: Text("No data found..."),
                          );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
