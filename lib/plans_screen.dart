import 'package:flutter/material.dart';
import 'package:test_app/color.dart';
import 'package:test_app/item.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PlansScreen> {
  final _selectedCountries = [true, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Plans',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const Icon(
                  Icons.shopping_cart,
                  size: 32,
                  color: AppColor.armyGreen,
                )
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  MaterialButton(
                    onPressed: () => _onSelectCurrency(0),
                    elevation: 0,
                    minWidth: 96,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: _selectedCountries[0]
                        ? AppColor.armyGreen
                        : AppColor.lightArmyGreen,
                    child: Text(
                      'NGN',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: _selectedCountries[0]
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => _onSelectCurrency(1),
                    elevation: 0,
                    minWidth: 96,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: _selectedCountries[1]
                        ? AppColor.armyGreen
                        : AppColor.lightArmyGreen,
                    child: Text(
                      'USD',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: _selectedCountries[1]
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: Item.generate.length,
                itemBuilder: (_, i) {
                  final item = Item.generate[i];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.armyGreen),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 16),
                        Image(
                          image: AssetImage(item.image),
                          fit: BoxFit.cover,
                          height: 120,
                          width: double.maxFinite,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '₦ ${item.amount}/month',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Up to ${item.itemCount} items',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'VIEW CONTENT',
                                style: TextStyle(color: AppColor.armyGreen),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.chevron_right,
                                color: AppColor.armyGreen,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  foregroundColor: AppColor.armyGreen,
                                  backgroundColor: AppColor.lightArmyGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Text('GIFT'),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  foregroundColor: Colors.white,
                                  backgroundColor: AppColor.armyGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Text('ADD TO CART'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, i) => const SizedBox(height: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectCurrency(int index) {
    setState(() {
      _selectedCountries[0] = index == 0;
      _selectedCountries[1] = index == 1;
    });
  }
}
