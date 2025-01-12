import 'package:flutter/material.dart';

import '../Model/chapter_model.dart';
import '../show_epub.dart';

// ignore: must_be_immutable
class ChaptersList extends StatelessWidget {
  List<LocalChapterModel> chapters = [];
  final String bookId;
  final Widget? leadingIcon;
  final Color accentColor;
  final String chapterListTitle;

  ChaptersList({super.key, required this.chapters, required this.bookId, this.leadingIcon, required this.accentColor, required this.chapterListTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: backColor,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(
              Icons.close,
              color: fontColor,
              size: 20,
            )),
        centerTitle: true,
        title: Text(
          chapterListTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: accentColor, fontSize: 15),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: backColor,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: chapters.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () async {
                        Navigator.of(context).pop(true);
                        await bookProgress.setCurrentChapterIndex(bookId, i);
                      },
                      leading: leadingIcon,
                      minLeadingWidth: 20,
                      title: Padding(
                        padding: EdgeInsets.only(left: chapters[i].isSubChapter ? 15 : 0),
                        child: Text(chapters[i].chapter, style: TextStyle(color: bookProgress.getBookProgress(bookId).currentChapterIndex == i ? accentColor : fontColor, fontFamily: fontNames.where((element) => element == selectedFont).first, package: 'cosmos_epub', fontSize: 15, fontWeight: chapters[i].isSubChapter ? FontWeight.w400 : FontWeight.w600)),
                      ),
                      dense: true,
                    ),
                    const Divider(height: 0, thickness: 1),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
