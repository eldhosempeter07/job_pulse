import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'job_detail_screen.dart';

class JobListing {
  final String key;
  final String company;
  final String? companyLogo;
  final String description;
  final String location;
  final String position;

  JobListing({
    required this.key,
    required this.company,
    this.companyLogo,
    required this.description,
    required this.location,
    required this.position,
  });

  factory JobListing.fromJson(Map<String, dynamic> json) {
    return JobListing(
      key: json['key'],
      company: json['company'],
      companyLogo: json['companyLogo'],
      description: json['description'],
      location: json['location'],
      position: json['position'],
    );
  }
}

class JobListingsScreen extends StatefulWidget {
  const JobListingsScreen({Key? key}) : super(key: key);

  @override
  _JobListingsScreenState createState() => _JobListingsScreenState();
}

class _JobListingsScreenState extends State<JobListingsScreen> {
  List<JobListing> jobListings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJobListings();
  }

  Future<void> fetchJobListings() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://job-finding-68663-default-rtdb.firebaseio.com/jobListings.json',
        ),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final List<JobListing> fetchedListings = [];
        data.forEach((key, value) {
          fetchedListings.add(JobListing.fromJson({
            'key': key,
            ...value,
          }));
        });
        setState(() {
          jobListings = fetchedListings;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load job listings');
      }
    } catch (error) {
      print('Error fetching job listings: $error');
      // Handle error or show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: jobListings.length,
        itemBuilder: (context, index) {
          final job = jobListings[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 24,
              child: buildImageWidget(job.companyLogo),
            ),
            title: Text(job.position),
            subtitle: Text(job.company),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(job: job),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildImageWidget(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return CircleAvatar(
        child: Icon(Icons.business),
        backgroundColor: Colors.grey,
      );
    }
    return ClipOval(
      child: Image.network(
        imageUrl,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return CircleAvatar(
            child: Icon(Icons.error),
            backgroundColor: Colors.red,
          );
        },
      ),
    );
  }
}
