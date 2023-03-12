import 'package:course_flutter_firebase/bloc/bloc/images_bloc.dart';
import 'package:course_flutter_firebase/bloc/events/crud_event.dart';
import 'package:course_flutter_firebase/bloc/states/crud_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagesSrceen extends StatefulWidget {
  const ImagesSrceen({Key? key}) : super(key: key);

  @override
  State<ImagesSrceen> createState() => _ImagesSrceenState();
}

class _ImagesSrceenState extends State<ImagesSrceen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ImagesBloc>(context).add(ReadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ImagesBloc, CrudState>(
        buildWhen: (previous, current) =>
            current is LoadingState || current is ReadState,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ReadState && state.references.isNotEmpty) {
            return GridView.builder(
              padding: EdgeInsets.all(15),
              itemCount: state.references.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      FutureBuilder(
                        future: state.references[index].getDownloadURL(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return Image.network(
                              snapshot.data!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            );
                          } else {
                            return Center(
                              child: Icon(Icons.image),
                            );
                          }
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          padding: EdgeInsetsDirectional.only(start: 10),
                          color: Colors.black54,
                          height: 40,
                          alignment: AlignmentDirectional.centerStart,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state.references[index].fullPath,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () => _deleteImage(index),
                                icon: Icon(Icons.delete),
                                color: Colors.red.shade800,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'NO Images',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black45,
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff870160),
        child: Icon(Icons.camera_alt),
        onPressed: () => Navigator.pushNamed(context, '/upload_image_screen'),
      ),
    );
  }

  void _deleteImage(int index) async {
    BlocProvider.of<ImagesBloc>(context).add(DeletedEvent(index));
  }
}
