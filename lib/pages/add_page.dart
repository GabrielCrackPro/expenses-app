import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_app/services/db.dart';
import 'package:expenses_app/widgets/category_selector/category_selector.dart';
import 'package:expenses_app/widgets/numpad/numpad.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    void addExpense() async {
      // TODO: Add expense data
      Map<String, dynamic> expenseData = {};
      await DbUtils.addExpense(_auth.currentUser!, expenseData);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: colors.onBackground,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100.0,
              child: CategorySelector(
                selected: "shopping",
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Numpad(),
                  MaterialButton(
                    color: colors.primary,
                    height: 71,
                    minWidth: MediaQuery.of(context).size.width,
                    elevation: 0,
                    onPressed: () => addExpense(),
                    child: Text(
                      "Add expense",
                      style: TextStyle(fontSize: 30, color: colors.onPrimary),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
