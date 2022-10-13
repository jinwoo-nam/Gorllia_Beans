import 'package:beans_instapay/presentation/components/temp/notice_detail_screen.dart';
import 'package:beans_instapay/presentation/components/temp/notice_sample_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticeSample extends StatelessWidget {
  const NoticeSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NoticeSampleViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16,
          ),
          child: SizedBox(
            width: 800,
            child: SingleChildScrollView(
              child: Column(
                children: viewModel.state.notice
                    .map(
                      (e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.adate,
                              style: const TextStyle(fontSize: 13),
                            ),
                            Text(
                              e.ftitle,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoticeDetailScreen(
                                      data: e,
                                    )),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
