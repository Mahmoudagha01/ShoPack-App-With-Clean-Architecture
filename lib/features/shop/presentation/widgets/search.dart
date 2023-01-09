import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../bloc/products_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormFieldState>();
    final searchControler = TextEditingController();
    final bloc = BlocProvider.of<ProductsBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: AnimatedContainer(
          width: bloc.searchFolded ? 50 : kWidth(context) * 0.6,
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: kElevationToShadow[6],
          ),
          child: Row(
            children: [
              Expanded(
                  child: bloc.searchFolded
                      ? const SizedBox()
                      : Form(
                          key: formkey,
                          child: TextFormField(
                            controller: searchControler,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      bloc.add(GetFilterSpecificProduct(
                                          bloc.categories[bloc.current],
                                          '0',
                                          '100000',
                                          '-1',
                                          searchControler.text));
                                    },
                                    icon: const Icon(Icons.search)),
                                hintText: 'Search',
                                border: InputBorder.none),
                          ),
                        )),
              IconButton(
                onPressed: () {
                  setState(() {
                    bloc.searchFolded = !bloc.searchFolded;
                  });
                },
                icon: bloc.searchFolded
                    ? const Icon(Icons.search)
                    : const Icon(
                        Icons.close,
                        color: ColorManager.grey,
                      ),
              )
            ],
          )),
    );
  }
}
