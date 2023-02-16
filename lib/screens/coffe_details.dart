import 'package:coffe_shop_flutter/counter_bloc/counter_bloc.dart';
import 'package:coffe_shop_flutter/counter_bloc/counter_event.dart';
import 'package:coffe_shop_flutter/counter_bloc/counter_state.dart';
import 'package:coffe_shop_flutter/models/brewing_coffe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetails extends StatefulWidget {
  const CoffeeDetails({super.key, required this.model});
  final BrewingCoffee model;

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final double price = widget.model.price ?? 0;
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const SizedBox(),
          flexibleSpace: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(
                    30,
                  ),
                  bottomLeft: Radius.circular(
                    30,
                  ),
                ),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(300),
                  child: Image.asset(
                    widget.model.picture ?? 'Picture',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          toolbarHeight: 300,
        ),
        bottomNavigationBar: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, counterState) {
            return Container(
              color: Colors.brown.shade700,
              child: TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Order Confirmation: ${widget.model.name}'),
                    content: Text('Price: \$${(widget.model.price ?? 0) * counterState.count}'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Confirm'),
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                ),
                child: const Text(
                  'Order Now',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 230, 181, 164),
                  ),
                ),
              ),
            );
          },
        ),
        body: Container(
          color: Colors.brown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.title ?? 'Title',
                  style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 230, 181, 164), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.name ?? 'Name',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, counterState) {
                  return Row(
                    children: [
                      IconButton(
                        // onPressed: () => setState(() {
                        //       counter == 0 ? ('counter at 0') : counter--;
                        //     }),
                        onPressed: () {
                          if (counterState.count > 1) {
                            context.read<CounterBloc>().add(CounterDecrementEvent());
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('${counterState.count}'),
                      IconButton(
                        // onPressed: () {
                        //   setState(() {
                        //     counter += 1;
                        //   });
                        // },
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterIncrementEvent());
                        },
                        icon: const Icon(Icons.add),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, counterState) {
                            return Text(
                              '\$ ${price * counterState.count}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 230, 181, 164),
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.details ?? 'Details',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // setState(Null Function() param0) {}
}
