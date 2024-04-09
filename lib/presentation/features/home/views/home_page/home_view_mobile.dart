import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/gen/assets.gen.dart';
import 'package:felicitup/presentation/features/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({
    super.key,
    required this.ref,
  });
  final WidgetRef ref;

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
    const PageFour(),
    const PageFive(),
  ];

  @override
  void initState() {
    widget.ref.read(homeProvider.notifier).getUid();
    Future.delayed(const Duration(seconds: 1), () {
      widget.ref.read(homeProvider.notifier).getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.ref.watch(homeProvider);
    final notifier = widget.ref.watch(homeProvider.notifier);
    return Scaffold(
      body: SizedBox(
        height: size.fullHeight(context),
        width: size.fullWidth(context),
        child: SafeArea(
          child: Column(
            children: [
              const _Header(),
              // SizedBox(height: size.height(context, .02)),
              _pages[state.currentIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.currentIndex,
        onTap: (index) async {
          await notifier.getUserData();
          notifier.changePage(index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.red,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: AppColors.red,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.logo,
              height: size.height(context, .06),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: AppColors.red,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: AppColors.red,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class InProgressView extends StatelessWidget {
  const InProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: size.symmetric(context, .03, .05),
      child: Column(
        children: [
          Container(
            width: size.width(context, .8),
            padding: size.all(context, .02),
            decoration: BoxDecoration(
              borderRadius: size.borderRadius(context, .01),
              color: Colors.black12,
            ),
            child: Column(
              children: [
                Text(
                  'FELICITUP CUMPLEAÑOS JORGE',
                  style: AppStyles.bodyXS.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height(context, .01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: size.height(context, .06),
                      width: size.height(context, .06),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.red,
                      ),
                    ),
                    Container(
                      height: size.height(context, .06),
                      width: size.width(context, .4),
                      color: Colors.red,
                    ),
                    Container(
                      height: size.height(context, .06),
                      width: size.width(context, .12),
                      color: Colors.green,
                    ),
                  ],
                ),
                SizedBox(height: size.height(context, .01)),
                Text(
                  '14/08/24',
                  style: AppStyles.bodyXS.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UpCommingView extends StatelessWidget {
  const UpCommingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: size.symmetric(context, .08, .05),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}

class PastView extends StatelessWidget {
  const PastView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: size.symmetric(context, .08, .05),
      child: Container(
        color: Colors.black,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.fullWidth(context),
      padding: size.horizontal(context, .07),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(builder: (BuildContext context, WidgetRef ref, _) {
            final state = ref.watch(homeProvider);
            return Container(
              height: size.height(context, .06),
              width: size.height(context, .06),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.red,
              ),
              child: state.currentUser.userImg != null
                  ? Image.network(state.currentUser.userImg!)
                  : null,
            );
          }),
          const Spacer(),
          Container(
            width: size.width(context, .5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  size.width(context, .1),
                ),
                topRight: Radius.circular(
                  size.width(context, .1),
                ),
              ),
              color: const Color(0xFFF4F2F2),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height(context, .03),
                ),
                Image.asset(
                  Assets.images.logoLetter.path,
                  height: size.height(context, .045),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: AppColors.red,
              size: size.height(context, .045),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeHeaderOption extends StatelessWidget {
  const _HomeHeaderOption({
    required this.label,
    required this.isActive,
    required this.onActive,
    required this.activeColor,
    required this.textColor,
  });

  final String label;
  final bool isActive;
  final VoidCallback onActive;
  final Color activeColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onActive,
      child: Container(
        height: size.height(context, .04),
        width: size.width(context, .3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: size.borderRadius(context, .02),
          color: isActive ? activeColor : Colors.white,
          border: Border.all(
            color: isActive ? activeColor : textColor,
          ),
        ),
        child: Text(
          label,
          style: AppStyles.bodyXS.copyWith(
            color: isActive ? Colors.white : textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PageOne extends ConsumerWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.watch(homeProvider.notifier);
    return Expanded(
      child: Container(
        color: const Color(0xFFF4F2F2),
        child: Column(
          children: [
            SizedBox(height: size.height(context, .05)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _HomeHeaderOption(
                  label: 'EN CURSO',
                  isActive: state.listBoolsTap[0],
                  textColor: AppColors.lightBlue,
                  activeColor: AppColors.lightBlue,
                  onActive: () => notifier.changeActive(0),
                ),
                _HomeHeaderOption(
                  label: 'PRÓXIMOS',
                  isActive: state.listBoolsTap[1],
                  textColor: AppColors.orange,
                  activeColor: AppColors.orange,
                  onActive: () => notifier.changeActive(1),
                ),
                _HomeHeaderOption(
                  label: 'PASADOS',
                  isActive: state.listBoolsTap[2],
                  textColor: const Color(0xFF8E8E8E),
                  activeColor: const Color(0xFF8E8E8E),
                  onActive: () => notifier.changeActive(2),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: notifier.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return index == 0
                      ? const InProgressView()
                      : index == 1
                          ? const UpCommingView()
                          : const PastView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página 2'),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página 3'),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página 4'),
    );
  }
}

class PageFive extends StatelessWidget {
  const PageFive({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página 5'),
    );
  }
}
