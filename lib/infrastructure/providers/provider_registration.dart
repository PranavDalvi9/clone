import 'package:clone/infrastructure/providers/home_provider/home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider<HomeProvider>((ref) => HomeProvider(ref));
