import 'package:deshi_mart/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';

class BrandsSettings extends StatelessWidget {
  const BrandsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 10),
              Text(
                "Brand Details",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.business_outlined),
                hintText: "Brand Name"),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.text_decrease), hintText: "Description"),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "Admin Name",
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.settings),
              hintText: "Other filed name",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.settings),
              hintText: "Other filed name",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.settings),
              hintText: "Other filed name",
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryButton(
                name: "Edit",
                icon: Icons.save,
                onTap: () {},
                color: Colors.blue,
              ),
              SizedBox(width: 20),
              PrimaryButton(
                name: "Save",
                icon: Icons.save,
                onTap: () {},
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          )
        ],
      ),
    );
  }
}
