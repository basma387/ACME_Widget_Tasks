import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
    const Profile({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                debugShowCheckedModeBanner:false,
                home:Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xff2682E9),
                    centerTitle: true,
                    title: const Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize:20)
                    ),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed:(){
                            Navigator.pushNamed(context, '/screen');
                          }
                        )
                    ]

                  ),
                    backgroundColor:Color(0xffF2F7FE),
                    body: SafeArea(
                      child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal:16.0, vertical: 20.0),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:[
                                Stack(
                                  children:[
                                  CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Color(0xffE8F2FE),
                                  child: const Icon(Icons.person, size:60, color:Color(0x6ff5EA1EE)),
                                  ),

                                  Positioned(
                                    bottom:0,
                                    right:0,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Color(0xff2381EC),
                                        shape:BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 2),
                                      ),
                                      child: const Icon(Icons.camera_alt, size:20, color:Colors.white), 
                                    ),
                                  ),
                                  ]
                                ),

                                const SizedBox(height: 10),
                            
                                const Text(
                                "User Name",
                                style: TextStyle(
                                  fontSize:20,
                                  fontWeight: FontWeight.w800,
                                  color:Colors.black,
                                  )
                                ),

                                const Text(
                                "Flutter Developer",
                                style: TextStyle(
                                  fontSize:15,
                                  color:Color(0xff6C7989),
                                  )
                                ),

                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF2F7FE),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, 
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.format_quote, size: 24, color: Color(0xff2381EC)),
                                      const SizedBox(width: 12),
                                      const Flexible(
                                        child: Text(
                                          "Pationate about building beautiful and user-friendly applications.",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color:Color(0xff6C7989),
                                            height: 1.4,
                                          ),
                                        ),
                                        ),
                                    ],
                                    ),
                                
                                )
                              ]
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal:16.0),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Personal Information",
                                  style: TextStyle(
                                    fontSize:18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),

                                _buildListTile(icon: Icons.person_outline, label: "Full Name", subtitle:"User Name"),

                                const Divider(height: 1, indent: 70, endIndent: 16, color: Color(0xffDCDEE4)),

                                _buildListTile(icon: Icons.email_outlined, label:"Email", subtitle:"user@example.com"),

                                const Divider(height: 1, indent: 70, endIndent: 16, color: Color(0xffDCDEE4)),

                                _buildListTile(icon: Icons.phone, label:"Phone", subtitle:"+20 123 456 7890"),

                                const Divider(height: 1, indent: 70, endIndent: 16, color: Color(0xffDCDEE4)),

                                _buildListTile(icon: Icons.calendar_today_outlined, label: "Date of Birth", subtitle:"Jan 15, 1998"),

                                const Divider(height: 1, indent: 70, endIndent: 16, color: Color(0xffDCDEE4)),
                                
                                _buildListTile(icon: Icons.location_on_outlined, label:"Location", subtitle:"Cairo, Egypt"),
                              ],
                              ),
                          ),

                          SizedBox(height: 16),

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal:16.0),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                            Column(
                              children:[ 
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Text(
                                    "About Me",
                                    style: TextStyle(
                                      fontSize:18,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),

                                  Icon(Icons.edit, color:Color(0xff2381EC),),
                                  ]
                                ),

                                Row(
                                  children:
                                [
                                  Flexible(
                                  child: Text(
                                    "Pationate about building beautiful and user-friendly applications.",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:Color(0xff576171),
                                      height: 1.4,
                                    ),
                                    ),
                                  )
                                ],)
                              ]
                            )
                            ),

                            SizedBox(height: 16),
                        ]
                        
                      ),
                    )
                    )
                )
                );

          
    }
}




// Helper Function For ListTile

Widget _buildListTile({required IconData icon, required String label, required String subtitle}){
  
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal:16.0, vertical:0.0),
    leading: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffE7F1FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color:Color(0xff2381EC)),
    ),

    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Color(0xff798294),
          ),
        ),

        const SizedBox(height: 2),

        Text(
          subtitle,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff576171),
          ),
        ),
      ],
    ),
    trailing: const Icon(Icons.chevron_right, color: Colors.grey),
  );
}