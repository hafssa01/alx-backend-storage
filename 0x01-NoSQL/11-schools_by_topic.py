#!/usr/bin/env python3
""" 11-schools_by_topic """

def schools_by_topic(mongo_collection, topic):
    """Return a list of schools that have a specific topic."""
    return list(mongo_collection.find({"topics": topic}))
