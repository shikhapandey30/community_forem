-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: community_runner_development
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "active_admin_comments"
--

DROP TABLE IF EXISTS "active_admin_comments";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "active_admin_comments" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "namespace" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "body" text COLLATE utf8_unicode_ci,
  "resource_id" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  "resource_type" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  "author_id" int(11) DEFAULT NULL,
  "author_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "index_active_admin_comments_on_namespace" ("namespace"),
  KEY "index_active_admin_comments_on_author_type_and_author_id" ("author_type","author_id"),
  KEY "index_active_admin_comments_on_resource_type_and_resource_id" ("resource_type","resource_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "activities"
--

DROP TABLE IF EXISTS "activities";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "activities" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "trackable_id" int(11) DEFAULT NULL,
  "trackable_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "owner_id" int(11) DEFAULT NULL,
  "owner_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "key" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "parameters" text COLLATE utf8_unicode_ci,
  "recipient_id" int(11) DEFAULT NULL,
  "recipient_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "index_activities_on_trackable_id_and_trackable_type" ("trackable_id","trackable_type"),
  KEY "index_activities_on_owner_id_and_owner_type" ("owner_id","owner_type"),
  KEY "index_activities_on_recipient_id_and_recipient_type" ("recipient_id","recipient_type")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "admin_users"
--

DROP TABLE IF EXISTS "admin_users";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "admin_users" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "email" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "encrypted_password" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "reset_password_token" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "reset_password_sent_at" datetime DEFAULT NULL,
  "remember_created_at" datetime DEFAULT NULL,
  "sign_in_count" int(11) NOT NULL DEFAULT '0',
  "current_sign_in_at" datetime DEFAULT NULL,
  "last_sign_in_at" datetime DEFAULT NULL,
  "current_sign_in_ip" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "last_sign_in_ip" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_admin_users_on_email" ("email"),
  UNIQUE KEY "index_admin_users_on_reset_password_token" ("reset_password_token")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "attachments"
--

DROP TABLE IF EXISTS "attachments";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "attachments" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "file" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "attachable_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "attachable_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "authenticates"
--

DROP TABLE IF EXISTS "authenticates";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "authenticates" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "uid" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "provider" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "categorables"
--

DROP TABLE IF EXISTS "categorables";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "categorables" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "categorable_id" int(11) DEFAULT NULL,
  "categorable_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "category_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "categories"
--

DROP TABLE IF EXISTS "categories";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "categories" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "comments"
--

DROP TABLE IF EXISTS "comments";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "comments" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) DEFAULT NULL,
  "post_id" int(11) DEFAULT NULL,
  "title" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "body" text COLLATE utf8_unicode_ci,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "commentable_id" int(11) DEFAULT NULL,
  "commentable_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "conversations"
--

DROP TABLE IF EXISTS "conversations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "conversations" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "sender_id" int(11) DEFAULT NULL,
  "recipient_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "courses"
--

DROP TABLE IF EXISTS "courses";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "courses" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "education_history_id" int(11) DEFAULT NULL,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "education_histories"
--

DROP TABLE IF EXISTS "education_histories";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "education_histories" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) DEFAULT NULL,
  "specialization_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "employment_details"
--

DROP TABLE IF EXISTS "employment_details";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "employment_details" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) DEFAULT NULL,
  "total_experience" float DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "followings"
--

DROP TABLE IF EXISTS "followings";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "followings" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "follower_id" int(11) DEFAULT NULL,
  "following_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "forum_polls"
--

DROP TABLE IF EXISTS "forum_polls";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "forum_polls" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "category_id" int(11) DEFAULT NULL,
  "topic" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "body" text COLLATE utf8_unicode_ci,
  "visibility" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "start_date" datetime DEFAULT NULL,
  "end_date" datetime DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "topic_id" int(11) DEFAULT NULL,
  "attachement" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "forums"
--

DROP TABLE IF EXISTS "forums";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "forums" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "description" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "institutes"
--

DROP TABLE IF EXISTS "institutes";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "institutes" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "education_history_id" int(11) DEFAULT NULL,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "passing_year" date DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "likes"
--

DROP TABLE IF EXISTS "likes";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "likes" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) DEFAULT NULL,
  "likable_id" int(11) DEFAULT NULL,
  "likable_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "messages"
--

DROP TABLE IF EXISTS "messages";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "messages" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "body" text COLLATE utf8_unicode_ci,
  "conversation_id" int(11) DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id"),
  KEY "index_messages_on_conversation_id" ("conversation_id"),
  KEY "index_messages_on_user_id" ("user_id"),
  CONSTRAINT "fk_rails_273a25a7a6" FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
  CONSTRAINT "fk_rails_7f927086d2" FOREIGN KEY ("conversation_id") REFERENCES "conversations" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "notifications"
--

DROP TABLE IF EXISTS "notifications";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "notifications" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "notifictaion_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "organisations"
--

DROP TABLE IF EXISTS "organisations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "organisations" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "employment_detail_id" int(11) DEFAULT NULL,
  "designation" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "start_date" date DEFAULT NULL,
  "end_date" date DEFAULT NULL,
  "current_company" tinyint(1) DEFAULT NULL,
  "job_profile" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "posts"
--

DROP TABLE IF EXISTS "posts";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "posts" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) DEFAULT NULL,
  "category_id" int(11) DEFAULT NULL,
  "title" text COLLATE utf8_unicode_ci,
  "post_text" text COLLATE utf8_unicode_ci,
  "file" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "visibility" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "expiration_date" datetime DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "topic_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "profiles"
--

