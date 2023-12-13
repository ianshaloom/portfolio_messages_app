import 'package:flutter/material.dart';
import 'package:portfolio_messages/constants.dart';

import '../../domain/entity/message_response.dart';
import '../provider/mpesa_qr_code_provider.dart';
import '../widgets/message_tile.dart';

class PortMessagesPage extends StatelessWidget {
  const PortMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            automaticallyImplyLeading: false,
            elevation: 0,
            scrolledUnderElevation: 0,
            stretch: false,
            centerTitle: true,
            //expandedHeight: 80,
            collapsedHeight: 120,
            flexibleSpace: Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          profilePhotoUrl,
                        ),
                        radius: 25,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Ian Shaloom',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            sliver: FutureBuilder(
              future: MpesaQrCodeProvider().getMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Failed to Fetch Messages',
                          style: textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final List<MessageResponse> messages =
                        snapshot.data as List<MessageResponse>;
                    return SliverList.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return MessageTile(
                          message: messages[index],
                        );
                      },
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No Messages',
                          style: textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  return SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Fetching Data...',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
