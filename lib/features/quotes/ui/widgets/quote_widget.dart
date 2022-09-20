import 'package:flutter/material.dart';
import '../../../../models/models.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key? key, required this.model, required this.onPressed})
      : super(key: key);

  final QuoteModel model;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    debugPrint("QuoteWidget: Buildcontext");
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FractionallySizedBox(
        widthFactor: MediaQuery.of(context).size.width < 600 ? 1 : 0.6,
        heightFactor: 0.6,
        child: Card(
          shape: Theme.of(context).cardTheme.shape,
          color: Theme.of(context).cardTheme.color,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    model.content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.tags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                             margin: const EdgeInsets.all(5),
                            child: Chip(
                              label: Text(model.tags[index]),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              backgroundColor: Colors.deepPurple.shade200,
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Author: ${model.author}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xff262938),
                        ),
                      ),
                    ),
                  ),
                  child: const Text('Load a new quote'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String tagsToString(List<String> tags) {
    String tagsString = '';
    for (String tag in tags) {
      tagsString += ' $tag -';
    }
    return tagsString.substring(0, tagsString.length - 1);
  }
}