DROP TABLE IF EXISTS "profiles";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "profiles" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "first_name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "last_name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "gender" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "image" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "phone_no" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "location" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "dob" date DEFAULT NULL,
  "screen_name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "specialization_id" int(11) DEFAULT NULL,
  "street" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "post_code" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "city" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "country" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "profile_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "ethnic_group" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "schema_migrations"
--

DROP TABLE IF EXISTS "schema_migrations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "schema_migrations" (
  "version" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY "unique_schema_migrations" ("version")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "skills"
--

DROP TABLE IF EXISTS "skills";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "skills" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "user_skill_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "specializations"
--

DROP TABLE IF EXISTS "specializations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "specializations" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "static_pages"
--

DROP TABLE IF EXISTS "static_pages";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "static_pages" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "help_center" text COLLATE utf8_unicode_ci,
  "terms_and_conditions" text COLLATE utf8_unicode_ci,
  "privacy_policy" text COLLATE utf8_unicode_ci,
  "how_it_work" text COLLATE utf8_unicode_ci,
  "facebook_link" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "twitter_link" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "google_link" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "about_us" text COLLATE utf8_unicode_ci,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "subscriptions"
--

DROP TABLE IF EXISTS "subscriptions";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "subscriptions" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "subscribe" tinyint(1) DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "topics"
--

DROP TABLE IF EXISTS "topics";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "topics" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "forum_id" int(11) DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "description" text COLLATE utf8_unicode_ci,
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "file" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "category_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "user_skills"
--

DROP TABLE IF EXISTS "user_skills";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "user_skills" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "users"
--

DROP TABLE IF EXISTS "users";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "users" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "email" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "encrypted_password" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "reset_password_token" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "reset_password_sent_at" datetime DEFAULT NULL,
  "remember_created_at" datetime DEFAULT NULL,
  "sign_in_count" int(11) NOT NULL DEFAULT '0',
  "current_sign_in_at" datetime DEFAULT NULL,
  "last_sign_in_at" datetime DEFAULT NULL,
  "current_sign_in_ip" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "last_sign_in_ip" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "specialization_id" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "confirmation_token" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "confirmed_at" datetime DEFAULT NULL,
  "confirmation_sent_at" datetime DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_users_on_email" ("email"),
  UNIQUE KEY "index_users_on_reset_password_token" ("reset_password_token"),
  UNIQUE KEY "index_users_on_confirmation_token" ("confirmation_token")
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "votes"
--

DROP TABLE IF EXISTS "votes";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "votes" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) DEFAULT NULL,
  "forum_poll_id" int(11) DEFAULT NULL,
  "votable_id" int(11) DEFAULT NULL,
  "votable_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "vote_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-20 17:55:32
INSERT INTO schema_migrations (version) VALUES ('20151008053019');

INSERT INTO schema_migrations (version) VALUES ('20151008064344');

INSERT INTO schema_migrations (version) VALUES ('20151008064450');

INSERT INTO schema_migrations (version) VALUES ('20151008064556');

INSERT INTO schema_migrations (version) VALUES ('20151008083827');

INSERT INTO schema_migrations (version) VALUES ('20151008083832');

INSERT INTO schema_migrations (version) VALUES ('20151008100022');

INSERT INTO schema_migrations (version) VALUES ('20151008100114');

INSERT INTO schema_migrations (version) VALUES ('20151008100943');

INSERT INTO schema_migrations (version) VALUES ('20151008101141');

INSERT INTO schema_migrations (version) VALUES ('20151008101401');

INSERT INTO schema_migrations (version) VALUES ('20151008110159');

INSERT INTO schema_migrations (version) VALUES ('20151008111624');

INSERT INTO schema_migrations (version) VALUES ('20151008124231');

INSERT INTO schema_migrations (version) VALUES ('20151009045705');

INSERT INTO schema_migrations (version) VALUES ('20151012084715');

INSERT INTO schema_migrations (version) VALUES ('20151012092513');

INSERT INTO schema_migrations (version) VALUES ('20151012095924');

INSERT INTO schema_migrations (version) VALUES ('20151012101813');

INSERT INTO schema_migrations (version) VALUES ('20151012101834');

INSERT INTO schema_migrations (version) VALUES ('20151012115224');

INSERT INTO schema_migrations (version) VALUES ('20151013051538');

INSERT INTO schema_migrations (version) VALUES ('20151013052041');

INSERT INTO schema_migrations (version) VALUES ('20151013052314');

INSERT INTO schema_migrations (version) VALUES ('20151013100756');

INSERT INTO schema_migrations (version) VALUES ('20151013101033');

INSERT INTO schema_migrations (version) VALUES ('20151013104249');

INSERT INTO schema_migrations (version) VALUES ('20151014104748');

INSERT INTO schema_migrations (version) VALUES ('20151014124710');

INSERT INTO schema_migrations (version) VALUES ('20151014125624');

INSERT INTO schema_migrations (version) VALUES ('20151016044249');

INSERT INTO schema_migrations (version) VALUES ('20151016120055');

INSERT INTO schema_migrations (version) VALUES ('20151019044404');

INSERT INTO schema_migrations (version) VALUES ('20151019071557');

INSERT INTO schema_migrations (version) VALUES ('20151019072648');

INSERT INTO schema_migrations (version) VALUES ('20151019073751');

INSERT INTO schema_migrations (version) VALUES ('20151019091137');

INSERT INTO schema_migrations (version) VALUES ('20151019092936');

INSERT INTO schema_migrations (version) VALUES ('20151019101956');

INSERT INTO schema_migrations (version) VALUES ('20151019114834');

INSERT INTO schema_migrations (version) VALUES ('20151020071232');

INSERT INTO schema_migrations (version) VALUES ('20151020071414');

INSERT INTO schema_migrations (version) VALUES ('20151020092007');

INSERT INTO schema_migrations (version) VALUES ('20151020093852');

