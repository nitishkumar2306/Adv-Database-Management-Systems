# Adv-Database-Management-Systems

**Introduction**

The Social Media Database System project aims to provide social media data management solutions for a diverse range of clients. To achieve this, the project proposes the development of an Online Social Media Relational Database (OSMRD) that facilitates the organization, storage, retrieval, and analysis of data generated through various social media interactions and activities. The OSMRD will store user data, social connections and interactions, and groups and enforce data integrity and consistency, scalability and performance, data backup and recovery, and interoperability and integration. The project also provides the SQL code for creating tables and foreign key constraints for user accounts, user profiles, friends, posts, groups, and comments. Overall, the project aims to provide a robust and efficient database system for social media platforms, applications, and services.

**Application Background**

Online Social Media Relational Database (OSMRD) is a versatile and dynamic organization with an in-depth understanding of the social media landscape. Catering to a diverse range of clients, from SMBs and large corporations to government agencies and individual influencers, OSMRD offers tailored solutions and expert guidance to help clients achieve their unique objectives in the fast-paced world of social media.

**Application Scope and Requirements**

The Online Social Media Relational Database (OSMRD) is designed to provide a robust and efficient data storage and management solution for social media platforms, applications, and services. The primary focus of the OSMRD is to facilitate the organization, storage, retrieval, and analysis of data generated through various social media interactions and activities.

The scope of the OSMRD includes, but is not limited to:

User data: The database will store user information, such as userID, first name, last name, account_creation_date, Number_of_connections, group_name, groupID, group_admin, group_created_date, to facilitate user communication.

Social connections and interactions: The database will manage data related to user connections, such as friend lists and groups, as well as social interactions, including direct messages and group messages.

To ensure the effective implementation of the OSMRD, the following requirements must be addressed:
Data integrity and consistency: The database must enforce referential integrity, unique constraints, and validation rules to maintain data quality and consistency across different tables and relationships.

Scalability and performance: The database must be designed to handle a growing volume of users, content, and interactions, ensuring efficient query execution and minimal latency.

Data backup and recovery: The database must support reliable data backup and recovery mechanisms to safeguard against data loss and ensure business continuity in case of system failures or disasters.

Interoperability and integration: The database must be compatible with various social media platforms, APIs, and services, enabling seamless data exchange and integration with other systems and applications.




**Business Rules:**
    1. User accounts: Each user can have only one account
    2. User profiles: Each user must have a profile that includes basic information such as their name, birth date, account created date, location, number of friends, occupation
    3. Friends: Users can have 0 or more friends
    4. Posts: Users can create posts on the platform. It can include text, images, videos, links, and other media. Users can comment on posts
    5. Groups: Users can create and join groups, which are communities centered. Users can post in groups, and members can comment on and share posts. Groups should have more than        2 users
