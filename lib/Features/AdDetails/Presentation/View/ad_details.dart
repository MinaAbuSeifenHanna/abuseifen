import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/AdDetails/Presentation/Widgets/ad_card.dart';

class AdDetails extends StatelessWidget {
  const AdDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            GenralAppbar(
              title: 'joshua_l The game in s...',
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              '07-11-2024 → 08-10-2024',
              style: theme.labelSmall,
            ).setCenter(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AdCard(
                    children: [
                      Text(
                        'Budget',
                        style: theme.labelMedium,
                      ),
                      Text(
                        '\$10',
                        style: theme.labelMedium,
                      ),
                      Text(
                        '\$8.36 remaining',
                        style: theme.labelMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.sp),
                Expanded(
                  child: AdCard(
                    children: [
                      Text(
                        'Campaign',
                        style: theme.labelMedium,
                      ),
                      Text(
                        '30',
                        style: theme.labelMedium,
                      ),
                      Text(
                        '25 day(s) remaining',
                        style: theme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            AdCard(
              children: [
                Text(
                  'Estimated reach',
                  style: theme.labelMedium,
                ),
                Text(
                  '1000',
                  style: theme.labelMedium,
                ),
                Text(
                  '9 shares',
                  style: theme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            Image.asset(ImageStrings.ad_chart),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AdCard(
                      children: [
                        Text(
                          'TOTAL COST',
                          style: theme.labelMedium,
                        ),
                        Text(
                          '1.64',
                          style: theme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.sp),
                  Expanded(
                    child: AdCard(
                      children: [
                        Text(
                          'TOTAL SHARES',
                          style: theme.labelMedium,
                        ),
                        Text(
                          '9',
                          style: theme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.sp),
                  Expanded(
                    child: AdCard(
                      children: [
                        Text(
                          'TOTAL VIEWS',
                          style: theme.labelMedium,
                        ),
                        Text(
                          '14',
                          style: theme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AdCard(
                      children: [
                        Text(
                          'TOTAL LEADS',
                          style: theme.labelMedium,
                        ),
                        Text(
                          '10',
                          style: theme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.sp),
                  Expanded(
                    child: AdCard(
                      children: [
                        Text(
                          'TOTAL CTR',
                          style: theme.labelMedium,
                        ),
                        Text(
                          '71.4%',
                          style: theme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    'City',
                    style: theme.titleMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Visit',
                    style: theme.titleMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Share',
                    style: theme.titleMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Click',
                    style: theme.titleMedium,
                  ),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('ta\'if',style: theme.bodyMedium,)),
                  DataCell(Text('20',style: theme.bodyMedium,)),
                  DataCell(Text('10',style: theme.bodyMedium,)),
                  DataCell(Text('30',style: theme.bodyMedium,)),
                ]),
                DataRow(cells: [
                  DataCell(Text('dammam',style: theme.bodyMedium,)),
                  DataCell(Text('40',style: theme.bodyMedium,)),
                  DataCell(Text('32',style: theme.bodyMedium,)),
                  DataCell(Text('3',style: theme.bodyMedium,)),
                ]),
                DataRow(cells: [
                  DataCell(Text('al qatif',style: theme.bodyMedium,)),
                  DataCell(Text('12',style: theme.bodyMedium,)),
                  DataCell(Text('2',style: theme.bodyMedium,)),
                  DataCell(Text('10',style: theme.bodyMedium,)),
                ]),
                DataRow(cells: [
                  DataCell(Text('dhahran',style: theme.bodyMedium,)),
                  DataCell(Text('30',style: theme.bodyMedium,)),
                  DataCell(Text('15',style: theme.bodyMedium,)),
                  DataCell(Text('13',style: theme.bodyMedium,)),
                ]),
              ],
            ),
          ],
        ).setHorizontalPadding(context, 0.03),
      ),
    );
  }
}
