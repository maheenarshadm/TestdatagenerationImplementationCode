CREATE TABLE `mdl_adminpresets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `comments` LONGTEXT NULL,
    `site` VARCHAR(255) NOT NULL,
    `author` VARCHAR(255) NULL,
    `moodleversion` VARCHAR(20) NOT NULL,
    `moodlerelease` VARCHAR(255) NOT NULL,
    `iscore` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether this is a core preset or not, and which core preset',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timeimported` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store presets data';

CREATE TABLE `mdl_adminpresets_app` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `adminpresetid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `time` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `adminpresetid` (`adminpresetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Applied presets';

CREATE TABLE `mdl_adminpresets_app_it` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `adminpresetapplyid` BIGINT NOT NULL,
    `configlogid` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `configlogid` (`configlogid`),
    KEY `adminpresetapplyid` (`adminpresetapplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Admin presets applied items. To maintain the relation with config_log';

CREATE TABLE `mdl_adminpresets_app_it_a` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `adminpresetapplyid` BIGINT NOT NULL,
    `configlogid` BIGINT NOT NULL,
    `itemname` VARCHAR(100) NULL COMMENT 'Necessary to rollback',
    PRIMARY KEY (`id`),
    KEY `configlogid` (`configlogid`),
    KEY `adminpresetapplyid` (`adminpresetapplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Attributes of the applied items';

CREATE TABLE `mdl_adminpresets_app_plug` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `adminpresetapplyid` BIGINT NOT NULL,
    `plugin` VARCHAR(100) NULL,
    `name` VARCHAR(100) NOT NULL,
    `value` SMALLINT NOT NULL DEFAULT 0,
    `oldvalue` SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `adminpresetapplyid` (`adminpresetapplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Admin presets plugins applied';

CREATE TABLE `mdl_adminpresets_it` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `adminpresetid` BIGINT NOT NULL,
    `plugin` VARCHAR(100) NULL,
    `name` VARCHAR(100) NOT NULL,
    `value` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `adminpresetid` (`adminpresetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store settings';

CREATE TABLE `mdl_adminpresets_it_a` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `itemid` BIGINT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `value` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `itemid` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Admin presets items attributes. For settings with attributes (extra values like ''advanced'')';

CREATE TABLE `mdl_adminpresets_plug` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `adminpresetid` BIGINT NOT NULL,
    `plugin` VARCHAR(100) NULL,
    `name` VARCHAR(100) NOT NULL,
    `enabled` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Whether this plugins is currently enabled.',
    PRIMARY KEY (`id`),
    KEY `adminpresetid` (`adminpresetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Admin presets plugins status, to store information about whether they are enabled or not';

CREATE TABLE `mdl_analytics_indicator_calc` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `starttime` BIGINT NOT NULL,
    `endtime` BIGINT NOT NULL,
    `contextid` BIGINT NOT NULL,
    `sampleorigin` VARCHAR(255) NOT NULL,
    `sampleid` BIGINT NOT NULL,
    `indicator` VARCHAR(255) NOT NULL,
    `value` DECIMAL(10,2) NULL COMMENT 'The calculated value, it can be null.',
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `starttime-endtime-contextid` (`starttime`, `endtime`, `contextid`),
    CONSTRAINT `mdl_analytics_indicator_calc_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stored indicator calculations';

CREATE TABLE `mdl_analytics_models` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `enabled` TINYINT NOT NULL DEFAULT 0,
    `trained` TINYINT NOT NULL DEFAULT 0,
    `name` VARCHAR(1333) NULL COMMENT 'Explicit name of the model, the localised target name is used when left empty',
    `target` VARCHAR(255) NOT NULL,
    `indicators` LONGTEXT NOT NULL,
    `timesplitting` VARCHAR(255) NULL,
    `predictionsprocessor` VARCHAR(255) NULL,
    `version` BIGINT NOT NULL,
    `contextids` LONGTEXT NULL COMMENT 'The model will be restricted to this contexts',
    `timecreated` BIGINT NULL,
    `timemodified` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `enabledandtrained` (`enabled`, `trained`),
    CONSTRAINT `mdl_analytics_models_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Analytic models.';

CREATE TABLE `mdl_analytics_models_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `modelid` BIGINT NOT NULL,
    `version` BIGINT NOT NULL,
    `evaluationmode` VARCHAR(50) NOT NULL,
    `target` VARCHAR(255) NOT NULL,
    `indicators` LONGTEXT NOT NULL,
    `timesplitting` VARCHAR(255) NULL,
    `score` DECIMAL(10,5) NOT NULL DEFAULT 0,
    `info` LONGTEXT NULL,
    `dir` LONGTEXT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_analytics_models_log_modelid_fk` FOREIGN KEY (`modelid`) REFERENCES `mdl_analytics_models` (`id`),
    CONSTRAINT `mdl_analytics_models_log_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Analytic models changes during evaluation.';

CREATE TABLE `mdl_analytics_predict_samples` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `modelid` BIGINT NOT NULL,
    `analysableid` BIGINT NOT NULL,
    `timesplitting` VARCHAR(255) NOT NULL,
    `rangeindex` BIGINT NOT NULL,
    `sampleids` LONGTEXT NOT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `modelidandanalysableidandtimesplittingandrangeindex` (`modelid`, `analysableid`, `timesplitting`, `rangeindex`),
    CONSTRAINT `mdl_analytics_predict_samples_modelid_fk` FOREIGN KEY (`modelid`) REFERENCES `mdl_analytics_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Samples already used for predictions.';

CREATE TABLE `mdl_analytics_prediction_actions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `predictionid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `actionname` VARCHAR(255) NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `predictionidanduseridandactionname` (`predictionid`, `userid`, `actionname`),
    CONSTRAINT `mdl_analytics_prediction_actions_predictionid_fk` FOREIGN KEY (`predictionid`) REFERENCES `mdl_analytics_predictions` (`id`),
    CONSTRAINT `mdl_analytics_prediction_actions_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Register of user actions over predictions.';

CREATE TABLE `mdl_analytics_predictions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `modelid` BIGINT NOT NULL,
    `contextid` BIGINT NOT NULL,
    `sampleid` BIGINT NOT NULL,
    `rangeindex` MEDIUMINT NOT NULL,
    `prediction` DECIMAL(10,2) NOT NULL,
    `predictionscore` DECIMAL(10,5) NOT NULL,
    `calculations` LONGTEXT NOT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timestart` BIGINT NULL,
    `timeend` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `modelidandcontextid` (`modelid`, `contextid`),
    CONSTRAINT `mdl_analytics_predictions_modelid_fk` FOREIGN KEY (`modelid`) REFERENCES `mdl_analytics_models` (`id`),
    CONSTRAINT `mdl_analytics_predictions_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Predictions';

CREATE TABLE `mdl_analytics_train_samples` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `modelid` BIGINT NOT NULL,
    `analysableid` BIGINT NOT NULL,
    `timesplitting` VARCHAR(255) NOT NULL,
    `sampleids` LONGTEXT NOT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `modelidandanalysableidandtimesplitting` (`modelid`, `analysableid`, `timesplitting`),
    CONSTRAINT `mdl_analytics_train_samples_modelid_fk` FOREIGN KEY (`modelid`) REFERENCES `mdl_analytics_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Samples used for training';

CREATE TABLE `mdl_analytics_used_analysables` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `modelid` BIGINT NOT NULL,
    `action` VARCHAR(50) NOT NULL,
    `analysableid` BIGINT NOT NULL,
    `firstanalysis` BIGINT NOT NULL,
    `timeanalysed` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `modelid-action` (`modelid`, `action`),
    KEY `analysableid` (`analysableid`),
    CONSTRAINT `mdl_analytics_used_analysables_modelid_fk` FOREIGN KEY (`modelid`) REFERENCES `mdl_analytics_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of analysables used by each model';

CREATE TABLE `mdl_analytics_used_files` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `modelid` BIGINT NOT NULL DEFAULT 0,
    `fileid` BIGINT NOT NULL DEFAULT 0,
    `action` VARCHAR(50) NOT NULL,
    `time` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `modelidandactionandfileid` (`modelid`, `action`, `fileid`),
    CONSTRAINT `mdl_analytics_used_files_modelid_fk` FOREIGN KEY (`modelid`) REFERENCES `mdl_analytics_models` (`id`),
    CONSTRAINT `mdl_analytics_used_files_fileid_fk` FOREIGN KEY (`fileid`) REFERENCES `mdl_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Files that have already been used for training and prediction.';

CREATE TABLE `mdl_assign` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL COMMENT 'The name of the instance of the assignment. Displayed at the top of each page.',
    `intro` LONGTEXT NOT NULL COMMENT 'The description of the assignment. This field is used by feature MOD_INTRO.',
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of the description field of the assignment. This field is used by feature MOD_INTRO.',
    `alwaysshowdescription` TINYINT NOT NULL DEFAULT 0 COMMENT 'If false the assignment intro will only be displayed after the allowsubmissionsfrom date. If true it will always be displayed.',
    `nosubmissions` TINYINT NOT NULL DEFAULT 0 COMMENT 'This field is a cache for is_any_submission_plugin_enabled() which allows Moodle pages to distinguish offline assignment types without loading the assignment class.',
    `submissiondrafts` TINYINT NOT NULL DEFAULT 0 COMMENT 'If true, assignment submissions will be considered drafts until the student clicks on the submit assignmnet button.',
    `sendnotifications` TINYINT NOT NULL DEFAULT 0 COMMENT 'Allows the disabling of email notifications in the assign module.',
    `sendlatenotifications` TINYINT NOT NULL DEFAULT 0 COMMENT 'Allows separate enabling of notifications for late assignment submissions.',
    `duedate` BIGINT NOT NULL DEFAULT 0 COMMENT 'The due date for the assignment. Displayed to students.',
    `allowsubmissionsfromdate` BIGINT NOT NULL DEFAULT 0 COMMENT 'If set, submissions will only be accepted after this date.',
    `grade` BIGINT NOT NULL DEFAULT 0 COMMENT 'The maximum grade for this assignment. Can be negative to indicate the use of a scale.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time the settings for this assign module instance were last modified.',
    `requiresubmissionstatement` TINYINT NOT NULL DEFAULT 0 COMMENT 'Forces the student to accept a submission statement when submitting an assignment',
    `completionsubmit` TINYINT NOT NULL DEFAULT 0 COMMENT 'If this field is set to 1, then the activity will be automatically marked as ''complete'' once the user submits their assignment.',
    `cutoffdate` BIGINT NOT NULL DEFAULT 0 COMMENT 'The final date after which submissions will no longer be accepted for this assignment without an extensions.',
    `gradingduedate` BIGINT NOT NULL DEFAULT 0 COMMENT 'The expected date for marking the submissions.',
    `teamsubmission` TINYINT NOT NULL DEFAULT 0 COMMENT 'Do students submit in teams?',
    `requireallteammemberssubmit` TINYINT NOT NULL DEFAULT 0 COMMENT 'If enabled, a submission will not be accepted until all team members have submitted it.',
    `teamsubmissiongroupingid` BIGINT NOT NULL DEFAULT 0 COMMENT 'A grouping id to get groups for team submissions',
    `blindmarking` TINYINT NOT NULL DEFAULT 0 COMMENT 'Hide student/grader identities until the reveal identities action is performed',
    `hidegrader` TINYINT NOT NULL DEFAULT 0 COMMENT 'Hide the grader''s identity from students. The opposite of blind marking.',
    `revealidentities` TINYINT NOT NULL DEFAULT 0 COMMENT 'Show identities for a blind marking assignment',
    `attemptreopenmethod` VARCHAR(10) NOT NULL DEFAULT 'none' COMMENT 'How to determine when students are allowed to open a new submission. Valid options are none, manual, untilpass',
    `maxattempts` MEDIUMINT NOT NULL DEFAULT -1 COMMENT 'What is the maximum number of student attempts allowed for this assignment? -1 means unlimited.',
    `markingworkflow` TINYINT NOT NULL DEFAULT 0 COMMENT 'If enabled, marking workflow features will be used in this assignment.',
    `markingallocation` TINYINT NOT NULL DEFAULT 0 COMMENT 'If enabled, marking allocation features will be used in this assignment',
    `sendstudentnotifications` TINYINT NOT NULL DEFAULT 1 COMMENT 'Default for send student notifications checkbox when grading.',
    `preventsubmissionnotingroup` TINYINT NOT NULL DEFAULT 0 COMMENT 'If enabled a user will be unable to make a submission unless they are a member of a group.',
    `activity` LONGTEXT NULL,
    `activityformat` SMALLINT NOT NULL DEFAULT 0,
    `timelimit` BIGINT NOT NULL DEFAULT 0,
    `submissionattachments` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`),
    KEY `teamsubmissiongroupingid` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table saves information about an instance of mod_assign in a course.';

CREATE TABLE `mdl_assign_grades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time the assignment submission was first modified by a grader.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The most recent modification time for the assignment submission by a grader.',
    `grader` BIGINT NOT NULL DEFAULT 0,
    `grade` DECIMAL(10,5) NULL DEFAULT 0 COMMENT 'The numerical grade for this assignment submission. Can be determined by scales/advancedgradingforms etc but will always be converted back to a floating point number.',
    `attemptnumber` BIGINT NOT NULL DEFAULT 0 COMMENT 'The attempt number that this grade relates to',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniqueattemptgrade` (`assignment`, `userid`, `attemptnumber`),
    KEY `userid` (`userid`),
    KEY `attemptnumber` (`attemptnumber`),
    CONSTRAINT `mdl_assign_grades_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Grading information about a single assignment submission.';

CREATE TABLE `mdl_assign_overrides` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references assign.id',
    `groupid` BIGINT NULL COMMENT 'Foreign key references groups.id.  Can be null if this is a per-user override.',
    `userid` BIGINT NULL COMMENT 'Foreign key references user.id.  Can be null if this is a per-group override.',
    `sortorder` BIGINT NULL COMMENT 'Rank for sorting overrides.',
    `allowsubmissionsfromdate` BIGINT NULL COMMENT 'Time at which students may start attempting this assign. Can be null, in which case the assign default is used.',
    `duedate` BIGINT NULL COMMENT 'Time by which students must have completed their attempt.  Can be null, in which case the assign default is used.',
    `cutoffdate` BIGINT NULL COMMENT 'Time by which students must have completed their attempt.  Can be null, in which case the assign default is used.',
    `timelimit` BIGINT NULL COMMENT 'Time limit in seconds. Can be null, in which case the quiz default is used.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_assign_overrides_assignid_fk` FOREIGN KEY (`assignid`) REFERENCES `mdl_assign` (`id`),
    CONSTRAINT `mdl_assign_overrides_groupid_fk` FOREIGN KEY (`groupid`) REFERENCES `mdl_groups` (`id`),
    CONSTRAINT `mdl_assign_overrides_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The overrides to assign settings.';

CREATE TABLE `mdl_assign_plugin_config` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `plugin` VARCHAR(28) NOT NULL,
    `subtype` VARCHAR(28) NOT NULL,
    `name` VARCHAR(28) NOT NULL,
    `value` LONGTEXT NULL COMMENT 'The value of the config setting. Stored as text but can be interpreted by the plugin however it likes.',
    PRIMARY KEY (`id`),
    KEY `plugin` (`plugin`),
    KEY `subtype` (`subtype`),
    KEY `name` (`name`),
    CONSTRAINT `mdl_assign_plugin_config_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Config data for an instance of a plugin in an assignment.';

CREATE TABLE `mdl_assign_submission` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time of the first student submission to this assignment.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The last time this assignment submission was modified by a student.',
    `timestarted` BIGINT NULL COMMENT 'The time when the student stared the submission.',
    `status` VARCHAR(10) NULL COMMENT 'The status of this assignment submission. The current statuses are DRAFT and SUBMITTED.',
    `groupid` BIGINT NOT NULL DEFAULT 0 COMMENT 'The group id for team submissions',
    `attemptnumber` BIGINT NOT NULL DEFAULT 0 COMMENT 'Used to track attempts for an assignment',
    `latest` TINYINT NOT NULL DEFAULT 0 COMMENT 'Greatly simplifies queries wanting to know information about only the latest attempt.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniqueattemptsubmission` (`assignment`, `userid`, `groupid`, `attemptnumber`),
    KEY `userid` (`userid`),
    KEY `attemptnumber` (`attemptnumber`),
    KEY `latestattempt` (`assignment`, `userid`, `groupid`, `latest`),
    CONSTRAINT `mdl_assign_submission_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table keeps information about student interactions with the mod/assign. This is limited to metadata about a student submission but does not include the submission itself which is stored by plugins.';

CREATE TABLE `mdl_assign_user_flags` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'The id of the user these flags apply to.',
    `assignment` BIGINT NOT NULL DEFAULT 0 COMMENT 'The assignment these flags apply to.',
    `locked` BIGINT NOT NULL DEFAULT 0 COMMENT 'Student cannot make any changes to their submission if this flag is set.',
    `mailed` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Has the student been sent a notification about this grade update?',
    `extensionduedate` BIGINT NOT NULL DEFAULT 0 COMMENT 'An extension date assigned to an individual student.',
    `workflowstate` VARCHAR(20) NULL COMMENT 'The current workflow state of the grade',
    `allocatedmarker` BIGINT NOT NULL DEFAULT 0 COMMENT 'The allocated marker to this submission',
    PRIMARY KEY (`id`),
    KEY `mailed` (`mailed`),
    CONSTRAINT `mdl_assign_user_flags_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_assign_user_flags_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of flags that can be set for a single user in a single assignment.';

CREATE TABLE `mdl_assign_user_mapping` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_assign_user_mapping_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`),
    CONSTRAINT `mdl_assign_user_mapping_user_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Map an assignment specific id number to a user';

CREATE TABLE `mdl_assignfeedback_comments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `grade` BIGINT NOT NULL DEFAULT 0,
    `commenttext` LONGTEXT NULL COMMENT 'The feedback text',
    `commentformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The feedback text format',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_assignfeedback_comments_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`),
    CONSTRAINT `mdl_assignfeedback_comments_grade_fk` FOREIGN KEY (`grade`) REFERENCES `mdl_assign_grades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Text feedback for submitted assignments';

CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `gradeid` BIGINT NOT NULL DEFAULT 0,
    `pageno` BIGINT NOT NULL DEFAULT 0 COMMENT 'The page in the PDF that this annotation appears on',
    `x` BIGINT NULL DEFAULT 0 COMMENT 'x-position of the start of the annotation (in pixels - image resolution is set to 100 pixels per inch)',
    `y` BIGINT NULL DEFAULT 0 COMMENT 'y-position of the start of the annotation (in pixels - image resolution is set to 100 pixels per inch)',
    `endx` BIGINT NULL DEFAULT 0 COMMENT 'x-position of the end of the annotation',
    `endy` BIGINT NULL DEFAULT 0 COMMENT 'y-position of the end of the annotation',
    `path` LONGTEXT NULL COMMENT 'SVG path describing the freehand line',
    `type` VARCHAR(10) NULL DEFAULT 'line' COMMENT 'line, oval, rect, etc.',
    `colour` VARCHAR(10) NULL DEFAULT 'black' COMMENT 'Can be red, yellow, green, blue, white, black',
    `draft` TINYINT NOT NULL DEFAULT 1 COMMENT 'Is this a draft annotation?',
    PRIMARY KEY (`id`),
    KEY `gradeid_pageno` (`gradeid`, `pageno`),
    CONSTRAINT `mdl_assignfeedback_editpdf_annot_gradeid_fk` FOREIGN KEY (`gradeid`) REFERENCES `mdl_assign_grades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='stores annotations added to pdfs submitted by students';

CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `gradeid` BIGINT NOT NULL DEFAULT 0,
    `x` BIGINT NULL DEFAULT 0 COMMENT 'x-position of the top-left corner of the comment (in pixels - image resolution is set to 100 pixels per inch)',
    `y` BIGINT NULL DEFAULT 0 COMMENT 'y-position of the top-left corner of the comment (in pixels - image resolution is set to 100 pixels per inch)',
    `width` BIGINT NULL DEFAULT 120 COMMENT 'width, in pixels, of the comment box',
    `rawtext` LONGTEXT NULL COMMENT 'Raw text of the comment',
    `pageno` BIGINT NOT NULL DEFAULT 0 COMMENT 'The page in the PDF that this comment appears on',
    `colour` VARCHAR(10) NULL DEFAULT 'black' COMMENT 'Can be red, yellow, green, blue, white, black',
    `draft` TINYINT NOT NULL DEFAULT 1 COMMENT 'Is this a draft comment?',
    PRIMARY KEY (`id`),
    KEY `gradeid_pageno` (`gradeid`, `pageno`),
    CONSTRAINT `mdl_assignfeedback_editpdf_cmnt_gradeid_fk` FOREIGN KEY (`gradeid`) REFERENCES `mdl_assign_grades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores comments added to pdfs';

CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `rawtext` LONGTEXT NOT NULL,
    `width` BIGINT NOT NULL DEFAULT 120,
    `colour` VARCHAR(10) NULL DEFAULT 'yellow',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_assignfeedback_editpdf_quick_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores teacher specified quicklist comments';

CREATE TABLE `mdl_assignfeedback_editpdf_rot` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `gradeid` BIGINT NOT NULL DEFAULT 0,
    `pageno` BIGINT NOT NULL DEFAULT 0 COMMENT 'Page number',
    `pathnamehash` LONGTEXT NOT NULL COMMENT 'File path hash of the rotated page',
    `isrotated` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether the page is rotated or not',
    `degree` BIGINT NOT NULL DEFAULT 0 COMMENT 'Rotation degree',
    PRIMARY KEY (`id`),
    UNIQUE KEY `gradeid_pageno` (`gradeid`, `pageno`),
    CONSTRAINT `mdl_assignfeedback_editpdf_rot_gradeid_fk` FOREIGN KEY (`gradeid`) REFERENCES `mdl_assign_grades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores rotation information of a page.';

CREATE TABLE `mdl_assignfeedback_file` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `grade` BIGINT NOT NULL DEFAULT 0,
    `numfiles` BIGINT NOT NULL DEFAULT 0 COMMENT 'The number of files uploaded by a grader.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_assignfeedback_file_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`),
    CONSTRAINT `mdl_assignfeedback_file_grade_fk` FOREIGN KEY (`grade`) REFERENCES `mdl_assign_grades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores info about the number of files submitted by a student.';

CREATE TABLE `mdl_assignsubmission_file` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `submission` BIGINT NOT NULL DEFAULT 0,
    `numfiles` BIGINT NOT NULL DEFAULT 0 COMMENT 'The number of files the student submitted.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_assignsubmission_file_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`),
    CONSTRAINT `mdl_assignsubmission_file_submission_fk` FOREIGN KEY (`submission`) REFERENCES `mdl_assign_submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about file submissions for assignments';

CREATE TABLE `mdl_assignsubmission_onlinetext` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assignment` BIGINT NOT NULL DEFAULT 0,
    `submission` BIGINT NOT NULL DEFAULT 0,
    `onlinetext` LONGTEXT NULL COMMENT 'The text for this online text submission.',
    `onlineformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format for this online text submission.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_assignsubmission_onlinetext_assignment_fk` FOREIGN KEY (`assignment`) REFERENCES `mdl_assign` (`id`),
    CONSTRAINT `mdl_assignsubmission_onlinetext_submission_fk` FOREIGN KEY (`submission`) REFERENCES `mdl_assign_submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about onlinetext submission';

CREATE TABLE `mdl_auth_lti_linked_login` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'The user account the LTI user is linked to.',
    `issuer` LONGTEXT NOT NULL,
    `issuer256` VARCHAR(64) NOT NULL COMMENT 'SHA256 hash of the issuer from which the platform user originates.',
    `sub` VARCHAR(255) NOT NULL,
    `sub256` VARCHAR(64) NOT NULL COMMENT 'SHA256 hash of the subject identifying the user for the issuer.',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_key` (`userid`, `issuer256`, `sub256`),
    CONSTRAINT `mdl_auth_lti_linked_login_userid_key_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Accounts linked to a users Moodle account.';

CREATE TABLE `mdl_auth_oauth2_linked_login` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL COMMENT 'The user account this oauth login is linked to.',
    `issuerid` BIGINT NOT NULL,
    `username` VARCHAR(255) NOT NULL COMMENT 'The external username to map to this moodle account',
    `email` LONGTEXT NOT NULL COMMENT 'The external email to map to this moodle account',
    `confirmtoken` VARCHAR(64) NOT NULL COMMENT 'If this is not empty - the user has not confirmed their email to create the link.',
    `confirmtokenexpires` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_key` (`userid`, `issuerid`, `username`),
    KEY `search_index` (`issuerid`, `username`),
    CONSTRAINT `mdl_auth_oauth2_linked_login_usermodified_key_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_auth_oauth2_linked_login_userid_key_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_auth_oauth2_linked_login_issuerid_key_fk` FOREIGN KEY (`issuerid`) REFERENCES `mdl_oauth2_issuer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Accounts linked to a users Moodle account.';

CREATE TABLE `mdl_backup_controllers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `backupid` VARCHAR(32) NOT NULL COMMENT 'unique id of the backup',
    `operation` VARCHAR(20) NOT NULL DEFAULT 'backup' COMMENT 'Type of operation (backup/restore)',
    `type` VARCHAR(10) NOT NULL COMMENT 'Type of the backup (activity/section/course)',
    `itemid` BIGINT NOT NULL COMMENT 'id of the module/section/activity being backup',
    `format` VARCHAR(20) NOT NULL COMMENT 'format of the backup (moodle/imscc...)',
    `interactive` SMALLINT NOT NULL COMMENT 'is the backup interactive (1-yes/0-no)',
    `purpose` SMALLINT NOT NULL COMMENT 'purpose (target) of the backup (general, import, hub...)',
    `userid` BIGINT NOT NULL COMMENT 'user that owns/performs the backup',
    `status` SMALLINT NOT NULL COMMENT 'current status of the backup (configured, ui, running...)',
    `execution` SMALLINT NOT NULL COMMENT 'type of execution (immediate/delayed)',
    `executiontime` BIGINT NOT NULL COMMENT 'epoch secs when the backup should be executed (for delayed backups only)',
    `checksum` VARCHAR(32) NOT NULL COMMENT 'checksum of the backup_controller object',
    `timecreated` BIGINT NOT NULL COMMENT 'time the controller was created',
    `timemodified` BIGINT NOT NULL COMMENT 'last time the controller was modified',
    `progress` DECIMAL(15,14) NOT NULL DEFAULT 0 COMMENT 'The backup or restore progress as a floating point number',
    `controller` LONGTEXT NOT NULL COMMENT 'serialised backup_controller object',
    PRIMARY KEY (`id`),
    UNIQUE KEY `backupid_uk` (`backupid`),
    KEY `typeitem_ix` (`type`, `itemid`),
    KEY `useritem_ix` (`userid`, `itemid`),
    CONSTRAINT `mdl_backup_controllers_userid_fk_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To store the backup_controllers as they are used';

CREATE TABLE `mdl_backup_courses` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `laststarttime` BIGINT NOT NULL DEFAULT 0,
    `lastendtime` BIGINT NOT NULL DEFAULT 0,
    `laststatus` VARCHAR(1) NOT NULL DEFAULT 5,
    `nextstarttime` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To store every course backup status';

CREATE TABLE `mdl_backup_logs` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `backupid` VARCHAR(32) NOT NULL COMMENT 'backupid the log record belongs to',
    `loglevel` SMALLINT NOT NULL COMMENT 'level of the log (debug...error)',
    `message` LONGTEXT NOT NULL COMMENT 'text logged',
    `timecreated` BIGINT NOT NULL COMMENT 'timestamp this log entry was created',
    PRIMARY KEY (`id`),
    UNIQUE KEY `backupid-id` (`backupid`, `id`),
    CONSTRAINT `mdl_backup_logs_backupid_fk` FOREIGN KEY (`backupid`) REFERENCES `mdl_backup_controllers` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To store all the logs from backup and restore operations (by db logger)';

CREATE TABLE `mdl_badge` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `usercreated` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    `issuername` VARCHAR(255) NOT NULL,
    `issuerurl` VARCHAR(255) NOT NULL,
    `issuercontact` VARCHAR(255) NULL,
    `expiredate` BIGINT NULL,
    `expireperiod` BIGINT NULL,
    `type` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = site, 2 = course',
    `courseid` BIGINT NULL,
    `message` LONGTEXT NOT NULL,
    `messagesubject` LONGTEXT NOT NULL,
    `attachment` TINYINT NOT NULL DEFAULT 1 COMMENT 'Attach baked badge for download',
    `notification` TINYINT NOT NULL DEFAULT 1 COMMENT 'Message when badge is awarded',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'Badge status: 0 = inactive, 1 = active, 2 = active+locked, 3 = inactive+locked, 4 = archived',
    `nextcron` BIGINT NULL,
    `version` VARCHAR(255) NULL,
    `language` VARCHAR(255) NULL,
    `imageauthorname` VARCHAR(255) NULL,
    `imageauthoremail` VARCHAR(255) NULL,
    `imageauthorurl` VARCHAR(255) NULL,
    `imagecaption` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `type` (`type`),
    CONSTRAINT `mdl_badge_fk_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_badge_fk_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_badge_fk_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines badge';

CREATE TABLE `mdl_badge_alignment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `badgeid` BIGINT NOT NULL DEFAULT 0,
    `targetname` VARCHAR(255) NOT NULL,
    `targeturl` VARCHAR(255) NOT NULL,
    `targetdescription` LONGTEXT NULL,
    `targetframework` VARCHAR(255) NULL,
    `targetcode` VARCHAR(255) NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_badge_alignment_alignmentsbadge_fk` FOREIGN KEY (`badgeid`) REFERENCES `mdl_badge` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines alignment for badges';

CREATE TABLE `mdl_badge_backpack` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `email` VARCHAR(100) NOT NULL,
    `backpackuid` BIGINT NOT NULL,
    `autosync` TINYINT NOT NULL DEFAULT 0,
    `password` VARCHAR(50) NULL,
    `externalbackpackid` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `backpackcredentials` (`userid`, `externalbackpackid`),
    CONSTRAINT `mdl_badge_backpack_fk_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_badge_backpack_externalbackpack_fk` FOREIGN KEY (`externalbackpackid`) REFERENCES `mdl_badge_external_backpack` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines settings for connecting external backpack';

CREATE TABLE `mdl_badge_backpack_oauth2` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL,
    `issuerid` BIGINT NOT NULL,
    `externalbackpackid` BIGINT NOT NULL,
    `token` LONGTEXT NOT NULL,
    `refreshtoken` LONGTEXT NOT NULL,
    `expires` BIGINT NULL,
    `scope` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_badge_backpack_oauth2_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_badge_backpack_oauth2_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_badge_backpack_oauth2_issuerid_fk` FOREIGN KEY (`issuerid`) REFERENCES `mdl_oauth2_issuer` (`id`),
    CONSTRAINT `mdl_badge_backpack_oauth2_externalbackpackid_fk` FOREIGN KEY (`externalbackpackid`) REFERENCES `mdl_badge_external_backpack` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default comment for the table, please edit me';

CREATE TABLE `mdl_badge_criteria` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `badgeid` BIGINT NOT NULL DEFAULT 0,
    `criteriatype` BIGINT NULL COMMENT 'The criteria type we are aggregating',
    `method` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = all, 2 = any',
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `badgecriteriatype` (`badgeid`, `criteriatype`),
    KEY `criteriatype` (`criteriatype`),
    CONSTRAINT `mdl_badge_criteria_fk_badgeid_fk` FOREIGN KEY (`badgeid`) REFERENCES `mdl_badge` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines criteria for issuing badges';

CREATE TABLE `mdl_badge_criteria_met` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `issuedid` BIGINT NULL,
    `critid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `datemet` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_badge_criteria_met_fk_critid_fk` FOREIGN KEY (`critid`) REFERENCES `mdl_badge_criteria` (`id`),
    CONSTRAINT `mdl_badge_criteria_met_fk_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_badge_criteria_met_fk_issuedid_fk` FOREIGN KEY (`issuedid`) REFERENCES `mdl_badge_issued` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines criteria that were met for an issued badge';

CREATE TABLE `mdl_badge_criteria_param` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `critid` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_badge_criteria_param_fk_critid_fk` FOREIGN KEY (`critid`) REFERENCES `mdl_badge_criteria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines parameters for badges criteria';

CREATE TABLE `mdl_badge_endorsement` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `badgeid` BIGINT NOT NULL DEFAULT 0,
    `issuername` VARCHAR(255) NOT NULL,
    `issuerurl` VARCHAR(255) NOT NULL,
    `issueremail` VARCHAR(255) NOT NULL,
    `claimid` VARCHAR(255) NULL,
    `claimcomment` LONGTEXT NULL,
    `dateissued` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_badge_endorsement_endorsementbadge_fk` FOREIGN KEY (`badgeid`) REFERENCES `mdl_badge` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines endorsement for badge';

CREATE TABLE `mdl_badge_external` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `backpackid` BIGINT NOT NULL COMMENT 'ID of a backpack',
    `collectionid` BIGINT NOT NULL COMMENT 'Badge collection id in the backpack',
    `entityid` VARCHAR(255) NULL,
    `assertion` LONGTEXT NULL COMMENT 'Assertion of external badge',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_badge_external_fk_backpackid_fk` FOREIGN KEY (`backpackid`) REFERENCES `mdl_badge_backpack` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Setting for external badges display';

CREATE TABLE `mdl_badge_external_backpack` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `backpackapiurl` VARCHAR(255) NOT NULL,
    `backpackweburl` VARCHAR(255) NOT NULL,
    `apiversion` VARCHAR(12) NOT NULL DEFAULT 1.0,
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    `oauth2_issuerid` BIGINT NULL COMMENT 'OAuth 2 Issuer',
    PRIMARY KEY (`id`),
    UNIQUE KEY `backpackapiurlkey` (`backpackapiurl`),
    UNIQUE KEY `backpackweburlkey` (`backpackweburl`),
    CONSTRAINT `mdl_badge_external_backpack_backpackoauth2key_fk` FOREIGN KEY (`oauth2_issuerid`) REFERENCES `mdl_oauth2_issuer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines settings for site level backpacks that a user can connect to.';

CREATE TABLE `mdl_badge_external_identifier` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `sitebackpackid` BIGINT NOT NULL COMMENT 'ID of a site backpack',
    `internalid` VARCHAR(128) NOT NULL,
    `externalid` VARCHAR(128) NOT NULL,
    `type` VARCHAR(16) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `backpack-internal-external` (`sitebackpackid`, `internalid`, `externalid`, `type`),
    CONSTRAINT `mdl_badge_external_identifier_fk_backpackid_fk` FOREIGN KEY (`sitebackpackid`) REFERENCES `mdl_badge_backpack` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Setting for external badges mappings';

CREATE TABLE `mdl_badge_issued` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `badgeid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `uniquehash` LONGTEXT NOT NULL,
    `dateissued` BIGINT NOT NULL DEFAULT 0,
    `dateexpire` BIGINT NULL,
    `visible` TINYINT NOT NULL DEFAULT 0,
    `issuernotified` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `badgeuser` (`badgeid`, `userid`),
    CONSTRAINT `mdl_badge_issued_fk_badgeid_fk` FOREIGN KEY (`badgeid`) REFERENCES `mdl_badge` (`id`),
    CONSTRAINT `mdl_badge_issued_fk_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines issued badges';

CREATE TABLE `mdl_badge_manual_award` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `badgeid` BIGINT NOT NULL,
    `recipientid` BIGINT NOT NULL,
    `issuerid` BIGINT NOT NULL,
    `issuerrole` BIGINT NOT NULL,
    `datemet` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_badge_manual_award_fk_badgeid_fk` FOREIGN KEY (`badgeid`) REFERENCES `mdl_badge` (`id`),
    CONSTRAINT `mdl_badge_manual_award_fk_recipientid_fk` FOREIGN KEY (`recipientid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_badge_manual_award_fk_issuerid_fk` FOREIGN KEY (`issuerid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_badge_manual_award_fk_issuerrole_fk` FOREIGN KEY (`issuerrole`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Track manual award criteria for badges';

CREATE TABLE `mdl_badge_related` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `badgeid` BIGINT NOT NULL DEFAULT 0,
    `relatedbadgeid` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `badgeid-relatedbadgeid` (`badgeid`, `relatedbadgeid`),
    CONSTRAINT `mdl_badge_related_badgeid_fk` FOREIGN KEY (`badgeid`) REFERENCES `mdl_badge` (`id`),
    CONSTRAINT `mdl_badge_related_relatedbadgeid_fk` FOREIGN KEY (`relatedbadgeid`) REFERENCES `mdl_badge` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines badge related for badges';

CREATE TABLE `mdl_bbbext_simple` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `bigbluebuttonbnid` BIGINT NULL,
    `newfield` TINYINT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_bigbluebuttonbnid` (`bigbluebuttonbnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default comment for bbbext_simple, please edit me';

CREATE TABLE `mdl_bigbluebuttonbn` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` TINYINT NOT NULL DEFAULT 0,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 1,
    `meetingid` VARCHAR(255) NOT NULL,
    `moderatorpass` VARCHAR(255) NOT NULL,
    `viewerpass` VARCHAR(255) NOT NULL,
    `wait` TINYINT NOT NULL DEFAULT 0,
    `record` TINYINT NOT NULL DEFAULT 0,
    `recordallfromstart` TINYINT NOT NULL DEFAULT 0,
    `recordhidebutton` TINYINT NOT NULL DEFAULT 0,
    `welcome` LONGTEXT NULL,
    `voicebridge` MEDIUMINT NOT NULL DEFAULT 0,
    `openingtime` BIGINT NOT NULL DEFAULT 0,
    `closingtime` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `presentation` LONGTEXT NULL,
    `participants` LONGTEXT NULL,
    `userlimit` SMALLINT NOT NULL DEFAULT 0,
    `recordings_html` TINYINT NOT NULL DEFAULT 0,
    `recordings_deleted` TINYINT NOT NULL DEFAULT 1,
    `recordings_imported` TINYINT NOT NULL DEFAULT 0,
    `recordings_preview` TINYINT NOT NULL DEFAULT 0,
    `clienttype` TINYINT NOT NULL DEFAULT 0,
    `muteonstart` TINYINT NOT NULL DEFAULT 0,
    `disablecam` TINYINT NOT NULL DEFAULT 0,
    `disablemic` TINYINT NOT NULL DEFAULT 0,
    `disableprivatechat` TINYINT NOT NULL DEFAULT 0,
    `disablepublicchat` TINYINT NOT NULL DEFAULT 0,
    `disablenote` TINYINT NOT NULL DEFAULT 0,
    `hideuserlist` TINYINT NOT NULL DEFAULT 0,
    `completionattendance` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if a certain number of minutes in the meeting are required to mark an activity completed for a user.',
    `completionengagementchats` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if chat during the meeting is required to mark an activity completed for a user.',
    `completionengagementtalks` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if talking during the meeting is required to mark an activity completed for a user.',
    `completionengagementraisehand` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if raising hand during the meeting is required to mark an activity completed for a user.',
    `completionengagementpollvotes` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if poll voting during the meeting is required to mark an activity completed for a user.',
    `completionengagementemojis` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if the use of emojis during the meeting is required to mark an activity completed for a user.',
    `guestallowed` TINYINT NULL DEFAULT 0,
    `mustapproveuser` TINYINT NULL DEFAULT 1,
    `guestlinkuid` VARCHAR(1024) NULL,
    `guestpassword` VARCHAR(255) NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The bigbluebuttonbn table to store information about a meeting activities.';

CREATE TABLE `mdl_bigbluebuttonbn_logs` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `bigbluebuttonbnid` BIGINT NOT NULL,
    `userid` BIGINT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `meetingid` VARCHAR(256) NOT NULL,
    `log` VARCHAR(32) NOT NULL,
    `meta` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `log` (`log`),
    KEY `logrow` (`courseid`, `bigbluebuttonbnid`, `userid`, `log`),
    KEY `userlog` (`userid`, `log`),
    KEY `course_bbbid_ix` (`courseid`, `bigbluebuttonbnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The bigbluebuttonbn table to store meeting activity events';

CREATE TABLE `mdl_bigbluebuttonbn_recordings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `bigbluebuttonbnid` BIGINT NOT NULL,
    `groupid` BIGINT NULL,
    `recordingid` VARCHAR(64) NOT NULL,
    `headless` TINYINT NOT NULL DEFAULT 0,
    `imported` TINYINT NOT NULL DEFAULT 0,
    `status` TINYINT NOT NULL DEFAULT 0,
    `importeddata` LONGTEXT NULL COMMENT 'This is the remote recording data stored as json and kept for future reference.',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `recordingid` (`recordingid`),
    CONSTRAINT `mdl_bigbluebuttonbn_recordings_fk_bigbluebuttonbnid_fk` FOREIGN KEY (`bigbluebuttonbnid`) REFERENCES `mdl_bigbluebuttonbn` (`id`),
    CONSTRAINT `mdl_bigbluebuttonbn_recordings_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The bigbluebuttonbn table to store references to recordings';

CREATE TABLE `mdl_block` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `cron` BIGINT NOT NULL DEFAULT 0,
    `lastcron` BIGINT NOT NULL DEFAULT 0,
    `visible` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='contains all installed blocks';

CREATE TABLE `mdl_block_instances` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `blockname` VARCHAR(40) NOT NULL COMMENT 'The type of block this is. Foreign key, references block.name.',
    `parentcontextid` BIGINT NOT NULL COMMENT 'The context within which this block appears. Foreign key, references context.id.',
    `showinsubcontexts` SMALLINT NOT NULL COMMENT 'If 1, this block appears on all matching pages in subcontexts of parentcontextid, as well in pages belonging to parentcontextid.',
    `requiredbytheme` SMALLINT NOT NULL DEFAULT 0 COMMENT 'If 1, this block was created because it was required by the theme and did not exist.',
    `pagetypepattern` VARCHAR(64) NOT NULL COMMENT 'The types of page this block appears on. Either an exact page type like mod-quiz-view, or a pattern like mod-quiz-* or course-view-*. Note that course-view-* will match course-view.',
    `subpagepattern` VARCHAR(16) NULL COMMENT 'Further restrictions on where this block appears. In some places, e.g. during a quiz or lesson attempt, different pages have different subpage ids. If this field is not null, the block only appears on that particular subpage.',
    `defaultregion` VARCHAR(16) NOT NULL COMMENT 'Which block region this block should appear in on each page, in the absence of a specific position in the block_positions table.',
    `defaultweight` BIGINT NOT NULL COMMENT 'Used to order the blocks within a block region. Again, may be overridden by the block_positions table for a specific page where this block appears.',
    `configdata` LONGTEXT NULL COMMENT 'A serialized blob of configuration data for this block instance.',
    `timecreated` BIGINT NOT NULL COMMENT 'Time at which this block instance was originally created',
    `timemodified` BIGINT NOT NULL COMMENT 'Time at which block instance was last modified.',
    PRIMARY KEY (`id`),
    KEY `parentcontextid-showinsubcontexts-pagetypepattern-subpagepattern` (`parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`),
    KEY `timemodified` (`timemodified`),
    KEY `blocknameindex` (`blockname`),
    CONSTRAINT `mdl_block_instances_parentcontextid_fk` FOREIGN KEY (`parentcontextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores block instances. The type of block this is is given by the blockname column. The places this block instance appears is controlled by the parentcontexid, showinsubcontexts, pagetypepattern and subpagepattern fields. Where the block appears on the page (by default) is controlled by the defaultposition and defaultweight columns. The block''s own configuration is stored serialized in configdata.';

CREATE TABLE `mdl_block_positions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `blockinstanceid` BIGINT NOT NULL COMMENT 'The block_instance this position relates to.',
    `contextid` BIGINT NOT NULL COMMENT 'With pagetype and subpage, defines the page we are setting the position for.',
    `pagetype` VARCHAR(64) NOT NULL COMMENT 'With contextid and subpage, defines the page we are setting the position for.',
    `subpage` VARCHAR(16) NOT NULL COMMENT 'With contextid and pagetype, defines the page we are setting the position for.',
    `visible` SMALLINT NOT NULL COMMENT 'Whether this block instance is visible on this page.',
    `region` VARCHAR(16) NOT NULL COMMENT 'Which block region on this page this block should appear in.',
    `weight` BIGINT NOT NULL COMMENT 'Used to order the blocks within a block region.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `blockinstanceid-contextid-pagetype-subpage` (`blockinstanceid`, `contextid`, `pagetype`, `subpage`),
    CONSTRAINT `mdl_block_positions_blockinstanceid_fk` FOREIGN KEY (`blockinstanceid`) REFERENCES `mdl_block_instances` (`id`),
    CONSTRAINT `mdl_block_positions_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the position of a sticky block_instance on a another page than the one where it was added.';

CREATE TABLE `mdl_block_recent_activity` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'Course id',
    `cmid` BIGINT NOT NULL COMMENT 'Course module id',
    `timecreated` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL COMMENT 'User performing the action',
    `action` TINYINT NOT NULL COMMENT '0 created, 1 updated, 2 deleted',
    `modname` VARCHAR(20) NULL COMMENT 'module type name (for delete action)',
    PRIMARY KEY (`id`),
    KEY `coursetime` (`courseid`, `timecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Recent activity block';

CREATE TABLE `mdl_block_recentlyaccesseditems` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'Course id the item belongs to',
    `cmid` BIGINT NOT NULL COMMENT 'Item course module id',
    `userid` BIGINT NOT NULL COMMENT 'User id that accessed the item',
    `timeaccess` BIGINT NOT NULL COMMENT 'Time the user accessed the last time an item',
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-courseid-cmid` (`userid`, `courseid`, `cmid`),
    CONSTRAINT `mdl_block_recentlyaccesseditems_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_block_recentlyaccesseditems_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_block_recentlyaccesseditems_cmid_fk` FOREIGN KEY (`cmid`) REFERENCES `mdl_course_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Most recently accessed items accessed by a user';

CREATE TABLE `mdl_block_rss_client` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `title` LONGTEXT NOT NULL,
    `preferredtitle` VARCHAR(64) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `shared` TINYINT NOT NULL DEFAULT 0,
    `url` VARCHAR(255) NOT NULL,
    `skiptime` BIGINT NOT NULL DEFAULT 0 COMMENT 'How many seconds skip this feed for (increases every time it fails, resets to 0 when it succeeds)',
    `skipuntil` BIGINT NOT NULL DEFAULT 0 COMMENT 'Do not query this RSS feed again until this time',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Remote news feed information. Contains the news feed id, the userid of the user who added the feed, the title of the feed itself and a description of the feed contents along with the url used to access the remote feed. Preferredtitle is a field for future use - intended to allow for custom titles rather than those found in the feed';

CREATE TABLE `mdl_blog_association` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL,
    `blogid` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_blog_association_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_blog_association_blogid_fk` FOREIGN KEY (`blogid`) REFERENCES `mdl_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Associations of blog entries with courses and module instances';

CREATE TABLE `mdl_blog_external` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NULL,
    `url` LONGTEXT NOT NULL,
    `filtertags` VARCHAR(255) NULL COMMENT 'Comma-separated list of tags that will be used to filter which entries are copied over from the external blog. They refer to existing tags in the external blog.',
    `failedlastsync` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether or not the last sync failed for some reason',
    `timemodified` BIGINT NULL,
    `timefetched` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_blog_external_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='External blog links used for RSS copying of blog entries to Moodle user blogs';

CREATE TABLE `mdl_book` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `numbering` SMALLINT NOT NULL DEFAULT 0,
    `navstyle` SMALLINT NOT NULL DEFAULT 1,
    `customtitles` TINYINT NOT NULL DEFAULT 0,
    `revision` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_book_course_fk` FOREIGN KEY (`course`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines book';

CREATE TABLE `mdl_book_chapters` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `bookid` BIGINT NOT NULL DEFAULT 0,
    `pagenum` BIGINT NOT NULL DEFAULT 0,
    `subchapter` BIGINT NOT NULL DEFAULT 0,
    `title` VARCHAR(255) NOT NULL,
    `content` LONGTEXT NOT NULL,
    `contentformat` SMALLINT NOT NULL DEFAULT 0,
    `hidden` TINYINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `importsrc` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `bookid` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines book_chapters';

CREATE TABLE `mdl_cache_filters` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `filter` VARCHAR(32) NOT NULL,
    `version` BIGINT NOT NULL DEFAULT 0,
    `md5key` VARCHAR(32) NOT NULL,
    `rawtext` LONGTEXT NOT NULL,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `filter_md5key` (`filter`, `md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For keeping information about cached data';

CREATE TABLE `mdl_cache_flags` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `flagtype` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `value` LONGTEXT NOT NULL,
    `expiry` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `flagtype` (`flagtype`),
    KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cache of time-sensitive flags';

CREATE TABLE `mdl_capabilities` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `captype` VARCHAR(50) NOT NULL,
    `contextlevel` BIGINT NOT NULL DEFAULT 0,
    `component` VARCHAR(100) NOT NULL,
    `riskbitmask` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='this defines all capabilities';

CREATE TABLE `mdl_chat` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'text format of intro field',
    `keepdays` BIGINT NOT NULL DEFAULT 0,
    `studentlogs` SMALLINT NOT NULL DEFAULT 0,
    `chattime` BIGINT NOT NULL DEFAULT 0,
    `schedule` SMALLINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each of these is a chat room';

CREATE TABLE `mdl_chat_messages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `chatid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `issystem` TINYINT NOT NULL DEFAULT 0,
    `message` LONGTEXT NOT NULL,
    `timestamp` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    KEY `groupid` (`groupid`),
    KEY `timestamp-chatid` (`timestamp`, `chatid`),
    CONSTRAINT `mdl_chat_messages_chatid_fk` FOREIGN KEY (`chatid`) REFERENCES `mdl_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all the actual chat messages';

CREATE TABLE `mdl_chat_messages_current` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `chatid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `issystem` TINYINT NOT NULL DEFAULT 0,
    `message` LONGTEXT NOT NULL,
    `timestamp` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    KEY `groupid` (`groupid`),
    KEY `timestamp-chatid` (`timestamp`, `chatid`),
    CONSTRAINT `mdl_chat_messages_current_chatid_fk` FOREIGN KEY (`chatid`) REFERENCES `mdl_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores current session';

CREATE TABLE `mdl_chat_users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `chatid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `version` VARCHAR(16) NOT NULL,
    `ip` VARCHAR(45) NOT NULL,
    `firstping` BIGINT NOT NULL DEFAULT 0,
    `lastping` BIGINT NOT NULL DEFAULT 0,
    `lastmessageping` BIGINT NOT NULL DEFAULT 0,
    `sid` VARCHAR(32) NOT NULL,
    `course` BIGINT NOT NULL DEFAULT 0,
    `lang` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    KEY `lastping` (`lastping`),
    KEY `groupid` (`groupid`),
    CONSTRAINT `mdl_chat_users_chatid_fk` FOREIGN KEY (`chatid`) REFERENCES `mdl_chat` (`id`),
    CONSTRAINT `mdl_chat_users_course_fk` FOREIGN KEY (`course`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of which users are in which chat rooms';

CREATE TABLE `mdl_choice` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `publish` TINYINT NOT NULL DEFAULT 0,
    `showresults` TINYINT NOT NULL DEFAULT 0,
    `display` SMALLINT NOT NULL DEFAULT 0,
    `allowupdate` TINYINT NOT NULL DEFAULT 0,
    `allowmultiple` TINYINT NOT NULL DEFAULT 0,
    `showunanswered` TINYINT NOT NULL DEFAULT 0,
    `includeinactive` TINYINT NOT NULL DEFAULT 1,
    `limitanswers` TINYINT NOT NULL DEFAULT 0,
    `timeopen` BIGINT NOT NULL DEFAULT 0,
    `timeclose` BIGINT NOT NULL DEFAULT 0,
    `showpreview` TINYINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `completionsubmit` TINYINT NOT NULL DEFAULT 0 COMMENT 'If this field is set to 1, then the activity will be automatically marked as ''complete'' once the user submits their choice.',
    `showavailable` TINYINT NOT NULL DEFAULT 0 COMMENT 'If this field is set to 1, then the the number of available space on choice options will be shown, given limitanswers is set to 1.',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Available choices are stored here';

CREATE TABLE `mdl_choice_answers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `choiceid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `optionid` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_choice_answers_choiceid_fk` FOREIGN KEY (`choiceid`) REFERENCES `mdl_choice` (`id`),
    CONSTRAINT `mdl_choice_answers_optionid_fk` FOREIGN KEY (`optionid`) REFERENCES `mdl_choice_options` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='choices performed by users';

CREATE TABLE `mdl_choice_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `choiceid` BIGINT NOT NULL DEFAULT 0,
    `text` LONGTEXT NULL,
    `maxanswers` BIGINT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_choice_options_choiceid_fk` FOREIGN KEY (`choiceid`) REFERENCES `mdl_choice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='available options to choice';

CREATE TABLE `mdl_cohort` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL COMMENT 'Context is usually ignored in sync operations so that the cohorts may be moved freely around in the context tree without any side affects.',
    `name` VARCHAR(254) NOT NULL COMMENT 'Short human readable name for the cohort, does not have to be unique',
    `idnumber` VARCHAR(100) NULL COMMENT 'Unique identifier of a cohort, useful especially for mapping to external entities',
    `description` LONGTEXT NULL COMMENT 'Standard description text box',
    `descriptionformat` TINYINT NOT NULL,
    `visible` TINYINT NOT NULL DEFAULT 1 COMMENT 'Visibility to teachers',
    `component` VARCHAR(100) NOT NULL COMMENT 'Component (plugintype_pluignname) that manages the cohort, manual modifications are allowed only when set to NULL',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `theme` VARCHAR(50) NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_cohort_context_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record represents one cohort (aka site-wide group).';

CREATE TABLE `mdl_cohort_members` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `cohortid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `timeadded` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `cohortid-userid` (`cohortid`, `userid`),
    CONSTRAINT `mdl_cohort_members_cohortid_fk` FOREIGN KEY (`cohortid`) REFERENCES `mdl_cohort` (`id`),
    CONSTRAINT `mdl_cohort_members_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a user to a cohort.';

CREATE TABLE `mdl_comments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL,
    `component` VARCHAR(255) NULL COMMENT 'The plugin this comment belongs to.',
    `commentarea` VARCHAR(255) NOT NULL,
    `itemid` BIGINT NOT NULL,
    `content` LONGTEXT NOT NULL,
    `format` TINYINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `ix_concomitem` (`contextid`, `commentarea`, `itemid`),
    CONSTRAINT `mdl_comments_fk_user_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='moodle comments module';

CREATE TABLE `mdl_communication` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL COMMENT 'The id of the context that this communication instance relates to',
    `instanceid` BIGINT NOT NULL COMMENT 'ID of the instance where the communication is a part of',
    `component` VARCHAR(100) NOT NULL COMMENT 'Component of the instance where the communication room is a part of',
    `instancetype` VARCHAR(100) NOT NULL COMMENT 'The type of the instance for the given component',
    `provider` VARCHAR(100) NOT NULL COMMENT 'Name of the selected communication provider',
    `roomname` VARCHAR(255) NULL COMMENT 'Name of the communication room',
    `avatarfilename` VARCHAR(100) NULL COMMENT 'Name of the avatar file name for the communication instance',
    `active` TINYINT NOT NULL DEFAULT 1 COMMENT 'The communication instance is active or not',
    `avatarsynced` TINYINT NOT NULL DEFAULT 0 COMMENT 'Indicate if the avatar has been synced with the provider',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_communication_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Communication records';

CREATE TABLE `mdl_communication_customlink` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `commid` BIGINT NOT NULL COMMENT 'ID of the communication record',
    `url` VARCHAR(255) NULL COMMENT 'URL being linked to by the provider',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_communication_customlink_fk_commid_fk` FOREIGN KEY (`commid`) REFERENCES `mdl_communication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the link associated with a custom link communication instance.';

CREATE TABLE `mdl_communication_user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `commid` BIGINT NOT NULL COMMENT 'ID of the communication instance',
    `userid` BIGINT NOT NULL COMMENT 'ID of the moodle user to map with communication instance',
    `synced` TINYINT NOT NULL DEFAULT 0 COMMENT 'The user is synced or not',
    `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'The user need to be deleted or not',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_communication_user_commid_fk` FOREIGN KEY (`commid`) REFERENCES `mdl_communication` (`id`),
    CONSTRAINT `mdl_communication_user_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Communication user records mapping';

CREATE TABLE `mdl_competency` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `shortname` VARCHAR(100) NULL COMMENT 'Shortname of a competency',
    `description` LONGTEXT NULL COMMENT 'Description of a single competency',
    `descriptionformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of the description field',
    `idnumber` VARCHAR(100) NULL,
    `competencyframeworkid` BIGINT NOT NULL COMMENT 'The framework this competency relates to.',
    `parentid` BIGINT NOT NULL DEFAULT 0 COMMENT 'The parent competency.',
    `path` VARCHAR(255) NOT NULL COMMENT 'Used to speed up queries that use an entire branch of the tree. Looks like /5/34/54.',
    `sortorder` BIGINT NOT NULL COMMENT 'Relative sort order within the branch',
    `ruletype` VARCHAR(100) NULL,
    `ruleoutcome` TINYINT NOT NULL DEFAULT 0,
    `ruleconfig` LONGTEXT NULL,
    `scaleid` BIGINT NULL,
    `scaleconfiguration` LONGTEXT NULL,
    `timecreated` BIGINT NOT NULL COMMENT 'The time this competency was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this competency was last modified.',
    `usermodified` BIGINT NULL COMMENT 'The user who last modified this competency',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idnumberframework` (`competencyframeworkid`, `idnumber`),
    KEY `ruleoutcome` (`ruleoutcome`),
    CONSTRAINT `mdl_competency_scaleid_fk` FOREIGN KEY (`scaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_competency_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains the master record of each competency in a framework';

CREATE TABLE `mdl_competency_coursecomp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'The course this competency is linked to.',
    `competencyid` BIGINT NOT NULL COMMENT 'The competency that is linked to this course.',
    `ruleoutcome` TINYINT NOT NULL COMMENT 'The rule that applies to the competency when the course is completed.',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this link was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this link was modified.',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who modified this link.',
    `sortorder` BIGINT NOT NULL COMMENT 'The display order for this link.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `courseidcompetencyid` (`courseid`, `competencyid`),
    KEY `courseidruleoutcome` (`courseid`, `ruleoutcome`),
    CONSTRAINT `mdl_competency_coursecomp_courseidlink_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_competency_coursecomp_competencyid_fk` FOREIGN KEY (`competencyid`) REFERENCES `mdl_competency` (`id`),
    CONSTRAINT `mdl_competency_coursecomp_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a competency to a course.';

CREATE TABLE `mdl_competency_coursecompsetting` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'The course this setting is linked to.',
    `pushratingstouserplans` TINYINT NULL COMMENT 'Does this course push ratings to user plans?',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this setting was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this setting was last modified.',
    `usermodified` BIGINT NULL COMMENT 'The user who last modified this setting',
    PRIMARY KEY (`id`),
    KEY `courseidlink` (`courseid`),
    CONSTRAINT `mdl_competency_coursecompsetting_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains the course specific settings for competencies.';

CREATE TABLE `mdl_competency_evidence` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `usercompetencyid` BIGINT NOT NULL,
    `contextid` BIGINT NOT NULL,
    `action` TINYINT NOT NULL,
    `actionuserid` BIGINT NULL,
    `descidentifier` VARCHAR(255) NOT NULL,
    `desccomponent` VARCHAR(255) NOT NULL,
    `desca` LONGTEXT NULL,
    `url` VARCHAR(255) NULL,
    `grade` BIGINT NULL,
    `note` LONGTEXT NULL COMMENT 'A non-localised text to attach to the evidence.',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `usercompetencyid` (`usercompetencyid`),
    CONSTRAINT `mdl_competency_evidence_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_competency_evidence_actionuserid_fk` FOREIGN KEY (`actionuserid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_competency_evidence_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The evidence linked to a user competency';

CREATE TABLE `mdl_competency_framework` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `shortname` VARCHAR(100) NULL COMMENT 'Short name for the competency framework.',
    `contextid` BIGINT NOT NULL,
    `idnumber` VARCHAR(100) NULL COMMENT 'Unique idnumber for this competency framework.',
    `description` LONGTEXT NULL COMMENT 'Description of this competency framework',
    `descriptionformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of the description field',
    `scaleid` BIGINT NULL COMMENT 'Scale used to define competency.',
    `scaleconfiguration` LONGTEXT NOT NULL COMMENT 'Scale information.',
    `visible` TINYINT NOT NULL DEFAULT 1 COMMENT 'Used to show/hide this competency framework.',
    `taxonomies` VARCHAR(255) NOT NULL COMMENT 'Sequence of terms to use for each competency level.',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this competency framework was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this competency framework was last modified.',
    `usermodified` BIGINT NULL COMMENT 'The user who last modified this framework',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idnumber` (`idnumber`),
    CONSTRAINT `mdl_competency_framework_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_competency_framework_scaleid_fk` FOREIGN KEY (`scaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_competency_framework_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of competency frameworks.';

CREATE TABLE `mdl_competency_modulecomp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `cmid` BIGINT NOT NULL COMMENT 'ID of the record in the course_modules table.',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this record was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this record was last modified',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who last modified this field.',
    `sortorder` BIGINT NOT NULL COMMENT 'The field used to naturally sort this link.',
    `competencyid` BIGINT NOT NULL COMMENT 'The course competency this activity is linked to.',
    `ruleoutcome` TINYINT NOT NULL COMMENT 'The outcome when an activity is completed.',
    `overridegrade` TINYINT NOT NULL DEFAULT 0 COMMENT 'Enables the ability to override an existing competencys grade.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `cmidcompetencyid` (`cmid`, `competencyid`),
    KEY `cmidruleoutcome` (`cmid`, `ruleoutcome`),
    CONSTRAINT `mdl_competency_modulecomp_cmidkey_fk` FOREIGN KEY (`cmid`) REFERENCES `mdl_course_modules` (`id`),
    CONSTRAINT `mdl_competency_modulecomp_competencyidkey_fk` FOREIGN KEY (`competencyid`) REFERENCES `mdl_competency` (`id`),
    CONSTRAINT `mdl_competency_modulecomp_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a competency to a module.';

CREATE TABLE `mdl_competency_plan` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NULL,
    `descriptionformat` SMALLINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL,
    `templateid` BIGINT NULL,
    `origtemplateid` BIGINT NULL COMMENT 'The template ID this plan was based on originally',
    `status` TINYINT NOT NULL,
    `duedate` BIGINT NULL DEFAULT 0,
    `reviewerid` BIGINT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `useridstatus` (`userid`, `status`),
    KEY `templateid` (`templateid`),
    KEY `statusduedate` (`status`, `duedate`),
    CONSTRAINT `mdl_competency_plan_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Learning plans';

CREATE TABLE `mdl_competency_plancomp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `planid` BIGINT NOT NULL,
    `competencyid` BIGINT NOT NULL,
    `sortorder` BIGINT NULL COMMENT 'Relative sort order',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `planidcompetencyid` (`planid`, `competencyid`),
    CONSTRAINT `mdl_competency_plancomp_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Plan competencies';

CREATE TABLE `mdl_competency_relatedcomp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `competencyid` BIGINT NOT NULL,
    `relatedcompetencyid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_competency_relatedcomp_competencyid_fk` FOREIGN KEY (`competencyid`) REFERENCES `mdl_competency` (`id`),
    CONSTRAINT `mdl_competency_relatedcomp_relatedcompetencyid_fk` FOREIGN KEY (`relatedcompetencyid`) REFERENCES `mdl_competency` (`id`),
    CONSTRAINT `mdl_competency_relatedcomp_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Related competencies';

CREATE TABLE `mdl_competency_template` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `shortname` VARCHAR(100) NULL COMMENT 'Short name for the learning plan template.',
    `contextid` BIGINT NOT NULL,
    `description` LONGTEXT NULL COMMENT 'Description of this learning plan template',
    `descriptionformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of the description field',
    `visible` TINYINT NOT NULL DEFAULT 1 COMMENT 'Used to show/hide this learning plan template.',
    `duedate` BIGINT NULL COMMENT 'The default due date for instances of this plan.',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this learning plan template was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this learning plan template was last modified.',
    `usermodified` BIGINT NULL COMMENT 'The user who last modified this learning plan template',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_competency_template_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_competency_template_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Learning plan templates.';

CREATE TABLE `mdl_competency_templatecohort` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `templateid` BIGINT NOT NULL,
    `cohortid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `templatecohortids` (`templateid`, `cohortid`),
    KEY `templateid` (`templateid`),
    CONSTRAINT `mdl_competency_templatecohort_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default comment for the table, please edit me';

CREATE TABLE `mdl_competency_templatecomp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `templateid` BIGINT NOT NULL COMMENT 'The template this competency is linked to.',
    `competencyid` BIGINT NOT NULL COMMENT 'The competency that is linked to this course.',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this link was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this link was modified.',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who modified this link.',
    `sortorder` BIGINT NULL COMMENT 'Relative sort order',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_competency_templatecomp_templateidlink_fk` FOREIGN KEY (`templateid`) REFERENCES `mdl_competency_template` (`id`),
    CONSTRAINT `mdl_competency_templatecomp_competencyid_fk` FOREIGN KEY (`competencyid`) REFERENCES `mdl_competency` (`id`),
    CONSTRAINT `mdl_competency_templatecomp_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a competency to a learning plan template.';

CREATE TABLE `mdl_competency_usercomp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'User associated to the competency.',
    `competencyid` BIGINT NOT NULL COMMENT 'Competency associated to the user.',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'Competency status.',
    `reviewerid` BIGINT NULL COMMENT 'User that reviewed the competency.',
    `proficiency` TINYINT NULL COMMENT 'Indicate if the competency is proficient not.',
    `grade` BIGINT NULL COMMENT 'Grade assigned to the competency.',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `useridcompetency` (`userid`, `competencyid`),
    CONSTRAINT `mdl_competency_usercomp_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User competencies';

CREATE TABLE `mdl_competency_usercompcourse` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'User associated to the competency.',
    `courseid` BIGINT NOT NULL COMMENT 'The course this competency is linked to.',
    `competencyid` BIGINT NOT NULL COMMENT 'Competency associated to the user.',
    `proficiency` TINYINT NULL COMMENT 'Indicate if the competency is proficient not.',
    `grade` BIGINT NULL COMMENT 'The course grade assigned for the competency.',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `useridcoursecomp` (`userid`, `courseid`, `competencyid`),
    CONSTRAINT `mdl_competency_usercompcourse_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User competencies in a course';

CREATE TABLE `mdl_competency_usercompplan` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'User associated to the competency.',
    `competencyid` BIGINT NOT NULL COMMENT 'Competency associated to the user.',
    `planid` BIGINT NOT NULL COMMENT 'Plan associated to the user.',
    `proficiency` TINYINT NULL COMMENT 'Indicate if the competency is proficient not.',
    `grade` BIGINT NULL COMMENT 'Grade assigned to the competency.',
    `sortorder` BIGINT NULL COMMENT 'Relative sort order',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `usercompetencyplan` (`userid`, `competencyid`, `planid`),
    CONSTRAINT `mdl_competency_usercompplan_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User competencies plans';

CREATE TABLE `mdl_competency_userevidence` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `descriptionformat` TINYINT NOT NULL,
    `url` LONGTEXT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_competency_userevidence_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The evidence of prior learning';

CREATE TABLE `mdl_competency_userevidencecomp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userevidenceid` BIGINT NOT NULL,
    `competencyid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userevidencecompids` (`userevidenceid`, `competencyid`),
    KEY `userevidenceid` (`userevidenceid`),
    CONSTRAINT `mdl_competency_userevidencecomp_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Relationship between user evidence and competencies';

CREATE TABLE `mdl_config` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Moodle configuration variables';

CREATE TABLE `mdl_config_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `plugin` VARCHAR(100) NULL,
    `name` VARCHAR(100) NOT NULL,
    `value` LONGTEXT NULL,
    `oldvalue` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `timemodified` (`timemodified`),
    CONSTRAINT `mdl_config_log_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Changes done in server configuration through admin UI';

CREATE TABLE `mdl_config_plugins` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `plugin` VARCHAR(100) NOT NULL DEFAULT 'core',
    `name` VARCHAR(100) NOT NULL,
    `value` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `plugin_name` (`plugin`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Moodle modules and plugins configuration variables';

CREATE TABLE `mdl_contentbank_content` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `contenttype` VARCHAR(100) NOT NULL,
    `contextid` BIGINT NOT NULL COMMENT 'References context.id.',
    `visibility` TINYINT NOT NULL DEFAULT 1,
    `instanceid` BIGINT NULL,
    `configdata` LONGTEXT NULL,
    `usercreated` BIGINT NOT NULL COMMENT 'The original author of the content',
    `usermodified` BIGINT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `name` (`name`),
    KEY `instance` (`contextid`, `contenttype`, `instanceid`),
    CONSTRAINT `mdl_contentbank_content_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_contentbank_content_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_contentbank_content_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores content data in the content bank.';

CREATE TABLE `mdl_context` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextlevel` BIGINT NOT NULL DEFAULT 0,
    `instanceid` BIGINT NOT NULL DEFAULT 0,
    `path` VARCHAR(255) NULL,
    `depth` TINYINT NOT NULL DEFAULT 0,
    `locked` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether this context and its children are locked',
    PRIMARY KEY (`id`),
    UNIQUE KEY `contextlevel-instanceid` (`contextlevel`, `instanceid`),
    KEY `instanceid` (`instanceid`),
    KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='one of these must be set';

CREATE TABLE `mdl_context_temp` (
    `id` BIGINT NOT NULL COMMENT 'This id isn''t autonumeric/sequence. It''s the context->id',
    `path` VARCHAR(255) NOT NULL,
    `depth` TINYINT NOT NULL,
    `locked` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether this context and its children are locked',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Used by build_context_path() in upgrade and cron to keep context depths and paths in sync.';

CREATE TABLE `mdl_course` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `category` BIGINT NOT NULL DEFAULT 0,
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    `fullname` VARCHAR(254) NOT NULL,
    `shortname` VARCHAR(255) NOT NULL,
    `idnumber` VARCHAR(100) NOT NULL,
    `summary` LONGTEXT NULL,
    `summaryformat` TINYINT NOT NULL DEFAULT 0,
    `format` VARCHAR(21) NOT NULL DEFAULT 'topics',
    `showgrades` TINYINT NOT NULL DEFAULT 1,
    `newsitems` MEDIUMINT NOT NULL DEFAULT 1,
    `startdate` BIGINT NOT NULL DEFAULT 0,
    `enddate` BIGINT NOT NULL DEFAULT 0,
    `relativedatesmode` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether to let this course display course- or activity-related dates relative to the user''s enrolment date in this course.',
    `marker` BIGINT NOT NULL DEFAULT 0,
    `maxbytes` BIGINT NOT NULL DEFAULT 0,
    `legacyfiles` SMALLINT NOT NULL DEFAULT 0 COMMENT 'course files are not necessary any more: 0 no legacy files, 1 legacy files disabled, 2 legacy files enabled',
    `showreports` SMALLINT NOT NULL DEFAULT 0,
    `visible` TINYINT NOT NULL DEFAULT 1,
    `visibleold` TINYINT NOT NULL DEFAULT 1 COMMENT 'the state of visible field when hiding parent category, this helps us to recover hidden states when unhiding the parent category later',
    `downloadcontent` TINYINT NULL,
    `groupmode` SMALLINT NOT NULL DEFAULT 0,
    `groupmodeforce` SMALLINT NOT NULL DEFAULT 0,
    `defaultgroupingid` BIGINT NOT NULL DEFAULT 0 COMMENT 'default grouping used in course modules, does not have key intentionally',
    `lang` VARCHAR(30) NOT NULL COMMENT 'Forced language for this course. Null or '''' means ''Do not force''. Otherwise a Moodle lang pack name like ''fr'' or ''en_us''.',
    `calendartype` VARCHAR(30) NOT NULL,
    `theme` VARCHAR(50) NOT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `requested` TINYINT NOT NULL DEFAULT 0,
    `enablecompletion` TINYINT NOT NULL DEFAULT 0 COMMENT '1 = allow use of ''completion'' progress-tracking on this course. 0 = disable completion tracking on this course.',
    `completionnotify` TINYINT NOT NULL DEFAULT 0 COMMENT 'Notify users when they complete this course',
    `cacherev` BIGINT NOT NULL DEFAULT 0 COMMENT 'Incrementing revision for validating the course content cache',
    `originalcourseid` BIGINT NULL COMMENT 'the id of the source course when a new course originates from a restore of another course on the same site.',
    `showactivitydates` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether to display activity dates to user. 0 = do not display, 1 = display activity dates',
    `showcompletionconditions` TINYINT NULL COMMENT 'Whether to display completion conditions to user. 0 = do not display, 1 = display conditions',
    `pdfexportfont` VARCHAR(50) NULL,
    PRIMARY KEY (`id`),
    KEY `category` (`category`),
    KEY `idnumber` (`idnumber`),
    KEY `shortname` (`shortname`),
    KEY `sortorder` (`sortorder`),
    CONSTRAINT `mdl_course_originalcourseid_fk` FOREIGN KEY (`originalcourseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Central course table';

CREATE TABLE `mdl_course_categories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `idnumber` VARCHAR(100) NULL,
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    `parent` BIGINT NOT NULL DEFAULT 0,
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    `coursecount` BIGINT NOT NULL DEFAULT 0,
    `visible` TINYINT NOT NULL DEFAULT 1,
    `visibleold` TINYINT NOT NULL DEFAULT 1 COMMENT 'the state of visible field when hiding parent category, this helps us to recover hidden states when unhiding the parent category later',
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `depth` BIGINT NOT NULL DEFAULT 0,
    `path` VARCHAR(255) NOT NULL,
    `theme` VARCHAR(50) NULL COMMENT 'Theme for the category',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_course_categories_parent_fk` FOREIGN KEY (`parent`) REFERENCES `mdl_course_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course categories';

CREATE TABLE `mdl_course_completion_aggr_methd` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `criteriatype` BIGINT NULL COMMENT 'The criteria type we are aggregating, or NULL if complete course aggregation',
    `method` TINYINT NOT NULL DEFAULT 0 COMMENT '1 = all, 2 = any, 3 = fraction, 4 = unit',
    `value` DECIMAL(10,5) NULL COMMENT 'NULL = all/any, 0..1 for method ''fraction'', > 0 for method ''unit''',
    PRIMARY KEY (`id`),
    UNIQUE KEY `coursecriteriatype` (`course`, `criteriatype`),
    KEY `course` (`course`),
    KEY `criteriatype` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion aggregation methods for criteria';

CREATE TABLE `mdl_course_completion_crit_compl` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `course` BIGINT NOT NULL DEFAULT 0,
    `criteriaid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Completion criteria this references',
    `gradefinal` DECIMAL(10,5) NULL COMMENT 'The final grade for the course (included regardless of whether a passing grade was required)',
    `unenroled` BIGINT NULL COMMENT 'Timestamp when the user was unenroled',
    `timecompleted` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `useridcoursecriteriaid` (`userid`, `course`, `criteriaid`),
    KEY `userid` (`userid`),
    KEY `course` (`course`),
    KEY `criteriaid` (`criteriaid`),
    KEY `timecompleted` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion user records';

CREATE TABLE `mdl_course_completion_criteria` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `criteriatype` BIGINT NOT NULL DEFAULT 0 COMMENT 'Type of criteria',
    `module` VARCHAR(100) NULL COMMENT 'Type of module (if using module criteria type)',
    `moduleinstance` BIGINT NULL COMMENT 'Course module id (if using module criteria type)',
    `courseinstance` BIGINT NULL COMMENT 'Course instance id (if using course criteria type)',
    `enrolperiod` BIGINT NULL COMMENT 'Number of days after enrolment the course is completed (if using enrolperiod criteria type)',
    `timeend` BIGINT NULL COMMENT 'Timestamp of the date for course completion (if using date criteria type)',
    `gradepass` DECIMAL(10,5) NULL COMMENT 'The minimum grade needed to pass the course (if passing grade criteria enabled)',
    `role` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion criteria';

CREATE TABLE `mdl_course_completion_defaults` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL,
    `module` BIGINT NOT NULL,
    `completion` TINYINT NOT NULL DEFAULT 0,
    `completionview` TINYINT NOT NULL DEFAULT 0,
    `completionusegrade` TINYINT NOT NULL DEFAULT 0,
    `completionpassgrade` TINYINT NOT NULL DEFAULT 0,
    `completionexpected` BIGINT NOT NULL DEFAULT 0,
    `customrules` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `coursemodule` (`course`, `module`),
    CONSTRAINT `mdl_course_completion_defaults_module_fk` FOREIGN KEY (`module`) REFERENCES `mdl_modules` (`id`),
    CONSTRAINT `mdl_course_completion_defaults_course_fk` FOREIGN KEY (`course`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default settings for activities completion';

CREATE TABLE `mdl_course_completions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `course` BIGINT NOT NULL DEFAULT 0,
    `timeenrolled` BIGINT NOT NULL DEFAULT 0,
    `timestarted` BIGINT NOT NULL DEFAULT 0,
    `timecompleted` BIGINT NULL,
    `reaggregate` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `useridcourse` (`userid`, `course`),
    KEY `userid` (`userid`),
    KEY `course` (`course`),
    KEY `timecompleted` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion records';

CREATE TABLE `mdl_course_format_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'Id of the course',
    `format` VARCHAR(21) NOT NULL COMMENT 'Format this option is for',
    `sectionid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Null if this is a course option, otherwise id of the section this option is for',
    `name` VARCHAR(100) NOT NULL COMMENT 'Name of the format option',
    `value` LONGTEXT NULL COMMENT 'Value of the format option',
    PRIMARY KEY (`id`),
    UNIQUE KEY `formatoption` (`courseid`, `format`, `sectionid`, `name`),
    CONSTRAINT `mdl_course_format_options_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores format-specific options for the course or course section';

CREATE TABLE `mdl_course_modules` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `module` BIGINT NOT NULL DEFAULT 0,
    `instance` BIGINT NOT NULL DEFAULT 0,
    `section` BIGINT NOT NULL DEFAULT 0,
    `idnumber` VARCHAR(100) NULL COMMENT 'customizable idnumber',
    `added` BIGINT NOT NULL DEFAULT 0,
    `score` SMALLINT NOT NULL DEFAULT 0,
    `indent` MEDIUMINT NOT NULL DEFAULT 0,
    `visible` TINYINT NOT NULL DEFAULT 1,
    `visibleoncoursepage` TINYINT NOT NULL DEFAULT 1 COMMENT 'If stealth visibility is allowed for the course, this controls whether activity is visible on course page',
    `visibleold` TINYINT NOT NULL DEFAULT 1,
    `groupmode` SMALLINT NOT NULL DEFAULT 0,
    `groupingid` BIGINT NOT NULL DEFAULT 0,
    `completion` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether the completion-tracking facilities are enabled for this activity. 0 = not enabled (database default) 1 = manual tracking, user can tick this activity off (UI default for most activity types) 2 = automatic tracking, system should mark completion according to rules specified in course_moduleS_completion',
    `completiongradeitemnumber` BIGINT NULL COMMENT 'Grade-item number used to track automatic completion, if applicable.',
    `completionview` TINYINT NOT NULL DEFAULT 0 COMMENT 'Controls whether a page view is part of the automatic completion requirements for this activity. 0 = view not required 1 = view required',
    `completionexpected` BIGINT NOT NULL DEFAULT 0 COMMENT 'Date at which students are expected to complete this activity. This field is used when displaying student progress.',
    `completionpassgrade` TINYINT NOT NULL DEFAULT 0 COMMENT 'Enable completion check on passing grade.',
    `showdescription` TINYINT NOT NULL DEFAULT 0 COMMENT 'Some module types support a ''description'' which shows within the module pages. This option controls whether it also displays on the course main page. 0 = does not display (default), 1 = displays',
    `availability` LONGTEXT NULL COMMENT 'Availability restrictions for viewing this activity, in JSON format. Null if no restrictions.',
    `deletioninprogress` TINYINT NOT NULL DEFAULT 0,
    `downloadcontent` TINYINT NULL DEFAULT 1 COMMENT 'Whether the ability to download course module content is enabled for this activity',
    `lang` VARCHAR(30) NULL COMMENT 'Forced language for this activity. Null or '''' means ''Do not force''. Otherwise a Moodle lang pack name like ''fr'' or ''en_us''.',
    PRIMARY KEY (`id`),
    KEY `visible` (`visible`),
    KEY `course` (`course`),
    KEY `module` (`module`),
    KEY `instance` (`instance`),
    KEY `idnumber-course` (`idnumber`, `course`),
    CONSTRAINT `mdl_course_modules_groupingid_fk` FOREIGN KEY (`groupingid`) REFERENCES `mdl_groupings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='course_modules table retrofitted from MySQL';

CREATE TABLE `mdl_course_modules_completion` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `coursemoduleid` BIGINT NOT NULL COMMENT 'Activity that has been completed (or not).',
    `userid` BIGINT NOT NULL COMMENT 'ID of user who has (or hasn''t) completed the activity.',
    `completionstate` TINYINT NOT NULL COMMENT 'Whether or not the user has completed the activity. Available states: 0 = not completed [if there''s no row in this table, that also counts as 0] 1 = completed 2 = completed, show passed 3 = completed, show failed',
    `overrideby` BIGINT NULL COMMENT 'Tracks whether this completion state has been set manually to override a previous state.',
    `timemodified` BIGINT NOT NULL COMMENT 'Time at which the completion state last changed.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-coursemoduleid` (`userid`, `coursemoduleid`),
    KEY `coursemoduleid` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the completion state (completed or not completed, etc) of each user on each activity.';

CREATE TABLE `mdl_course_modules_viewed` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `coursemoduleid` BIGINT NOT NULL COMMENT 'Activity that has been viewed (or not).',
    `userid` BIGINT NOT NULL COMMENT 'ID of user who has (or hasn''t) viewed the activity.',
    `timecreated` BIGINT NOT NULL COMMENT 'Time at which the completion viewed created.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-coursemoduleid` (`userid`, `coursemoduleid`),
    KEY `coursemoduleid` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks the completion viewed (viewed with cmid/userid and otherwise no row) of each user on each activity.';

CREATE TABLE `mdl_course_published` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `huburl` VARCHAR(255) NULL COMMENT 'the url of the "registered on" hub',
    `courseid` BIGINT NOT NULL COMMENT 'the id of the published course',
    `timepublished` BIGINT NOT NULL COMMENT 'The time when the publication occurred',
    `enrollable` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = enrollable, 0 = downloadable',
    `hubcourseid` BIGINT NOT NULL COMMENT 'the course id on the hub server',
    `status` TINYINT NULL DEFAULT 0 COMMENT 'is the publication published or not',
    `timechecked` BIGINT NULL COMMENT 'the last time the status has been checked',
    PRIMARY KEY (`id`),
    KEY `hubcourseid` (`hubcourseid`),
    CONSTRAINT `mdl_course_published_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about how and when an local courses were published to hubs';

CREATE TABLE `mdl_course_request` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `fullname` VARCHAR(254) NOT NULL,
    `shortname` VARCHAR(100) NOT NULL,
    `summary` LONGTEXT NOT NULL,
    `summaryformat` TINYINT NOT NULL DEFAULT 0,
    `category` BIGINT NOT NULL DEFAULT 0,
    `reason` LONGTEXT NOT NULL,
    `requester` BIGINT NOT NULL DEFAULT 0,
    `password` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `shortname` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='course requests';

CREATE TABLE `mdl_course_sections` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `section` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NULL,
    `summary` LONGTEXT NULL,
    `summaryformat` TINYINT NOT NULL DEFAULT 0,
    `sequence` LONGTEXT NULL,
    `visible` TINYINT NOT NULL DEFAULT 1,
    `availability` LONGTEXT NULL COMMENT 'Availability restrictions for viewing this section, in JSON format. Null if no restrictions.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'Time at which the course section was last changed.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `course_section` (`course`, `section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='to define the sections for each course';

CREATE TABLE `mdl_customfield_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(400) NOT NULL,
    `description` LONGTEXT NULL,
    `descriptionformat` BIGINT NULL,
    `sortorder` BIGINT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `component` VARCHAR(100) NOT NULL,
    `area` VARCHAR(100) NOT NULL,
    `itemid` BIGINT NOT NULL DEFAULT 0,
    `contextid` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `component_area_itemid` (`component`, `area`, `itemid`, `sortorder`),
    CONSTRAINT `mdl_customfield_category_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='core_customfield category table';

CREATE TABLE `mdl_customfield_data` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `fieldid` BIGINT NOT NULL,
    `instanceid` BIGINT NOT NULL,
    `intvalue` BIGINT NULL,
    `decvalue` DECIMAL(10,5) NULL,
    `shortcharvalue` VARCHAR(255) NULL,
    `charvalue` VARCHAR(1333) NULL,
    `value` LONGTEXT NOT NULL,
    `valueformat` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `contextid` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `instanceid-fieldid` (`instanceid`, `fieldid`),
    KEY `fieldid-intvalue` (`fieldid`, `intvalue`),
    KEY `fieldid-shortcharvalue` (`fieldid`, `shortcharvalue`),
    KEY `fieldid-decvalue` (`fieldid`, `decvalue`),
    CONSTRAINT `mdl_customfield_data_fieldid_fk` FOREIGN KEY (`fieldid`) REFERENCES `mdl_customfield_field` (`id`),
    CONSTRAINT `mdl_customfield_data_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='core_customfield data table';

CREATE TABLE `mdl_customfield_field` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `shortname` VARCHAR(100) NOT NULL,
    `name` VARCHAR(400) NOT NULL,
    `type` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NULL,
    `descriptionformat` BIGINT NULL,
    `sortorder` BIGINT NULL,
    `categoryid` BIGINT NULL,
    `configdata` LONGTEXT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `categoryid_sortorder` (`categoryid`, `sortorder`),
    CONSTRAINT `mdl_customfield_field_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_customfield_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='core_customfield field table';

CREATE TABLE `mdl_data` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `comments` SMALLINT NOT NULL DEFAULT 0,
    `timeavailablefrom` BIGINT NOT NULL DEFAULT 0,
    `timeavailableto` BIGINT NOT NULL DEFAULT 0,
    `timeviewfrom` BIGINT NOT NULL DEFAULT 0,
    `timeviewto` BIGINT NOT NULL DEFAULT 0,
    `requiredentries` INT NOT NULL DEFAULT 0,
    `requiredentriestoview` INT NOT NULL DEFAULT 0,
    `maxentries` INT NOT NULL DEFAULT 0,
    `rssarticles` SMALLINT NOT NULL DEFAULT 0,
    `singletemplate` LONGTEXT NULL,
    `listtemplate` LONGTEXT NULL,
    `listtemplateheader` LONGTEXT NULL,
    `listtemplatefooter` LONGTEXT NULL,
    `addtemplate` LONGTEXT NULL,
    `rsstemplate` LONGTEXT NULL,
    `rsstitletemplate` LONGTEXT NULL,
    `csstemplate` LONGTEXT NULL,
    `jstemplate` LONGTEXT NULL,
    `asearchtemplate` LONGTEXT NULL,
    `approval` SMALLINT NOT NULL DEFAULT 0,
    `manageapproved` SMALLINT NOT NULL DEFAULT 1,
    `scale` BIGINT NOT NULL DEFAULT 0,
    `assessed` BIGINT NOT NULL DEFAULT 0,
    `assesstimestart` BIGINT NOT NULL DEFAULT 0,
    `assesstimefinish` BIGINT NOT NULL DEFAULT 0,
    `defaultsort` BIGINT NOT NULL DEFAULT 0,
    `defaultsortdir` SMALLINT NOT NULL DEFAULT 0,
    `editany` SMALLINT NOT NULL DEFAULT 0,
    `notification` BIGINT NOT NULL DEFAULT 0 COMMENT 'Notify people when things change',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time the settings for this database module instance were last modified.',
    `config` LONGTEXT NULL,
    `completionentries` BIGINT NULL DEFAULT 0 COMMENT 'Number of entries required for completion',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all database activities';

CREATE TABLE `mdl_data_content` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `fieldid` BIGINT NOT NULL DEFAULT 0,
    `recordid` BIGINT NOT NULL DEFAULT 0,
    `content` LONGTEXT NULL,
    `content1` LONGTEXT NULL,
    `content2` LONGTEXT NULL,
    `content3` LONGTEXT NULL,
    `content4` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_data_content_recordid_fk` FOREIGN KEY (`recordid`) REFERENCES `mdl_data_records` (`id`),
    CONSTRAINT `mdl_data_content_fieldid_fk` FOREIGN KEY (`fieldid`) REFERENCES `mdl_data_fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='the content introduced in each record/fields';

CREATE TABLE `mdl_data_fields` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `dataid` BIGINT NOT NULL DEFAULT 0,
    `type` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `required` TINYINT NOT NULL DEFAULT 0 COMMENT 'Required fields must have a value when inserted by a user',
    `param1` LONGTEXT NULL,
    `param2` LONGTEXT NULL,
    `param3` LONGTEXT NULL,
    `param4` LONGTEXT NULL,
    `param5` LONGTEXT NULL,
    `param6` LONGTEXT NULL,
    `param7` LONGTEXT NULL,
    `param8` LONGTEXT NULL,
    `param9` LONGTEXT NULL,
    `param10` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `type-dataid` (`type`, `dataid`),
    CONSTRAINT `mdl_data_fields_dataid_fk` FOREIGN KEY (`dataid`) REFERENCES `mdl_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='every field available';

CREATE TABLE `mdl_data_records` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `dataid` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `approved` SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_data_records_dataid_fk` FOREIGN KEY (`dataid`) REFERENCES `mdl_data` (`id`),
    CONSTRAINT `mdl_data_records_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='every record introduced';

CREATE TABLE `mdl_editor_atto_autosave` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `elementid` VARCHAR(255) NOT NULL COMMENT 'The unique id for the text editor in the form.',
    `contextid` BIGINT NOT NULL COMMENT 'The contextid that the form was loaded with.',
    `pagehash` VARCHAR(64) NOT NULL COMMENT 'The HTML DOM id of the page that loaded the form.',
    `userid` BIGINT NOT NULL COMMENT 'The id of the user that loaded the form.',
    `drafttext` LONGTEXT NOT NULL COMMENT 'The draft text',
    `draftid` BIGINT NULL COMMENT 'Optional draft area id containing draft files.',
    `pageinstance` VARCHAR(64) NOT NULL COMMENT 'The browser tab instance that last saved the draft text. This is to prevent multiple tabs from the same user saving different text alternately.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'Store the last modified time for the auto save text.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `autosave_uniq_key` (`elementid`, `contextid`, `userid`, `pagehash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Draft text that is auto-saved every 5 seconds while an editor is open.';

CREATE TABLE `mdl_enrol` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `enrol` VARCHAR(20) NOT NULL,
    `status` BIGINT NOT NULL DEFAULT 0 COMMENT '0..9 are system constants, 0 means active enrolment, see ENROL_STATUS_* constants, plugins may define own status greater than 10',
    `courseid` BIGINT NOT NULL,
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'order of enrol plugins in each course',
    `name` VARCHAR(255) NULL COMMENT 'Optional instance name',
    `enrolperiod` BIGINT NULL DEFAULT 0 COMMENT 'Custom - enrolment duration',
    `enrolstartdate` BIGINT NULL DEFAULT 0 COMMENT 'Custom - start of self enrolment',
    `enrolenddate` BIGINT NULL DEFAULT 0 COMMENT 'Custom - end of enrolment',
    `expirynotify` TINYINT NULL DEFAULT 0 COMMENT 'Custom - notify users before expiration',
    `expirythreshold` BIGINT NULL DEFAULT 0 COMMENT 'Custom - when should be the participants notified',
    `notifyall` TINYINT NULL DEFAULT 0 COMMENT 'Custom - Notify both participant and person responsible for enrolments',
    `password` VARCHAR(50) NULL COMMENT 'Custom - enrolment or access password',
    `cost` VARCHAR(20) NULL COMMENT 'Custom - enrolment cost',
    `currency` VARCHAR(3) NULL COMMENT 'Custom - cost currency',
    `roleid` BIGINT NULL DEFAULT 0 COMMENT 'Custom - the default role given to participants who self-enrol',
    `customint1` BIGINT NULL COMMENT 'Custom - general int',
    `customint2` BIGINT NULL COMMENT 'Custom - general int',
    `customint3` BIGINT NULL COMMENT 'Custom - general int',
    `customint4` BIGINT NULL COMMENT 'Custom - general int',
    `customint5` BIGINT NULL COMMENT 'Custom - general int',
    `customint6` BIGINT NULL COMMENT 'Custom - general int',
    `customint7` BIGINT NULL COMMENT 'Custom - general int',
    `customint8` BIGINT NULL COMMENT 'Custom - general int',
    `customchar1` VARCHAR(255) NULL COMMENT 'Custom - general short name',
    `customchar2` VARCHAR(255) NULL COMMENT 'Custom - general short name',
    `customchar3` VARCHAR(1333) NULL COMMENT 'Custom - general short name',
    `customdec1` DECIMAL(12,7) NULL COMMENT 'Custom - general decimal',
    `customdec2` DECIMAL(12,7) NULL COMMENT 'Custom - general decimal',
    `customtext1` LONGTEXT NULL COMMENT 'Custom - general text',
    `customtext2` LONGTEXT NULL COMMENT 'Custom - general text',
    `customtext3` LONGTEXT NULL COMMENT 'Custom - general text',
    `customtext4` LONGTEXT NULL COMMENT 'Custom - general text',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `enrol` (`enrol`),
    CONSTRAINT `mdl_enrol_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_enrol_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Instances of enrolment plugins used in courses, fields marked as custom have a plugin defined meaning, core does not touch them. Create a new linked table if you need even more custom fields.';

CREATE TABLE `mdl_enrol_flatfile` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `action` VARCHAR(30) NOT NULL,
    `roleid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `courseid` BIGINT NOT NULL,
    `timestart` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_enrol_flatfile_courseid-id_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_enrol_flatfile_userid-id_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_enrol_flatfile_roleid-id_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='enrol_flatfile table retrofitted from MySQL';

CREATE TABLE `mdl_enrol_lti_app_registration` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'Common name to identify this platform to users',
    `platformid` LONGTEXT NULL COMMENT 'The issuer URL',
    `clientid` VARCHAR(1333) NULL COMMENT 'The clientid string, generated by the platform when setting up the tool.',
    `uniqueid` VARCHAR(255) NOT NULL COMMENT 'A unique local id, which can be used in the initiate login URI to provide {iss, clientid} uniqueness in the absence of the optional client_id claim.',
    `platformclienthash` VARCHAR(64) NULL COMMENT 'SHA256 hash of the platformid (issuer) and clientid',
    `platformuniqueidhash` VARCHAR(64) NULL COMMENT 'SHA256 hash of the platformid (issuer) and uniqueid',
    `authenticationrequesturl` LONGTEXT NULL COMMENT 'The authorisation endpoint of the platform',
    `jwksurl` LONGTEXT NULL COMMENT 'The JSON Web Key Set URL for the platform',
    `accesstokenurl` LONGTEXT NULL,
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'Status of the registration, used to denote draft (incomplete) or active (complete)',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniqueid` (`uniqueid`),
    UNIQUE KEY `platformclienthash` (`platformclienthash`),
    UNIQUE KEY `platformuniqueidhash` (`platformuniqueidhash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Details of each application that has been registered with the tool';

CREATE TABLE `mdl_enrol_lti_context` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` VARCHAR(255) NOT NULL COMMENT 'The id of the context on the platform',
    `ltideploymentid` BIGINT NOT NULL COMMENT 'The id of the enrol_lti_deployment record containing the deployment information.',
    `type` LONGTEXT NULL COMMENT 'The type of the context on the platform',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `ltideploymentid-contextid` (`ltideploymentid`, `contextid`),
    CONSTRAINT `mdl_enrol_lti_context_ltideploymentid_fk` FOREIGN KEY (`ltideploymentid`) REFERENCES `mdl_enrol_lti_deployment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each row represents a context in the platform, where resource links are added within a deployment.';

CREATE TABLE `mdl_enrol_lti_deployment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'A short name identifying the tool deployment to users',
    `deploymentid` VARCHAR(255) NOT NULL COMMENT 'The id of the deployment, as defined in the platform',
    `platformid` BIGINT NOT NULL COMMENT 'The platformid to which this deployment belongs',
    `legacyconsumerkey` VARCHAR(255) NULL COMMENT 'The legacy consumer key mapped to this deployment, if the deployment represents a migrated tool.',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `platformid-deploymentid` (`platformid`, `deploymentid`),
    CONSTRAINT `mdl_enrol_lti_deployment_platformid_fk` FOREIGN KEY (`platformid`) REFERENCES `mdl_enrol_lti_app_registration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each row represents a deployment of a tool within a platform.';

CREATE TABLE `mdl_enrol_lti_lti2_consumer` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `consumerkey256` VARCHAR(255) NOT NULL,
    `consumerkey` LONGTEXT NULL,
    `secret` VARCHAR(1024) NOT NULL,
    `ltiversion` VARCHAR(10) NULL,
    `consumername` VARCHAR(255) NULL,
    `consumerversion` VARCHAR(255) NULL,
    `consumerguid` VARCHAR(1024) NULL,
    `profile` LONGTEXT NULL,
    `toolproxy` LONGTEXT NULL,
    `settings` LONGTEXT NULL,
    `protected` TINYINT NOT NULL,
    `enabled` TINYINT NOT NULL,
    `enablefrom` BIGINT NULL,
    `enableuntil` BIGINT NULL,
    `lastaccess` BIGINT NULL,
    `created` BIGINT NOT NULL,
    `updated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `consumerkey256_uniq` (`consumerkey256`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='LTI consumers interacting with moodle';

CREATE TABLE `mdl_enrol_lti_lti2_context` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `consumerid` BIGINT NOT NULL,
    `lticontextkey` VARCHAR(255) NOT NULL,
    `type` VARCHAR(100) NULL,
    `settings` LONGTEXT NULL,
    `created` BIGINT NOT NULL,
    `updated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_enrol_lti_lti2_context_consumerid_fk` FOREIGN KEY (`consumerid`) REFERENCES `mdl_enrol_lti_lti2_consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about a specific LTI contexts from the consumers';

CREATE TABLE `mdl_enrol_lti_lti2_nonce` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `consumerid` BIGINT NOT NULL,
    `value` VARCHAR(64) NOT NULL,
    `expires` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_enrol_lti_lti2_nonce_consumerid_fk` FOREIGN KEY (`consumerid`) REFERENCES `mdl_enrol_lti_lti2_consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Nonce used for authentication between moodle and a consumer';

CREATE TABLE `mdl_enrol_lti_lti2_resource_link` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NULL,
    `consumerid` BIGINT NULL,
    `ltiresourcelinkkey` VARCHAR(255) NOT NULL,
    `settings` LONGTEXT NULL,
    `primaryresourcelinkid` BIGINT NULL,
    `shareapproved` TINYINT NULL,
    `created` BIGINT NOT NULL,
    `updated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_enrol_lti_lti2_resource_link_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_enrol_lti_lti2_context` (`id`),
    CONSTRAINT `mdl_enrol_lti_lti2_resource_link_primaryresourcelinkid_fk` FOREIGN KEY (`primaryresourcelinkid`) REFERENCES `mdl_enrol_lti_lti2_resource_link` (`id`),
    CONSTRAINT `mdl_enrol_lti_lti2_resource_link_consumerid_fk` FOREIGN KEY (`consumerid`) REFERENCES `mdl_enrol_lti_lti2_consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link from the consumer to the tool';

CREATE TABLE `mdl_enrol_lti_lti2_share_key` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `sharekey` VARCHAR(32) NOT NULL,
    `resourcelinkid` BIGINT NOT NULL,
    `autoapprove` TINYINT NOT NULL,
    `expires` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `sharekey` (`sharekey`),
    KEY `resourcelinkid` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Resource link share key';

CREATE TABLE `mdl_enrol_lti_lti2_tool_proxy` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `toolproxykey` VARCHAR(32) NOT NULL,
    `consumerid` BIGINT NOT NULL,
    `toolproxy` LONGTEXT NOT NULL,
    `created` BIGINT NOT NULL,
    `updated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `toolproxykey_uniq` (`toolproxykey`),
    CONSTRAINT `mdl_enrol_lti_lti2_tool_proxy_consumerid_fk` FOREIGN KEY (`consumerid`) REFERENCES `mdl_enrol_lti_lti2_consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A tool proxy between moodle and a consumer';

CREATE TABLE `mdl_enrol_lti_lti2_user_result` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `resourcelinkid` BIGINT NOT NULL,
    `ltiuserkey` VARCHAR(255) NOT NULL,
    `ltiresultsourcedid` VARCHAR(1024) NOT NULL,
    `created` BIGINT NOT NULL,
    `updated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_enrol_lti_lti2_user_result_resourcelinkid_fk` FOREIGN KEY (`resourcelinkid`) REFERENCES `mdl_enrol_lti_lti2_resource_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Results for each user for each resource link';

CREATE TABLE `mdl_enrol_lti_resource_link` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `resourcelinkid` VARCHAR(255) NOT NULL COMMENT 'The platform-and-deployment-unique id of the resource link',
    `ltideploymentid` BIGINT NOT NULL COMMENT 'The id of the enrol_lti_deployment record containing the deployment information.',
    `resourceid` BIGINT NOT NULL COMMENT 'The id of the local enrol_lti_tools record containing information about the published resource to which this resource link relates.',
    `lticontextid` BIGINT NULL COMMENT 'The id of the enrol_lti_context record containing information about the context from which this resource link originates.',
    `lineitemsservice` VARCHAR(1333) NULL COMMENT 'The URL for the line items service for this resource link',
    `lineitemservice` VARCHAR(1333) NULL COMMENT 'The URL for the line item service (if only one line item present).',
    `lineitemscope` VARCHAR(255) NULL COMMENT 'The ags line items authorization scope',
    `resultscope` VARCHAR(255) NULL COMMENT 'The ags result authorization scope',
    `scorescope` VARCHAR(255) NULL COMMENT 'The ags score items authorization scope',
    `contextmembershipsurl` VARCHAR(1333) NULL COMMENT 'The NRPS membership URL',
    `nrpsserviceversions` VARCHAR(255) NULL COMMENT 'The NRPS supported service versions',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `resourcelinkid-ltideploymentid` (`resourcelinkid`, `ltideploymentid`),
    CONSTRAINT `mdl_enrol_lti_resource_link_ltideploymentid_fk` FOREIGN KEY (`ltideploymentid`) REFERENCES `mdl_enrol_lti_deployment` (`id`),
    CONSTRAINT `mdl_enrol_lti_resource_link_lticontextid_fk` FOREIGN KEY (`lticontextid`) REFERENCES `mdl_enrol_lti_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each row represents a resource link for a platform and deployment';

CREATE TABLE `mdl_enrol_lti_tool_consumer_map` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `toolid` BIGINT NOT NULL COMMENT 'The tool ID.',
    `consumerid` BIGINT NOT NULL COMMENT 'The consumer ID.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_enrol_lti_tool_consumer_map_toolid_fk` FOREIGN KEY (`toolid`) REFERENCES `mdl_enrol_lti_tools` (`id`),
    CONSTRAINT `mdl_enrol_lti_tool_consumer_map_consumerid_fk` FOREIGN KEY (`consumerid`) REFERENCES `mdl_enrol_lti_lti2_consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table that maps the published tool to tool consumers.';

CREATE TABLE `mdl_enrol_lti_tools` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `enrolid` BIGINT NOT NULL,
    `contextid` BIGINT NOT NULL,
    `ltiversion` VARCHAR(15) NOT NULL DEFAULT 'LTI-1p3',
    `institution` VARCHAR(40) NOT NULL,
    `lang` VARCHAR(30) NOT NULL DEFAULT 'en',
    `timezone` VARCHAR(100) NOT NULL DEFAULT 99,
    `maxenrolled` BIGINT NOT NULL DEFAULT 0,
    `maildisplay` TINYINT NOT NULL DEFAULT 2,
    `city` VARCHAR(120) NOT NULL,
    `country` VARCHAR(2) NOT NULL,
    `gradesync` TINYINT NOT NULL DEFAULT 0,
    `gradesynccompletion` TINYINT NOT NULL DEFAULT 0,
    `membersync` TINYINT NOT NULL DEFAULT 0,
    `membersyncmode` TINYINT NOT NULL DEFAULT 0,
    `roleinstructor` BIGINT NOT NULL,
    `rolelearner` BIGINT NOT NULL,
    `secret` LONGTEXT NULL,
    `uuid` VARCHAR(36) NULL,
    `provisioningmodelearner` TINYINT NULL,
    `provisioningmodeinstructor` TINYINT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uuid` (`uuid`),
    CONSTRAINT `mdl_enrol_lti_tools_enrolid_fk` FOREIGN KEY (`enrolid`) REFERENCES `mdl_enrol` (`id`),
    CONSTRAINT `mdl_enrol_lti_tools_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of tools provided to the remote system';

CREATE TABLE `mdl_enrol_lti_user_resource_link` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `ltiuserid` BIGINT NOT NULL COMMENT 'The id of the enrol_lti_users record',
    `resourcelinkid` BIGINT NOT NULL COMMENT 'The id of the enrol_lti_resource_link record.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `ltiuserid-resourcelinkid` (`ltiuserid`, `resourcelinkid`),
    CONSTRAINT `mdl_enrol_lti_user_resource_link_ltiuserid_fk` FOREIGN KEY (`ltiuserid`) REFERENCES `mdl_enrol_lti_users` (`id`),
    CONSTRAINT `mdl_enrol_lti_user_resource_link_resourcelinkid_fk` FOREIGN KEY (`resourcelinkid`) REFERENCES `mdl_enrol_lti_resource_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Join table mapping users to resource links as this is a many:many relationship';

CREATE TABLE `mdl_enrol_lti_users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `toolid` BIGINT NOT NULL,
    `serviceurl` LONGTEXT NULL,
    `sourceid` LONGTEXT NULL,
    `ltideploymentid` BIGINT NULL,
    `consumerkey` LONGTEXT NULL,
    `consumersecret` LONGTEXT NULL,
    `membershipsurl` LONGTEXT NULL,
    `membershipsid` LONGTEXT NULL,
    `lastgrade` DECIMAL(10,5) NULL COMMENT 'The last grade that was sent',
    `lastaccess` BIGINT NULL COMMENT 'The time the user last accessed',
    `timecreated` BIGINT NULL COMMENT 'The time the user was created',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_enrol_lti_users_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_enrol_lti_users_toolid_fk` FOREIGN KEY (`toolid`) REFERENCES `mdl_enrol_lti_tools` (`id`),
    CONSTRAINT `mdl_enrol_lti_users_ltideploymentid_fk` FOREIGN KEY (`ltideploymentid`) REFERENCES `mdl_enrol_lti_deployment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User access log and gradeback data';

CREATE TABLE `mdl_enrol_paypal` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `business` VARCHAR(255) NOT NULL,
    `receiver_email` VARCHAR(255) NOT NULL,
    `receiver_id` VARCHAR(255) NOT NULL,
    `item_name` VARCHAR(255) NOT NULL,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `instanceid` BIGINT NOT NULL DEFAULT 0,
    `memo` VARCHAR(255) NOT NULL,
    `tax` VARCHAR(255) NOT NULL,
    `option_name1` VARCHAR(255) NOT NULL,
    `option_selection1_x` VARCHAR(255) NOT NULL,
    `option_name2` VARCHAR(255) NOT NULL,
    `option_selection2_x` VARCHAR(255) NOT NULL,
    `payment_status` VARCHAR(255) NOT NULL,
    `pending_reason` VARCHAR(255) NOT NULL,
    `reason_code` VARCHAR(30) NOT NULL,
    `txn_id` VARCHAR(255) NOT NULL,
    `parent_txn_id` VARCHAR(255) NOT NULL,
    `payment_type` VARCHAR(30) NOT NULL,
    `timeupdated` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `business` (`business`),
    KEY `receiver_email` (`receiver_email`),
    CONSTRAINT `mdl_enrol_paypal_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_enrol_paypal_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_enrol_paypal_instanceid_fk` FOREIGN KEY (`instanceid`) REFERENCES `mdl_enrol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Holds all known information about PayPal transactions';

CREATE TABLE `mdl_event` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` LONGTEXT NOT NULL,
    `description` LONGTEXT NOT NULL,
    `format` SMALLINT NOT NULL DEFAULT 0,
    `categoryid` BIGINT NOT NULL DEFAULT 0,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `repeatid` BIGINT NOT NULL DEFAULT 0,
    `component` VARCHAR(100) NULL COMMENT 'Component that created this event, if specified, only component itself can edit and delete it',
    `modulename` VARCHAR(20) NOT NULL,
    `instance` BIGINT NOT NULL DEFAULT 0,
    `type` SMALLINT NOT NULL DEFAULT 0,
    `eventtype` VARCHAR(20) NOT NULL,
    `timestart` BIGINT NOT NULL DEFAULT 0,
    `timeduration` BIGINT NOT NULL DEFAULT 0,
    `timesort` BIGINT NULL,
    `visible` SMALLINT NOT NULL DEFAULT 1,
    `uuid` VARCHAR(255) NOT NULL,
    `sequence` BIGINT NOT NULL DEFAULT 1,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `subscriptionid` BIGINT NULL COMMENT 'The event_subscription id this event is associated with.',
    `priority` BIGINT NULL COMMENT 'The event''s display priority. For multiple events with the same module name, instance and eventtype (e.g. for group overrides), the one with the higher priority will be displayed.',
    `location` LONGTEXT NULL COMMENT 'Event Location',
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `userid` (`userid`),
    KEY `timestart` (`timestart`),
    KEY `timeduration` (`timeduration`),
    KEY `uuid` (`uuid`),
    KEY `type-timesort` (`type`, `timesort`),
    KEY `groupid-courseid-categoryid-visible-userid` (`groupid`, `courseid`, `categoryid`, `visible`, `userid`),
    KEY `eventtype` (`eventtype`),
    KEY `component` (`component`, `eventtype`, `instance`),
    KEY `modulename-instance-eventtype` (`modulename`, `instance`, `eventtype`),
    CONSTRAINT `mdl_event_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_course_categories` (`id`),
    CONSTRAINT `mdl_event_subscriptionid_fk` FOREIGN KEY (`subscriptionid`) REFERENCES `mdl_event_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For everything with a time associated to it';

CREATE TABLE `mdl_event_subscriptions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(255) NOT NULL,
    `categoryid` BIGINT NOT NULL DEFAULT 0,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `eventtype` VARCHAR(20) NOT NULL COMMENT 'The type of the event',
    `pollinterval` BIGINT NOT NULL DEFAULT 0 COMMENT 'Frequency of checks for new/changed events',
    `lastupdated` BIGINT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_event_subscriptions_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_event_subscriptions_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks subscriptions to remote calendars.';

CREATE TABLE `mdl_events_handlers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `eventname` VARCHAR(166) NOT NULL COMMENT 'name of the event, e.g. ''grade_updated''',
    `component` VARCHAR(166) NOT NULL COMMENT 'e.g. moodle, mod_forum, block_rss_client',
    `handlerfile` VARCHAR(255) NOT NULL COMMENT 'path to the file of the function, eg /grade/export/lib.php',
    `handlerfunction` LONGTEXT NULL COMMENT 'serialized string or array describing function, suitable to be passed to call_user_func()',
    `schedule` VARCHAR(255) NULL COMMENT '''cron'' or ''instant''.',
    `status` BIGINT NOT NULL DEFAULT 0 COMMENT 'number of failed attempts to process this handler',
    `internal` TINYINT NOT NULL DEFAULT 1 COMMENT '1 means standard plugin handler, 0 indicates if event handler sends data to external systems, this is used for example to prevent immediate sending of events from pending db transactions',
    PRIMARY KEY (`id`),
    UNIQUE KEY `eventname-component` (`eventname`, `component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table is for storing which components requests what type of event, and the location of the responsible handlers. For example, the assignment registers ''grade_updated'' event with a function assignment_grade_handler() that should be called event time an ''grade_updated'' event is triggered by grade_update() function.';

CREATE TABLE `mdl_events_queue` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `eventdata` LONGTEXT NOT NULL COMMENT 'serialized version of the data object passed to the event handler.',
    `stackdump` LONGTEXT NULL COMMENT 'serialized debug_backtrace showing where the event was fired from',
    `userid` BIGINT NULL COMMENT '$USER-&gt;id when the event was fired',
    `timecreated` BIGINT NOT NULL COMMENT 'time stamp of the first time this was added',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_events_queue_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table is for storing queued events. It stores only one copy of the eventdata here, and entries from this table are being references by the event_queue_handlers table.';

CREATE TABLE `mdl_events_queue_handlers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `queuedeventid` BIGINT NOT NULL COMMENT 'foreign key id corresponding to the id of the event_queues table',
    `handlerid` BIGINT NOT NULL COMMENT 'foreign key id corresponding to the id of the event_handlers table',
    `status` BIGINT NULL COMMENT 'number of failed attempts to process this handler',
    `errormessage` LONGTEXT NULL COMMENT 'if an error happened last time we tried to process this event, record it here.',
    `timemodified` BIGINT NOT NULL COMMENT 'time stamp of the last attempt to run this from the queue',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_events_queue_handlers_queuedeventid_fk` FOREIGN KEY (`queuedeventid`) REFERENCES `mdl_events_queue` (`id`),
    CONSTRAINT `mdl_events_queue_handlers_handlerid_fk` FOREIGN KEY (`handlerid`) REFERENCES `mdl_events_handlers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is the list of queued handlers for processing. The event object is retrieved from the events_queue table. When no further reference is made to the event_queues table, the corresponding entry in the events_queue table should be deleted. Entry should get deleted after a successful event processing by the specified handler.';

CREATE TABLE `mdl_external_functions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `classname` VARCHAR(100) NOT NULL,
    `methodname` VARCHAR(100) NOT NULL,
    `classpath` VARCHAR(255) NULL,
    `component` VARCHAR(100) NOT NULL,
    `capabilities` VARCHAR(255) NULL COMMENT 'all capabilities that are required to be run by the function (separated by comma)',
    `services` VARCHAR(1333) NULL COMMENT 'all the services (by shortname) where this function must be included',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='list of all external functions';

CREATE TABLE `mdl_external_services` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `enabled` TINYINT NOT NULL,
    `requiredcapability` VARCHAR(150) NULL,
    `restrictedusers` TINYINT NOT NULL,
    `component` VARCHAR(100) NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    `shortname` VARCHAR(255) NULL COMMENT 'a unique shortname',
    `downloadfiles` TINYINT NOT NULL DEFAULT 0 COMMENT '1 if the service allow people to download file from webservice/plugins.php - 0 if not',
    `uploadfiles` TINYINT NOT NULL DEFAULT 0 COMMENT '1 if the service allow people to upload files to webservice/upload.php - 0 if not',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='built in and custom external services';

CREATE TABLE `mdl_external_services_functions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `externalserviceid` BIGINT NOT NULL,
    `functionname` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_external_services_functions_externalserviceid_fk` FOREIGN KEY (`externalserviceid`) REFERENCES `mdl_external_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='lists functions available in each service group';

CREATE TABLE `mdl_external_services_users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `externalserviceid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `iprestriction` VARCHAR(255) NULL COMMENT 'ip restriction',
    `validuntil` BIGINT NULL COMMENT 'timestampt - valid until data',
    `timecreated` BIGINT NULL COMMENT 'created timestamp',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_external_services_users_externalserviceid_fk` FOREIGN KEY (`externalserviceid`) REFERENCES `mdl_external_services` (`id`),
    CONSTRAINT `mdl_external_services_users_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='users allowed to use services with restricted users flag';

CREATE TABLE `mdl_external_tokens` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `token` VARCHAR(128) NOT NULL COMMENT 'security token, aka private access key',
    `privatetoken` VARCHAR(64) NULL COMMENT 'private token, generated at the same time that the token, must be stored safely by the ws client, to be transmitted only via https',
    `tokentype` SMALLINT NOT NULL COMMENT 'type of token: 0=permanent, no session; 1=linked to current browser session via sid; 2=permanent, with emulated session',
    `userid` BIGINT NOT NULL COMMENT 'owner of the token',
    `externalserviceid` BIGINT NOT NULL,
    `sid` VARCHAR(128) NULL COMMENT 'link to browser or emulated session',
    `contextid` BIGINT NOT NULL COMMENT 'context id where in token valid',
    `creatorid` BIGINT NOT NULL DEFAULT 1 COMMENT 'user id of the token creator (useful to know when the administrator created a token and so display the token to a specific administrator)',
    `iprestriction` VARCHAR(255) NULL COMMENT 'ip restriction',
    `validuntil` BIGINT NULL COMMENT 'timestampt - valid until data',
    `timecreated` BIGINT NOT NULL COMMENT 'created timestamp',
    `lastaccess` BIGINT NULL COMMENT 'last access timestamp',
    `name` VARCHAR(255) NULL COMMENT 'token name, used to identify the token at the table view',
    PRIMARY KEY (`id`),
    KEY `token` (`token`),
    KEY `sid` (`sid`),
    CONSTRAINT `mdl_external_tokens_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_external_tokens_externalserviceid_fk` FOREIGN KEY (`externalserviceid`) REFERENCES `mdl_external_services` (`id`),
    CONSTRAINT `mdl_external_tokens_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_external_tokens_creatorid_fk` FOREIGN KEY (`creatorid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Security tokens for accessing of external services';

CREATE TABLE `mdl_favourite` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(100) NOT NULL COMMENT 'Defines the Moodle component in which the favourite was created.',
    `itemtype` VARCHAR(100) NOT NULL COMMENT 'The type of the item which is being favourited. Usually a table name, but doesn''t have to be. E.g. ''messages'' or ''message_conversations''.',
    `itemid` BIGINT NOT NULL COMMENT 'The identifier of the item which is being favourited.',
    `contextid` BIGINT NOT NULL COMMENT 'The context id of the item being favourited',
    `userid` BIGINT NOT NULL COMMENT 'The id of the user to whom the favourite belongs',
    `ordering` BIGINT NULL COMMENT 'Optional ordering of the favourite within its context area. For example, this allows things like sorting favourite message conversations.',
    `timecreated` BIGINT NOT NULL COMMENT 'Creation time',
    `timemodified` BIGINT NOT NULL COMMENT 'Last modification time',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniqueuserfavouriteitem` (`component`, `itemtype`, `itemid`, `contextid`, `userid`),
    CONSTRAINT `mdl_favourite_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_favourite_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the relationship between an arbitrary item (itemtype, itemid), and a context area (component, contextid) for a specific user. Used by the favourites subsystem.';

CREATE TABLE `mdl_feedback` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `anonymous` TINYINT NOT NULL DEFAULT 1,
    `email_notification` TINYINT NOT NULL DEFAULT 1,
    `multiple_submit` TINYINT NOT NULL DEFAULT 1,
    `autonumbering` TINYINT NOT NULL DEFAULT 1,
    `site_after_submit` VARCHAR(255) NOT NULL,
    `page_after_submit` LONGTEXT NOT NULL,
    `page_after_submitformat` TINYINT NOT NULL DEFAULT 0,
    `publish_stats` TINYINT NOT NULL DEFAULT 0,
    `timeopen` BIGINT NOT NULL DEFAULT 0,
    `timeclose` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `completionsubmit` TINYINT NOT NULL DEFAULT 0 COMMENT 'If this field is set to 1, then the activity will be automatically marked as ''complete'' once the user submits their choice.',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all feedbacks';

CREATE TABLE `mdl_feedback_completed` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `feedback` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `random_response` BIGINT NOT NULL DEFAULT 0,
    `anonymous_response` TINYINT NOT NULL DEFAULT 0,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_feedback_completed_feedback_fk` FOREIGN KEY (`feedback`) REFERENCES `mdl_feedback` (`id`),
    CONSTRAINT `mdl_feedback_completed_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='filled out feedback';

CREATE TABLE `mdl_feedback_completedtmp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `feedback` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `guestid` VARCHAR(255) NOT NULL,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `random_response` BIGINT NOT NULL DEFAULT 0,
    `anonymous_response` TINYINT NOT NULL DEFAULT 0,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_feedback_completedtmp_feedback_fk` FOREIGN KEY (`feedback`) REFERENCES `mdl_feedback` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='filled out feedback';

CREATE TABLE `mdl_feedback_item` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `feedback` BIGINT NOT NULL DEFAULT 0,
    `template` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `presentation` LONGTEXT NOT NULL,
    `typ` VARCHAR(255) NOT NULL,
    `hasvalue` TINYINT NOT NULL DEFAULT 0,
    `position` SMALLINT NOT NULL DEFAULT 0,
    `required` TINYINT NOT NULL DEFAULT 0,
    `dependitem` BIGINT NOT NULL DEFAULT 0,
    `dependvalue` VARCHAR(255) NOT NULL,
    `options` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_feedback_item_feedback_fk` FOREIGN KEY (`feedback`) REFERENCES `mdl_feedback` (`id`),
    CONSTRAINT `mdl_feedback_item_template_fk` FOREIGN KEY (`template`) REFERENCES `mdl_feedback_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='feedback_items';

CREATE TABLE `mdl_feedback_sitecourse_map` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `feedbackid` BIGINT NOT NULL DEFAULT 0,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    CONSTRAINT `mdl_feedback_sitecourse_map_feedbackid_fk` FOREIGN KEY (`feedbackid`) REFERENCES `mdl_feedback` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='feedback sitecourse map';

CREATE TABLE `mdl_feedback_template` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `ispublic` TINYINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='templates of feedbackstructures';

CREATE TABLE `mdl_feedback_value` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course_id` BIGINT NOT NULL DEFAULT 0,
    `item` BIGINT NOT NULL DEFAULT 0,
    `completed` BIGINT NOT NULL DEFAULT 0,
    `tmp_completed` BIGINT NOT NULL DEFAULT 0,
    `value` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `completed_item` (`completed`, `item`, `course_id`),
    KEY `course_id` (`course_id`),
    CONSTRAINT `mdl_feedback_value_item_fk` FOREIGN KEY (`item`) REFERENCES `mdl_feedback_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='values of the completeds';

CREATE TABLE `mdl_feedback_valuetmp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course_id` BIGINT NOT NULL DEFAULT 0,
    `item` BIGINT NOT NULL DEFAULT 0,
    `completed` BIGINT NOT NULL DEFAULT 0,
    `tmp_completed` BIGINT NOT NULL DEFAULT 0,
    `value` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `completed_item` (`completed`, `item`, `course_id`),
    KEY `course_id` (`course_id`),
    CONSTRAINT `mdl_feedback_valuetmp_item_fk` FOREIGN KEY (`item`) REFERENCES `mdl_feedback_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='values of the completedstmp';

CREATE TABLE `mdl_file_conversion` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `usermodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `sourcefileid` BIGINT NOT NULL,
    `targetformat` VARCHAR(100) NOT NULL,
    `status` BIGINT NULL DEFAULT 0,
    `statusmessage` LONGTEXT NULL,
    `converter` VARCHAR(255) NULL,
    `destfileid` BIGINT NULL,
    `data` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_file_conversion_sourcefileid_fk` FOREIGN KEY (`sourcefileid`) REFERENCES `mdl_files` (`id`),
    CONSTRAINT `mdl_file_conversion_destfileid_fk` FOREIGN KEY (`destfileid`) REFERENCES `mdl_files` (`id`),
    CONSTRAINT `mdl_file_conversion_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to track file conversions.';

CREATE TABLE `mdl_files` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contenthash` VARCHAR(40) NOT NULL COMMENT 'sha1 hash of file content',
    `pathnamehash` VARCHAR(40) NOT NULL COMMENT 'complete file path sha1 hash - unique for each file',
    `contextid` BIGINT NOT NULL COMMENT 'The context id defined in context table - identifies the instance of plugin owning the file',
    `component` VARCHAR(100) NOT NULL COMMENT 'Full name of the component owning the area',
    `filearea` VARCHAR(50) NOT NULL COMMENT 'Like "coursefiles". "submission", "intro" and "content" (images and swf linked from summaries), etc.',
    `itemid` BIGINT NOT NULL COMMENT 'Optional - some plugin specific item id (eg. forum post, blog entry or assignment submission, user id for user files)',
    `filepath` VARCHAR(255) NOT NULL COMMENT 'Optional - relative path to file from module content root, useful in Scorm and Resource mod - most of the mods do not need this',
    `filename` VARCHAR(255) NOT NULL COMMENT 'The full Unicode name of this file (case sensitive) - some chars are not allowed though',
    `userid` BIGINT NULL COMMENT 'Optional - general userid field - meaning depending on plugin',
    `filesize` BIGINT NOT NULL,
    `mimetype` VARCHAR(100) NULL COMMENT 'type of file - jpeg image, open document spreadsheet',
    `status` BIGINT NOT NULL DEFAULT 0 COMMENT 'number greater than 0 means something is wrong with this file (virus, missing, etc.)',
    `source` LONGTEXT NULL COMMENT 'contains the reference if the file is imported from external sites',
    `author` VARCHAR(255) NULL COMMENT 'The original author of the file',
    `license` VARCHAR(255) NULL COMMENT 'license of the file to guide reuse',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'order of files',
    `referencefileid` BIGINT NULL COMMENT 'Use to indicate file is a proxy for repository file',
    PRIMARY KEY (`id`),
    UNIQUE KEY `pathnamehash` (`pathnamehash`),
    KEY `component-filearea-contextid-itemid` (`component`, `filearea`, `contextid`, `itemid`),
    KEY `contenthash` (`contenthash`),
    KEY `license` (`license`),
    KEY `filename` (`filename`),
    CONSTRAINT `mdl_files_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_files_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_files_referencefileid_fk` FOREIGN KEY (`referencefileid`) REFERENCES `mdl_files_reference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='description of files, content is stored in sha1 file pool';

CREATE TABLE `mdl_files_reference` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `repositoryid` BIGINT NOT NULL,
    `lastsync` BIGINT NULL COMMENT 'Last time the proxy file was synced with repository',
    `reference` LONGTEXT NULL COMMENT 'Identification of the external file. Repository plugins are interpreting it to locate the external file.',
    `referencehash` VARCHAR(40) NOT NULL COMMENT 'Internal implementation detail, contains SHA1 hash of the reference field. Can be indexed and used for comparison. Not meant to be used by a non-core code.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_external_file` (`referencehash`, `repositoryid`),
    CONSTRAINT `mdl_files_reference_repositoryid_fk` FOREIGN KEY (`repositoryid`) REFERENCES `mdl_repository_instances` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store files references';

CREATE TABLE `mdl_filter_active` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `filter` VARCHAR(32) NOT NULL COMMENT 'The filter internal name, like ''tex''.',
    `contextid` BIGINT NOT NULL COMMENT 'References context.id.',
    `active` SMALLINT NOT NULL COMMENT 'Whether this filter is active in this context. +1 = On, -1 = Off, no row with this contextid = inherit. As a special case, when contextid points to the system context, -9999 means this filter is completely disabled.',
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'Only relevant if contextid points to the system context. In other cases this field should contain 0. The order in which the filters should be applied.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `contextid-filter` (`contextid`, `filter`),
    CONSTRAINT `mdl_filter_active_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores information about which filters are active in which contexts. Also the filter sort order. See get_active_filters in lib/filterlib.php for how this data is used.';

CREATE TABLE `mdl_filter_config` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `filter` VARCHAR(32) NOT NULL COMMENT 'The filter internal name, like ''tex''.',
    `contextid` BIGINT NOT NULL COMMENT 'References context.id.',
    `name` VARCHAR(255) NOT NULL COMMENT 'The config variable name.',
    `value` LONGTEXT NULL COMMENT 'The correspoding config variable value.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `contextid-filter-name` (`contextid`, `filter`, `name`),
    CONSTRAINT `mdl_filter_config_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores per-context configuration settings for filters which have them.';

CREATE TABLE `mdl_folder` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `revision` BIGINT NOT NULL DEFAULT 0 COMMENT 'incremented when after each file changes, solves browser caching issues',
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `display` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Display type of folder contents - on a separate page or inline',
    `showexpanded` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = expanded, 0 = collapsed for sub-folders',
    `showdownloadfolder` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = show download folder button',
    `forcedownload` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = force download of individual files',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='each record is one folder resource';

CREATE TABLE `mdl_forum` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `type` VARCHAR(20) NOT NULL DEFAULT 'general',
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'text format of intro field',
    `duedate` BIGINT NOT NULL DEFAULT 0 COMMENT 'A due date to show in the calendar. Not used for grading.',
    `cutoffdate` BIGINT NOT NULL DEFAULT 0 COMMENT 'The final date after which forum posts will no longer be accepted for this forum.',
    `assessed` BIGINT NOT NULL DEFAULT 0,
    `assesstimestart` BIGINT NOT NULL DEFAULT 0,
    `assesstimefinish` BIGINT NOT NULL DEFAULT 0,
    `scale` BIGINT NOT NULL DEFAULT 0,
    `grade_forum` BIGINT NOT NULL DEFAULT 0,
    `grade_forum_notify` SMALLINT NOT NULL DEFAULT 0,
    `maxbytes` BIGINT NOT NULL DEFAULT 0,
    `maxattachments` BIGINT NOT NULL DEFAULT 1 COMMENT 'Number of attachments allowed per post',
    `forcesubscribe` TINYINT NOT NULL DEFAULT 0,
    `trackingtype` TINYINT NOT NULL DEFAULT 1,
    `rsstype` TINYINT NOT NULL DEFAULT 0,
    `rssarticles` TINYINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `warnafter` BIGINT NOT NULL DEFAULT 0,
    `blockafter` BIGINT NOT NULL DEFAULT 0,
    `blockperiod` BIGINT NOT NULL DEFAULT 0,
    `completiondiscussions` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if a certain number of posts are required to mark this forum completed for a user.',
    `completionreplies` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if a certain number of replies are required to mark this forum complete for a user.',
    `completionposts` INT NOT NULL DEFAULT 0 COMMENT 'Nonzero if a certain number of posts or replies (total) are required to mark this forum complete for a user.',
    `displaywordcount` TINYINT NOT NULL DEFAULT 0,
    `lockdiscussionafter` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Forums contain and structure discussion';

CREATE TABLE `mdl_forum_digests` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `forum` BIGINT NOT NULL,
    `maildigest` TINYINT NOT NULL DEFAULT -1,
    PRIMARY KEY (`id`),
    UNIQUE KEY `forumdigest` (`forum`, `userid`, `maildigest`),
    CONSTRAINT `mdl_forum_digests_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_forum_digests_forum_fk` FOREIGN KEY (`forum`) REFERENCES `mdl_forum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of user mail delivery preferences for each forum';

CREATE TABLE `mdl_forum_discussion_subs` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `forum` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `discussion` BIGINT NOT NULL,
    `preference` BIGINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_discussions` (`userid`, `discussion`),
    CONSTRAINT `mdl_forum_discussion_subs_forum_fk` FOREIGN KEY (`forum`) REFERENCES `mdl_forum` (`id`),
    CONSTRAINT `mdl_forum_discussion_subs_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_forum_discussion_subs_discussion_fk` FOREIGN KEY (`discussion`) REFERENCES `mdl_forum_discussions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Users may choose to subscribe and unsubscribe from specific discussions.';

CREATE TABLE `mdl_forum_discussions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `forum` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `firstpost` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT -1,
    `assessed` TINYINT NOT NULL DEFAULT 1,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timestart` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `pinned` TINYINT NOT NULL DEFAULT 0,
    `timelocked` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    KEY `course` (`course`),
    CONSTRAINT `mdl_forum_discussions_forum_fk` FOREIGN KEY (`forum`) REFERENCES `mdl_forum` (`id`),
    CONSTRAINT `mdl_forum_discussions_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Forums are composed of discussions';

CREATE TABLE `mdl_forum_grades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `forum` BIGINT NOT NULL COMMENT 'The ID of the forum that this grade relates to',
    `itemnumber` BIGINT NOT NULL COMMENT 'The grade itemnumber',
    `userid` BIGINT NOT NULL COMMENT 'The user who was graded',
    `grade` DECIMAL(10,5) NULL COMMENT 'The numerical grade for this user''s forum assessment. Can be determined by scales/advancedgradingforms etc but will always be converted back to a floating point number.',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `forumusergrade` (`forum`, `itemnumber`, `userid`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_forum_grades_forum_fk` FOREIGN KEY (`forum`) REFERENCES `mdl_forum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Grading data for forum instances';

CREATE TABLE `mdl_forum_posts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `discussion` BIGINT NOT NULL DEFAULT 0,
    `parent` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `created` BIGINT NOT NULL DEFAULT 0,
    `modified` BIGINT NOT NULL DEFAULT 0,
    `mailed` TINYINT NOT NULL DEFAULT 0,
    `subject` VARCHAR(255) NOT NULL,
    `message` LONGTEXT NOT NULL,
    `messageformat` TINYINT NOT NULL DEFAULT 0,
    `messagetrust` TINYINT NOT NULL DEFAULT 0,
    `attachment` VARCHAR(100) NOT NULL,
    `totalscore` SMALLINT NOT NULL DEFAULT 0,
    `mailnow` BIGINT NOT NULL DEFAULT 0,
    `deleted` TINYINT NOT NULL DEFAULT 0,
    `privatereplyto` BIGINT NOT NULL DEFAULT 0,
    `wordcount` BIGINT NULL,
    `charcount` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    KEY `created` (`created`),
    KEY `mailed` (`mailed`),
    KEY `privatereplyto` (`privatereplyto`),
    CONSTRAINT `mdl_forum_posts_discussion_fk` FOREIGN KEY (`discussion`) REFERENCES `mdl_forum_discussions` (`id`),
    CONSTRAINT `mdl_forum_posts_parent_fk` FOREIGN KEY (`parent`) REFERENCES `mdl_forum_posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='All posts are stored in this table';

CREATE TABLE `mdl_forum_queue` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `discussionid` BIGINT NOT NULL DEFAULT 0,
    `postid` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The modified time of the original post',
    PRIMARY KEY (`id`),
    KEY `user` (`userid`),
    CONSTRAINT `mdl_forum_queue_discussionid_fk` FOREIGN KEY (`discussionid`) REFERENCES `mdl_forum_discussions` (`id`),
    CONSTRAINT `mdl_forum_queue_postid_fk` FOREIGN KEY (`postid`) REFERENCES `mdl_forum_posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For keeping track of posts that will be mailed in digest form';

CREATE TABLE `mdl_forum_read` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `forumid` BIGINT NOT NULL DEFAULT 0,
    `discussionid` BIGINT NOT NULL DEFAULT 0,
    `postid` BIGINT NOT NULL DEFAULT 0,
    `firstread` BIGINT NOT NULL DEFAULT 0,
    `lastread` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `forumid-userid` (`forumid`, `userid`),
    KEY `discussionid-userid` (`discussionid`, `userid`),
    KEY `postid-userid` (`postid`, `userid`),
    KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks each users read posts';

CREATE TABLE `mdl_forum_subscriptions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `forum` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `useridforum` (`userid`, `forum`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_forum_subscriptions_forum_fk` FOREIGN KEY (`forum`) REFERENCES `mdl_forum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of who is subscribed to what forum';

CREATE TABLE `mdl_forum_track_prefs` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `forumid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid-forumid` (`userid`, `forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks each users untracked forums';

CREATE TABLE `mdl_glossary` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `allowduplicatedentries` TINYINT NOT NULL DEFAULT 0,
    `displayformat` VARCHAR(50) NOT NULL DEFAULT 'dictionary',
    `mainglossary` TINYINT NOT NULL DEFAULT 0,
    `showspecial` TINYINT NOT NULL DEFAULT 1,
    `showalphabet` TINYINT NOT NULL DEFAULT 1,
    `showall` TINYINT NOT NULL DEFAULT 1,
    `allowcomments` TINYINT NOT NULL DEFAULT 0,
    `allowprintview` TINYINT NOT NULL DEFAULT 1,
    `usedynalink` TINYINT NOT NULL DEFAULT 1,
    `defaultapproval` TINYINT NOT NULL DEFAULT 1,
    `approvaldisplayformat` VARCHAR(50) NOT NULL DEFAULT 'default' COMMENT 'Display Format when approving entries',
    `globalglossary` TINYINT NOT NULL DEFAULT 0,
    `entbypage` SMALLINT NOT NULL DEFAULT 10,
    `editalways` TINYINT NOT NULL DEFAULT 0,
    `rsstype` TINYINT NOT NULL DEFAULT 0,
    `rssarticles` TINYINT NOT NULL DEFAULT 0,
    `assessed` BIGINT NOT NULL DEFAULT 0,
    `assesstimestart` BIGINT NOT NULL DEFAULT 0,
    `assesstimefinish` BIGINT NOT NULL DEFAULT 0,
    `scale` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `completionentries` INT NOT NULL DEFAULT 0 COMMENT 'Non zero if a certain number of entries are required to mark this glossary complete for a user.',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all glossaries';

CREATE TABLE `mdl_glossary_alias` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `entryid` BIGINT NOT NULL DEFAULT 0,
    `alias` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_glossary_alias_entryid_fk` FOREIGN KEY (`entryid`) REFERENCES `mdl_glossary_entries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='entries alias';

CREATE TABLE `mdl_glossary_categories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `glossaryid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `usedynalink` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_glossary_categories_glossaryid_fk` FOREIGN KEY (`glossaryid`) REFERENCES `mdl_glossary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all categories for glossary entries';

CREATE TABLE `mdl_glossary_entries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `glossaryid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `concept` VARCHAR(255) NOT NULL,
    `definition` LONGTEXT NOT NULL,
    `definitionformat` TINYINT NOT NULL DEFAULT 0,
    `definitiontrust` TINYINT NOT NULL DEFAULT 0,
    `attachment` VARCHAR(100) NOT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `teacherentry` TINYINT NOT NULL DEFAULT 0,
    `sourceglossaryid` BIGINT NOT NULL DEFAULT 0,
    `usedynalink` TINYINT NOT NULL DEFAULT 1,
    `casesensitive` TINYINT NOT NULL DEFAULT 0,
    `fullmatch` TINYINT NOT NULL DEFAULT 1,
    `approved` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    KEY `concept` (`concept`),
    CONSTRAINT `mdl_glossary_entries_glossaryid_fk` FOREIGN KEY (`glossaryid`) REFERENCES `mdl_glossary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all glossary entries';

CREATE TABLE `mdl_glossary_entries_categories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `categoryid` BIGINT NOT NULL DEFAULT 0,
    `entryid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_glossary_entries_categories_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_glossary_categories` (`id`),
    CONSTRAINT `mdl_glossary_entries_categories_entryid_fk` FOREIGN KEY (`entryid`) REFERENCES `mdl_glossary_entries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='categories of each glossary entry';

CREATE TABLE `mdl_glossary_formats` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `popupformatname` VARCHAR(50) NOT NULL,
    `visible` TINYINT NOT NULL DEFAULT 1,
    `showgroup` TINYINT NOT NULL DEFAULT 1,
    `showtabs` VARCHAR(100) NULL,
    `defaultmode` VARCHAR(50) NOT NULL,
    `defaulthook` VARCHAR(50) NOT NULL,
    `sortkey` VARCHAR(50) NOT NULL,
    `sortorder` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Setting of the display formats';

CREATE TABLE `mdl_grade_categories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'The course this grade category is part of',
    `parent` BIGINT NULL COMMENT 'Categories can be hierarchical',
    `depth` BIGINT NOT NULL DEFAULT 0 COMMENT 'How many parents does this category have?',
    `path` VARCHAR(255) NULL COMMENT 'shows the path as /1/2/3 (like course_categories)',
    `fullname` VARCHAR(255) NOT NULL COMMENT 'The name of this grade category',
    `aggregation` BIGINT NOT NULL DEFAULT 0 COMMENT 'A constant pointing to one of the predefined aggregation strategies (none, mean,median,sum, etc)',
    `keephigh` BIGINT NOT NULL DEFAULT 0 COMMENT 'Keep only the X highest items',
    `droplow` BIGINT NOT NULL DEFAULT 0 COMMENT 'Drop the X lowest items',
    `aggregateonlygraded` TINYINT NOT NULL DEFAULT 0 COMMENT 'aggregate only graded activities',
    `aggregateoutcomes` TINYINT NOT NULL DEFAULT 0 COMMENT 'Aggregate outcomes',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `hidden` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_grade_categories_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_grade_categories_parent_fk` FOREIGN KEY (`parent`) REFERENCES `mdl_grade_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table keeps information about categories, used for grouping items.';

CREATE TABLE `mdl_grade_categories_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `action` BIGINT NOT NULL DEFAULT 0 COMMENT 'created/modified/deleted constants',
    `oldid` BIGINT NOT NULL,
    `source` VARCHAR(255) NULL COMMENT 'What caused the modification? manual/module/import/...',
    `timemodified` BIGINT NULL COMMENT 'The last time this grade_item was modified',
    `loggeduser` BIGINT NULL COMMENT 'the userid of the person who last modified this outcome',
    `courseid` BIGINT NOT NULL COMMENT 'The course this grade category is part of',
    `parent` BIGINT NULL COMMENT 'Categories can be hierarchical',
    `depth` BIGINT NOT NULL DEFAULT 0 COMMENT 'How many parents does this category have?',
    `path` VARCHAR(255) NULL COMMENT 'shows the path as /1/2/3 (like course_categories)',
    `fullname` VARCHAR(255) NOT NULL COMMENT 'The name of this grade category',
    `aggregation` BIGINT NOT NULL DEFAULT 0 COMMENT 'A constant pointing to one of the predefined aggregation strategies (none, mean,median,sum, etc)',
    `keephigh` BIGINT NOT NULL DEFAULT 0 COMMENT 'Keep only the X highest items',
    `droplow` BIGINT NOT NULL DEFAULT 0 COMMENT 'Drop the X lowest items',
    `aggregateonlygraded` TINYINT NOT NULL DEFAULT 0 COMMENT 'aggregate only graded items',
    `aggregateoutcomes` TINYINT NOT NULL DEFAULT 0 COMMENT 'Aggregate outcomes',
    `aggregatesubcats` TINYINT NOT NULL DEFAULT 0 COMMENT 'This setting was removed from grade_categories. It is kept here only to preserve history.',
    `hidden` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `action` (`action`),
    KEY `timemodified` (`timemodified`),
    CONSTRAINT `mdl_grade_categories_history_oldid_fk` FOREIGN KEY (`oldid`) REFERENCES `mdl_grade_categories` (`id`),
    CONSTRAINT `mdl_grade_categories_history_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_grade_categories_history_parent_fk` FOREIGN KEY (`parent`) REFERENCES `mdl_grade_categories` (`id`),
    CONSTRAINT `mdl_grade_categories_history_loggeduser_fk` FOREIGN KEY (`loggeduser`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History of grade_categories';

CREATE TABLE `mdl_grade_grades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `itemid` BIGINT NOT NULL COMMENT 'The item this grade belongs to',
    `userid` BIGINT NOT NULL COMMENT 'The user who this grade is for',
    `rawgrade` DECIMAL(10,5) NULL COMMENT 'If the grade is a float value (or has been converted to one)',
    `rawgrademax` DECIMAL(10,5) NOT NULL DEFAULT 100 COMMENT 'The maximum allowable grade when this was created',
    `rawgrademin` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'The minimum allowable grade when this was created',
    `rawscaleid` BIGINT NULL COMMENT 'If this grade is based on a scale, which one was it?',
    `usermodified` BIGINT NULL COMMENT 'the userid of the person who last modified this grade',
    `finalgrade` DECIMAL(10,5) NULL COMMENT 'The final grade (cached) after all calculations are made',
    `hidden` BIGINT NOT NULL DEFAULT 0 COMMENT 'show 0, hide 1 or hide until date',
    `locked` BIGINT NOT NULL DEFAULT 0 COMMENT 'not locked 0, locked from date',
    `locktime` BIGINT NOT NULL DEFAULT 0 COMMENT 'automatic locking of final grade, 0 means none, date otherwise',
    `exported` BIGINT NOT NULL DEFAULT 0 COMMENT 'date of last grade export, 0 if none',
    `overridden` BIGINT NOT NULL DEFAULT 0 COMMENT 'indicates grade overridden from gradebook, 0 means none, date means overridden',
    `excluded` BIGINT NOT NULL DEFAULT 0 COMMENT 'grade excluded from aggregation functions, date means when excluded',
    `feedback` LONGTEXT NULL COMMENT 'grading feedback',
    `feedbackformat` BIGINT NOT NULL DEFAULT 0 COMMENT 'format of feedback text',
    `information` LONGTEXT NULL COMMENT 'optiona information',
    `informationformat` BIGINT NOT NULL DEFAULT 0 COMMENT 'format of information text',
    `timecreated` BIGINT NULL COMMENT 'the time this grade was first created',
    `timemodified` BIGINT NULL COMMENT 'the time this grade was last modified',
    `aggregationstatus` VARCHAR(10) NOT NULL DEFAULT 'unknown' COMMENT 'One of several values describing how this grade_grade was used when calculating the aggregation. Possible values are "unknown", "dropped", "novalue", "used"',
    `aggregationweight` DECIMAL(10,5) NULL COMMENT 'If the aggregationstatus == ''included'', then this is the percent this item contributed to the aggregation.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-itemid` (`userid`, `itemid`),
    KEY `locked-locktime` (`locked`, `locktime`),
    CONSTRAINT `mdl_grade_grades_itemid_fk` FOREIGN KEY (`itemid`) REFERENCES `mdl_grade_items` (`id`),
    CONSTRAINT `mdl_grade_grades_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_grade_grades_rawscaleid_fk` FOREIGN KEY (`rawscaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_grade_grades_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='grade_grades  This table keeps individual grades for each user and each item, exactly as imported or submitted by modules. The rawgrademax/min and rawscaleid are stored here to record the values at the time the grade was stored, because teachers might change this for an activity! All the results are normalised/resampled for the final grade value.';

CREATE TABLE `mdl_grade_grades_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `action` BIGINT NOT NULL DEFAULT 0 COMMENT 'created/modified/deleted constants',
    `oldid` BIGINT NOT NULL,
    `source` VARCHAR(255) NULL COMMENT 'What caused the modification? manual/module/import/...',
    `timemodified` BIGINT NULL COMMENT 'The last time this grade_item was modified',
    `loggeduser` BIGINT NULL COMMENT 'the userid of the person who last modified this outcome',
    `itemid` BIGINT NOT NULL COMMENT 'The item this grade belongs to',
    `userid` BIGINT NOT NULL COMMENT 'The user who this grade is for',
    `rawgrade` DECIMAL(10,5) NULL COMMENT 'If the grade is a float value (or has been converted to one)',
    `rawgrademax` DECIMAL(10,5) NOT NULL DEFAULT 100 COMMENT 'The maximum allowable grade when this was created',
    `rawgrademin` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'The minimum allowable grade when this was created',
    `rawscaleid` BIGINT NULL COMMENT 'If this grade is based on a scale, which one was it?',
    `usermodified` BIGINT NULL COMMENT 'the userid of the person who last modified this grade',
    `finalgrade` DECIMAL(10,5) NULL COMMENT 'The final grade (cached) after all calculations are made',
    `hidden` BIGINT NOT NULL DEFAULT 0 COMMENT 'show 0, hide 1 or hide until date',
    `locked` BIGINT NOT NULL DEFAULT 0 COMMENT 'not locked 0, locked from date',
    `locktime` BIGINT NOT NULL DEFAULT 0 COMMENT 'automatic locking of final grade, 0 means none, date otherwise',
    `exported` BIGINT NOT NULL DEFAULT 0 COMMENT 'date of last grade export, 0 if none',
    `overridden` BIGINT NOT NULL DEFAULT 0 COMMENT 'indicates grade overridden from gradebook, 0 means none, date means overridden',
    `excluded` BIGINT NOT NULL DEFAULT 0 COMMENT 'grade excluded from aggregation functions, date means when excluded',
    `feedback` LONGTEXT NULL COMMENT 'grading feedback',
    `feedbackformat` BIGINT NOT NULL DEFAULT 0 COMMENT 'format of feedback text',
    `information` LONGTEXT NULL COMMENT 'optiona information',
    `informationformat` BIGINT NOT NULL DEFAULT 0 COMMENT 'format of information text',
    PRIMARY KEY (`id`),
    KEY `action` (`action`),
    KEY `timemodified` (`timemodified`),
    KEY `userid-itemid-timemodified` (`userid`, `itemid`, `timemodified`),
    CONSTRAINT `mdl_grade_grades_history_oldid_fk` FOREIGN KEY (`oldid`) REFERENCES `mdl_grade_grades` (`id`),
    CONSTRAINT `mdl_grade_grades_history_itemid_fk` FOREIGN KEY (`itemid`) REFERENCES `mdl_grade_items` (`id`),
    CONSTRAINT `mdl_grade_grades_history_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_grade_grades_history_rawscaleid_fk` FOREIGN KEY (`rawscaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_grade_grades_history_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_grade_grades_history_loggeduser_fk` FOREIGN KEY (`loggeduser`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History table';

CREATE TABLE `mdl_grade_import_newitem` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `itemname` VARCHAR(255) NOT NULL COMMENT 'new grade item name',
    `importcode` BIGINT NOT NULL COMMENT 'import batch code for identification',
    `importer` BIGINT NOT NULL COMMENT 'user importing the data',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_grade_import_newitem_importer_fk` FOREIGN KEY (`importer`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='temporary table for storing new grade_item names from grade import';

CREATE TABLE `mdl_grade_import_values` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `itemid` BIGINT NULL COMMENT 'if set, this points to existing grade_items id',
    `newgradeitem` BIGINT NULL COMMENT 'if set, points to the id of grade_import_newitem',
    `userid` BIGINT NOT NULL,
    `finalgrade` DECIMAL(10,5) NULL COMMENT 'raw grade value',
    `feedback` LONGTEXT NULL,
    `importcode` BIGINT NOT NULL COMMENT 'similar to backup_code, a unique batch code for identifying one batch of imports',
    `importer` BIGINT NULL,
    `importonlyfeedback` TINYINT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_grade_import_values_itemid_fk` FOREIGN KEY (`itemid`) REFERENCES `mdl_grade_items` (`id`),
    CONSTRAINT `mdl_grade_import_values_newgradeitem_fk` FOREIGN KEY (`newgradeitem`) REFERENCES `mdl_grade_import_newitem` (`id`),
    CONSTRAINT `mdl_grade_import_values_importer_fk` FOREIGN KEY (`importer`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_grade_import_values_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Temporary table for importing grades';

CREATE TABLE `mdl_grade_items` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NULL COMMENT 'The course this item is part of',
    `categoryid` BIGINT NULL COMMENT '(optional) the category group this item belongs to',
    `itemname` VARCHAR(255) NULL COMMENT 'The name of this item (pushed in by the module)',
    `itemtype` VARCHAR(30) NOT NULL COMMENT '''mod'', ''blocks'', ''import'', ''calculated'' etc',
    `itemmodule` VARCHAR(30) NULL COMMENT '''forum'', ''quiz'', ''csv'', etc',
    `iteminstance` BIGINT NULL COMMENT 'id of the item module',
    `itemnumber` BIGINT NULL COMMENT 'Can be used to distinguish multiple grades for an activity',
    `iteminfo` LONGTEXT NULL COMMENT 'Info and notes about this item XXX',
    `idnumber` VARCHAR(255) NULL COMMENT 'Arbitrary idnumber provided by the module responsible',
    `calculation` LONGTEXT NULL COMMENT 'Formula describing how to derive this grade from other items, referring to them using giXXX where XXX is grade item id ... eg something like: =sin(square([#gi20#])) + [#gi30#]',
    `gradetype` SMALLINT NOT NULL DEFAULT 1 COMMENT '0 = none, 1 = value, 2 = scale, 3 = text',
    `grademax` DECIMAL(10,5) NOT NULL DEFAULT 100 COMMENT 'What is the maximum allowable grade?',
    `grademin` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'What is the minimum allowable grade?',
    `scaleid` BIGINT NULL COMMENT 'If this grade is based on a scale, which one is it?',
    `outcomeid` BIGINT NULL COMMENT 'If this grade is related to an outcome, which one is it?',
    `gradepass` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'What grade is needed to pass? grademin &lt; gradepass &lt;= grademax',
    `multfactor` DECIMAL(10,5) NOT NULL DEFAULT 1.0 COMMENT 'Multiply all grades by this',
    `plusfactor` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'Add this to all grades',
    `aggregationcoef` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'Aggregation coefficient used for category weights or other aggregation types',
    `aggregationcoef2` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'Aggregation coefficient used for weights in aggregation types with both extra credit and weight',
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'Sorting order of the columns',
    `display` BIGINT NOT NULL DEFAULT 0 COMMENT 'Display as real grades, percentages (in reference to the minimum and maximum grades) or letters (A, B, C etc..), or course default (0)',
    `decimals` TINYINT NULL COMMENT 'Also known as precision, the number of digits after the decimal point symbol.',
    `hidden` BIGINT NOT NULL DEFAULT 0 COMMENT '1 is hidden, &gt; 1 is a date to hide until (prevents viewing)',
    `locked` BIGINT NOT NULL DEFAULT 0 COMMENT '1 is locked, &gt; 1 is a date to lock until (prevents update)',
    `locktime` BIGINT NOT NULL DEFAULT 0 COMMENT 'lock all final grades after this date',
    `needsupdate` BIGINT NOT NULL DEFAULT 0 COMMENT 'If this flag is set, then the whole column will be recalculated',
    `weightoverride` TINYINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NULL COMMENT 'The first time this grade_item was created',
    `timemodified` BIGINT NULL COMMENT 'The last time this grade_item was modified',
    PRIMARY KEY (`id`),
    KEY `locked-locktime` (`locked`, `locktime`),
    KEY `itemtype-needsupdate` (`itemtype`, `needsupdate`),
    KEY `gradetype` (`gradetype`),
    KEY `idnumber-courseid` (`idnumber`, `courseid`),
    KEY `itemtype-mod-inst-course` (`itemtype`, `itemmodule`, `iteminstance`, `courseid`),
    CONSTRAINT `mdl_grade_items_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_grade_items_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_grade_categories` (`id`),
    CONSTRAINT `mdl_grade_items_scaleid_fk` FOREIGN KEY (`scaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_grade_items_outcomeid_fk` FOREIGN KEY (`outcomeid`) REFERENCES `mdl_grade_outcomes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table keeps information about gradeable items (ie columns). If an activity (eg an assignment or quiz) has multiple grade_items associated with it (eg several outcomes or numerical grades), then there will be a corresponding multiple number of rows in this table.';

CREATE TABLE `mdl_grade_items_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `action` BIGINT NOT NULL DEFAULT 0 COMMENT 'created/modified/deleted constants',
    `oldid` BIGINT NOT NULL,
    `source` VARCHAR(255) NULL COMMENT 'What caused the modification? manual/module/import/...',
    `timemodified` BIGINT NULL COMMENT 'The last time this grade_item was modified',
    `loggeduser` BIGINT NULL COMMENT 'the userid of the person who last modified this outcome',
    `courseid` BIGINT NULL COMMENT 'The course this item is part of',
    `categoryid` BIGINT NULL COMMENT '(optional) the category group this item belongs to',
    `itemname` VARCHAR(255) NULL COMMENT 'The name of this item (pushed in by the module)',
    `itemtype` VARCHAR(30) NOT NULL COMMENT '''mod'', ''blocks'', ''import'', ''calculated'' etc',
    `itemmodule` VARCHAR(30) NULL COMMENT '''forum'', ''quiz'', ''csv'', etc',
    `iteminstance` BIGINT NULL COMMENT 'id of the item module',
    `itemnumber` BIGINT NULL COMMENT 'Can be used to distinguish multiple grades for an activity',
    `iteminfo` LONGTEXT NULL COMMENT 'Info and notes about this item XXX',
    `idnumber` VARCHAR(255) NULL COMMENT 'Arbitrary idnumber provided by the module responsible',
    `calculation` LONGTEXT NULL COMMENT 'Formula describing how to derive this grade from other items, referring to them using giXXX where XXX is grade item id ... eg something like: =sin(square([#gi20#])) + [#gi30#]',
    `gradetype` SMALLINT NOT NULL DEFAULT 1 COMMENT '0 = none, 1 = value, 2 = scale, 3 = text',
    `grademax` DECIMAL(10,5) NOT NULL DEFAULT 100 COMMENT 'What is the maximum allowable grade?',
    `grademin` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'What is the minimum allowable grade?',
    `scaleid` BIGINT NULL COMMENT 'If this grade is based on a scale, which one is it?',
    `outcomeid` BIGINT NULL COMMENT 'If this grade is related to an outcome, which one is it?',
    `gradepass` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'What grade is needed to pass? grademin &lt; gradepass &lt;= grademax',
    `multfactor` DECIMAL(10,5) NOT NULL DEFAULT 1.0 COMMENT 'Multiply all grades by this',
    `plusfactor` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'Add this to all grades',
    `aggregationcoef` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'Aggregation coefficient used for category weights or other aggregation types',
    `aggregationcoef2` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'Aggregation coefficient used for category weights or other aggregation types',
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'Sorting order of the columns',
    `hidden` BIGINT NOT NULL DEFAULT 0 COMMENT '1 is hidden, &gt; 1 is a date to hide until (prevents viewing)',
    `locked` BIGINT NOT NULL DEFAULT 0 COMMENT '1 is locked, &gt; 1 is a date to lock until (prevents update)',
    `locktime` BIGINT NOT NULL DEFAULT 0 COMMENT 'lock all final grades after this date',
    `needsupdate` BIGINT NOT NULL DEFAULT 0 COMMENT 'If this flag is set, then the whole column will be recalculated',
    `display` BIGINT NOT NULL DEFAULT 0,
    `decimals` TINYINT NULL,
    `weightoverride` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `action` (`action`),
    KEY `timemodified` (`timemodified`),
    CONSTRAINT `mdl_grade_items_history_oldid_fk` FOREIGN KEY (`oldid`) REFERENCES `mdl_grade_items` (`id`),
    CONSTRAINT `mdl_grade_items_history_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_grade_items_history_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_grade_categories` (`id`),
    CONSTRAINT `mdl_grade_items_history_scaleid_fk` FOREIGN KEY (`scaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_grade_items_history_outcomeid_fk` FOREIGN KEY (`outcomeid`) REFERENCES `mdl_grade_outcomes` (`id`),
    CONSTRAINT `mdl_grade_items_history_loggeduser_fk` FOREIGN KEY (`loggeduser`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History of grade_items';

CREATE TABLE `mdl_grade_letters` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL COMMENT 'What contextid does this letter apply to (for now these will always be courses, but later...)',
    `lowerboundary` DECIMAL(10,5) NOT NULL COMMENT 'The lower boundary of the letter. Its upper boundary is the lower boundary of the next highest letter, unless there is none above, in which case it''s grademax for that grade_item.',
    `letter` VARCHAR(255) NOT NULL COMMENT 'The display value of the letter. Can be any character or string of characters (OK, A, 10% etc..)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `contextid-lowerboundary-letter` (`contextid`, `lowerboundary`, `letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Repository for grade letters, for courses and other moodle entities that use grades.';

CREATE TABLE `mdl_grade_outcomes` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id of the table',
    `courseid` BIGINT NULL COMMENT 'Mostly these are defined site wide ie NULL',
    `shortname` VARCHAR(255) NOT NULL COMMENT 'The short name or code for this outcome statement',
    `fullname` LONGTEXT NOT NULL COMMENT 'The full description of the outcome (usually 1 sentence)',
    `scaleid` BIGINT NULL COMMENT 'The recommended scale for this outcome.',
    `description` LONGTEXT NULL COMMENT 'outcome description',
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NULL COMMENT 'the time this outcome was first created',
    `timemodified` BIGINT NULL COMMENT 'the time this outcome was last updated',
    `usermodified` BIGINT NULL COMMENT 'the userid of the person who last modified this outcome',
    PRIMARY KEY (`id`),
    UNIQUE KEY `courseid-shortname` (`courseid`, `shortname`),
    CONSTRAINT `mdl_grade_outcomes_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_grade_outcomes_scaleid_fk` FOREIGN KEY (`scaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_grade_outcomes_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table describes the outcomes used in the system. An outcome is a statement tied to a rubric scale from low to high, such as âNot met, Borderline, Metâ (stored as 0,1 or 2)';

CREATE TABLE `mdl_grade_outcomes_courses` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'id of the course',
    `outcomeid` BIGINT NOT NULL COMMENT 'id of the outcome',
    PRIMARY KEY (`id`),
    UNIQUE KEY `courseid-outcomeid` (`courseid`, `outcomeid`),
    CONSTRAINT `mdl_grade_outcomes_courses_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_grade_outcomes_courses_outcomeid_fk` FOREIGN KEY (`outcomeid`) REFERENCES `mdl_grade_outcomes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='stores what outcomes are used in what courses.';

CREATE TABLE `mdl_grade_outcomes_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `action` BIGINT NOT NULL DEFAULT 0 COMMENT 'created/modified/deleted constants',
    `oldid` BIGINT NOT NULL,
    `source` VARCHAR(255) NULL COMMENT 'What caused the modification? manual/module/import/...',
    `timemodified` BIGINT NULL COMMENT 'The last time this grade_item was modified',
    `loggeduser` BIGINT NULL COMMENT 'the userid of the person who last modified this outcome',
    `courseid` BIGINT NULL COMMENT 'Mostly these are defined site wide ie NULL',
    `shortname` VARCHAR(255) NOT NULL COMMENT 'The short name or code for this outcome statement',
    `fullname` LONGTEXT NOT NULL COMMENT 'The full description of the outcome (usually 1 sentence)',
    `scaleid` BIGINT NULL COMMENT 'The recommended scale for this outcome.',
    `description` LONGTEXT NULL COMMENT 'Outcome description',
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `action` (`action`),
    KEY `timemodified` (`timemodified`),
    CONSTRAINT `mdl_grade_outcomes_history_oldid_fk` FOREIGN KEY (`oldid`) REFERENCES `mdl_grade_outcomes` (`id`),
    CONSTRAINT `mdl_grade_outcomes_history_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_grade_outcomes_history_scaleid_fk` FOREIGN KEY (`scaleid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_grade_outcomes_history_loggeduser_fk` FOREIGN KEY (`loggeduser`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History table';

CREATE TABLE `mdl_grade_settings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `courseid-name` (`courseid`, `name`),
    CONSTRAINT `mdl_grade_settings_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='gradebook settings';

CREATE TABLE `mdl_grading_areas` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL COMMENT 'The context of the gradable area, eg module instance context.',
    `component` VARCHAR(100) NOT NULL COMMENT 'Frankenstyle name of the component holding this area',
    `areaname` VARCHAR(100) NOT NULL COMMENT 'The name of gradable area',
    `activemethod` VARCHAR(100) NULL COMMENT 'The default grading method (plugin) that should be used for this area',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_gradable_area` (`contextid`, `component`, `areaname`),
    CONSTRAINT `mdl_grading_areas_fk_context_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Identifies gradable areas where advanced grading can happen. For each area, the current active plugin can be set.';

CREATE TABLE `mdl_grading_definitions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `areaid` BIGINT NOT NULL,
    `method` VARCHAR(100) NOT NULL COMMENT 'The name of the plugin providing this grading form',
    `name` VARCHAR(255) NOT NULL COMMENT 'The title of the form that helps users to identify it',
    `description` LONGTEXT NULL COMMENT 'More detailed description of the form',
    `descriptionformat` TINYINT NULL COMMENT 'Format of the description field',
    `status` BIGINT NOT NULL DEFAULT 0 COMMENT 'Status of the form definition, by default in the under-construction state',
    `copiedfromid` BIGINT NULL COMMENT 'The id of the original definition that this was initially copied from or null if it was from scratch',
    `timecreated` BIGINT NOT NULL COMMENT 'The timestamp of when the form definition was created initially',
    `usercreated` BIGINT NOT NULL COMMENT 'The ID of the user who created this definition and is considered as its owner for access control purposes',
    `timemodified` BIGINT NOT NULL COMMENT 'The time stamp of when the form definition was modified recently',
    `usermodified` BIGINT NOT NULL COMMENT 'The ID of the user who did the most recent modification',
    `timecopied` BIGINT NULL DEFAULT 0 COMMENT 'The timestamp of when this form was most recently copied into another area',
    `options` LONGTEXT NULL COMMENT 'General field to be used by plugins as a general storage place for their own settings',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_area_method` (`areaid`, `method`),
    CONSTRAINT `mdl_grading_definitions_fk_areaid_fk` FOREIGN KEY (`areaid`) REFERENCES `mdl_grading_areas` (`id`),
    CONSTRAINT `mdl_grading_definitions_fk_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_grading_definitions_fk_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains the basic information about an advanced grading form defined in the given gradable area';

CREATE TABLE `mdl_grading_instances` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `definitionid` BIGINT NOT NULL COMMENT 'The ID of the form definition this is instance of',
    `raterid` BIGINT NOT NULL COMMENT 'The ID of the user who did the assessment',
    `itemid` BIGINT NULL COMMENT 'This identifies the graded item within the grabable area',
    `rawgrade` DECIMAL(10,5) NULL COMMENT 'The raw normalized grade 0.00000 - 100.00000 as a result of the most recent assessment',
    `status` BIGINT NOT NULL DEFAULT 0 COMMENT 'The status of the assessment. By default the instance is under-assessment state',
    `feedback` LONGTEXT NULL COMMENT 'Overall feedback from the rater for the author of the graded item',
    `feedbackformat` TINYINT NULL COMMENT 'The format of the feedback field',
    `timemodified` BIGINT NOT NULL COMMENT 'The timestamp of when the assessment was most recently modified',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_grading_instances_fk_definitionid_fk` FOREIGN KEY (`definitionid`) REFERENCES `mdl_grading_definitions` (`id`),
    CONSTRAINT `mdl_grading_instances_fk_raterid_fk` FOREIGN KEY (`raterid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Grading form instance is an assessment record for one gradable item assessed by one rater';

CREATE TABLE `mdl_gradingform_guide_comments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `definitionid` BIGINT NOT NULL COMMENT 'The ID of the form definition this faq is part of',
    `sortorder` BIGINT NOT NULL COMMENT 'Defines the order of the comments',
    `description` LONGTEXT NULL COMMENT 'The comment description',
    `descriptionformat` TINYINT NULL COMMENT 'The format of the description field',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_gradingform_guide_comments_fk_definitionid_fk` FOREIGN KEY (`definitionid`) REFERENCES `mdl_grading_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='frequently used comments used in marking guide';

CREATE TABLE `mdl_gradingform_guide_criteria` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `definitionid` BIGINT NOT NULL COMMENT 'The ID of the form definition this criterion is part of',
    `sortorder` BIGINT NOT NULL COMMENT 'Defines the order of the criterion in the guide',
    `shortname` VARCHAR(255) NOT NULL COMMENT 'shortname of this criterion',
    `description` LONGTEXT NULL COMMENT 'The criterion description for students',
    `descriptionformat` TINYINT NULL COMMENT 'The format of the description field',
    `descriptionmarkers` LONGTEXT NULL COMMENT 'Description for Markers',
    `descriptionmarkersformat` TINYINT NULL,
    `maxscore` DECIMAL(10,5) NOT NULL COMMENT 'maximum grade that can be assigned using this criterion',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_gradingform_guide_criteria_fk_definitionid_fk` FOREIGN KEY (`definitionid`) REFERENCES `mdl_grading_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the rows of the criteria grid.';

CREATE TABLE `mdl_gradingform_guide_fillings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `instanceid` BIGINT NOT NULL COMMENT 'The ID of the grading form instance',
    `criterionid` BIGINT NOT NULL COMMENT 'The ID of the criterion (row) in the guide',
    `remark` LONGTEXT NULL COMMENT 'Side note feedback regarding this particular criterion',
    `remarkformat` TINYINT NULL COMMENT 'The format of the remark field',
    `score` DECIMAL(10,5) NOT NULL COMMENT 'The score assigned',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_instance_criterion` (`instanceid`, `criterionid`),
    CONSTRAINT `mdl_gradingform_guide_fillings_fk_instanceid_fk` FOREIGN KEY (`instanceid`) REFERENCES `mdl_grading_instances` (`id`),
    CONSTRAINT `mdl_gradingform_guide_fillings_fk_criterionid_fk` FOREIGN KEY (`criterionid`) REFERENCES `mdl_gradingform_guide_criteria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the data of how the guide is filled by a particular rater';

CREATE TABLE `mdl_gradingform_rubric_criteria` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `definitionid` BIGINT NOT NULL COMMENT 'The ID of the form definition this criterion is part of',
    `sortorder` BIGINT NOT NULL COMMENT 'Defines the order of the criterion in the rubric',
    `description` LONGTEXT NULL COMMENT 'The criterion description',
    `descriptionformat` TINYINT NULL COMMENT 'The format of the description field',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_gradingform_rubric_criteria_fk_definitionid_fk` FOREIGN KEY (`definitionid`) REFERENCES `mdl_grading_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the rows of the rubric grid.';

CREATE TABLE `mdl_gradingform_rubric_fillings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `instanceid` BIGINT NOT NULL COMMENT 'The ID of the grading form instance',
    `criterionid` BIGINT NOT NULL COMMENT 'The ID of the criterion (row) in the rubric',
    `levelid` BIGINT NULL COMMENT 'If a particular level was selected during the assessment, its ID is stored here',
    `remark` LONGTEXT NULL COMMENT 'Side note feedback regarding this particular criterion',
    `remarkformat` TINYINT NULL COMMENT 'The format of the remark field',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_instance_criterion` (`instanceid`, `criterionid`),
    KEY `ix_levelid` (`levelid`),
    CONSTRAINT `mdl_gradingform_rubric_fillings_fk_instanceid_fk` FOREIGN KEY (`instanceid`) REFERENCES `mdl_grading_instances` (`id`),
    CONSTRAINT `mdl_gradingform_rubric_fillings_fk_criterionid_fk` FOREIGN KEY (`criterionid`) REFERENCES `mdl_gradingform_rubric_criteria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the data of how the rubric is filled by a particular rater';

CREATE TABLE `mdl_gradingform_rubric_levels` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `criterionid` BIGINT NOT NULL COMMENT 'The rubric criterion we are level of',
    `score` DECIMAL(10,5) NOT NULL COMMENT 'The score for this level',
    `definition` LONGTEXT NULL COMMENT 'The optional text describing the level',
    `definitionformat` BIGINT NULL COMMENT 'The format of the definition field',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_gradingform_rubric_levels_fk_criterionid_fk` FOREIGN KEY (`criterionid`) REFERENCES `mdl_gradingform_rubric_criteria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the columns of the rubric grid.';

CREATE TABLE `mdl_groupings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL COMMENT 'Short human readable unique name for group.',
    `idnumber` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    `configdata` LONGTEXT NULL COMMENT 'extra configuration data - may be used by group IU tools',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `idnumber` (`idnumber`),
    CONSTRAINT `mdl_groupings_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A grouping is a collection of groups. WAS: groups_groupings';

CREATE TABLE `mdl_groupings_groups` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `groupingid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `timeadded` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_groupings_groups_groupingid_fk` FOREIGN KEY (`groupingid`) REFERENCES `mdl_groupings` (`id`),
    CONSTRAINT `mdl_groupings_groups_groupid_fk` FOREIGN KEY (`groupid`) REFERENCES `mdl_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a grouping to a group (note, groups can be in multiple groupings ONLY in a course). WAS: groups_groupings_groups';

CREATE TABLE `mdl_groups` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `idnumber` VARCHAR(100) NOT NULL,
    `name` VARCHAR(254) NOT NULL COMMENT 'Short human readable unique name for the group.',
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    `enrolmentkey` VARCHAR(50) NULL,
    `picture` BIGINT NOT NULL DEFAULT 0,
    `visibility` TINYINT NOT NULL DEFAULT 0 COMMENT 'Visibility of group membership',
    `participation` TINYINT NOT NULL DEFAULT 1 COMMENT 'Can this group be selected when participating in activities?',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `idnumber` (`idnumber`),
    CONSTRAINT `mdl_groups_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record represents a group.';

CREATE TABLE `mdl_groups_members` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `timeadded` BIGINT NOT NULL DEFAULT 0,
    `component` VARCHAR(100) NOT NULL COMMENT 'Defines the Moodle component which added this group membership (e.g. ''auth_myplugin''), or blank if it was added manually. (Entries which are created by a Moodle component cannot be removed in the normal user interface.)',
    `itemid` BIGINT NOT NULL DEFAULT 0 COMMENT 'If the ''component'' field is set, this can be used to define the instance of the component that created the entry. Otherwise should be left as default (0).',
    PRIMARY KEY (`id`),
    UNIQUE KEY `useridgroupid` (`userid`, `groupid`),
    CONSTRAINT `mdl_groups_members_groupid_fk` FOREIGN KEY (`groupid`) REFERENCES `mdl_groups` (`id`),
    CONSTRAINT `mdl_groups_members_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a user to a group.';

CREATE TABLE `mdl_h5p` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `jsoncontent` LONGTEXT NOT NULL COMMENT 'The content in json format',
    `mainlibraryid` BIGINT NOT NULL COMMENT 'The library we first instanciate for this node',
    `displayoptions` SMALLINT NULL COMMENT 'H5P Button display options',
    `pathnamehash` VARCHAR(40) NOT NULL COMMENT 'Defines the complete unique hash for the file path where the H5P content was added.',
    `contenthash` VARCHAR(40) NOT NULL COMMENT 'Defines the hash for the file content.',
    `filtered` LONGTEXT NULL COMMENT 'Filtered version of json_content',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `pathnamehash_idx` (`pathnamehash`),
    CONSTRAINT `mdl_h5p_mainlibraryid_fk` FOREIGN KEY (`mainlibraryid`) REFERENCES `mdl_h5p_libraries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores H5P content information';

CREATE TABLE `mdl_h5p_contents_libraries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `h5pid` BIGINT NOT NULL COMMENT 'Identifier for the h5p content',
    `libraryid` BIGINT NOT NULL COMMENT 'The identifier of a H5P library this content uses',
    `dependencytype` VARCHAR(10) NOT NULL COMMENT 'dynamic, preloaded or editor',
    `dropcss` TINYINT NOT NULL COMMENT '1 if the preloaded css from the dependency is to be excluded',
    `weight` BIGINT NOT NULL COMMENT 'Determines the order in which the preloaded libraries will be loaded',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_h5p_contents_libraries_h5pid_fk` FOREIGN KEY (`h5pid`) REFERENCES `mdl_h5p` (`id`),
    CONSTRAINT `mdl_h5p_contents_libraries_libraryid_fk` FOREIGN KEY (`libraryid`) REFERENCES `mdl_h5p_libraries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store which library is used in which content.';

CREATE TABLE `mdl_h5p_libraries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: The id of the library',
    `machinename` VARCHAR(255) NOT NULL COMMENT 'The library machine name',
    `title` VARCHAR(255) NOT NULL COMMENT 'The human readable name of this library',
    `majorversion` SMALLINT NOT NULL,
    `minorversion` SMALLINT NOT NULL,
    `patchversion` SMALLINT NOT NULL,
    `runnable` TINYINT NOT NULL COMMENT 'Can this library be started by the module? i.e. not a dependency.',
    `fullscreen` TINYINT NOT NULL DEFAULT 0 COMMENT 'Display fullscreen button',
    `embedtypes` VARCHAR(255) NOT NULL COMMENT 'List of supported embed types',
    `preloadedjs` LONGTEXT NULL COMMENT 'Comma separated list of scripts to load.',
    `preloadedcss` LONGTEXT NULL COMMENT 'Comma separated list of stylesheets to load.',
    `droplibrarycss` LONGTEXT NULL COMMENT 'List of libraries that should not have CSS included if this library is used. Comma separated list.',
    `semantics` LONGTEXT NULL COMMENT 'The semantics definition in json format',
    `addto` LONGTEXT NULL COMMENT 'Plugin configuration data',
    `coremajor` SMALLINT NULL COMMENT 'H5P core API major version required',
    `coreminor` SMALLINT NULL COMMENT 'H5P core API minor version required',
    `metadatasettings` LONGTEXT NULL COMMENT 'Library metadata settings',
    `tutorial` LONGTEXT NULL COMMENT 'Tutorial URL',
    `example` LONGTEXT NULL COMMENT 'Example URL',
    `enabled` TINYINT NULL DEFAULT 1 COMMENT 'Defines if this library is enabled (1) or not (0)',
    PRIMARY KEY (`id`),
    KEY `machinemajorminorpatch` (`machinename`, `majorversion`, `minorversion`, `patchversion`, `runnable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores information about libraries used by H5P content.';

CREATE TABLE `mdl_h5p_libraries_cachedassets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `libraryid` BIGINT NOT NULL,
    `hash` VARCHAR(255) NOT NULL COMMENT 'Cache hash key that this library is part of.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_h5p_libraries_cachedassets_libraryid_fk` FOREIGN KEY (`libraryid`) REFERENCES `mdl_h5p_libraries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='H5P cached library assets';

CREATE TABLE `mdl_h5p_library_dependencies` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `libraryid` BIGINT NOT NULL COMMENT 'The id of a H5P library.',
    `requiredlibraryid` BIGINT NOT NULL COMMENT 'The dependent library to load',
    `dependencytype` VARCHAR(255) NOT NULL COMMENT 'preloaded, dynamic, or editor',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_h5p_library_dependencies_libraryid_fk` FOREIGN KEY (`libraryid`) REFERENCES `mdl_h5p_libraries` (`id`),
    CONSTRAINT `mdl_h5p_library_dependencies_requiredlibraryid_fk` FOREIGN KEY (`requiredlibraryid`) REFERENCES `mdl_h5p_libraries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores H5P library dependencies';

CREATE TABLE `mdl_h5pactivity` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL COMMENT 'ID of the course this activity is part of.',
    `name` VARCHAR(255) NOT NULL COMMENT 'The name of the activity module instance',
    `timecreated` BIGINT NOT NULL COMMENT 'Timestamp of when the instance was added to the course.',
    `timemodified` BIGINT NOT NULL COMMENT 'Timestamp of when the instance was last modified.',
    `intro` LONGTEXT NULL COMMENT 'Activity description.',
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of the intro field.',
    `grade` BIGINT NULL DEFAULT 0,
    `displayoptions` SMALLINT NOT NULL DEFAULT 0 COMMENT 'H5P Button display options',
    `enabletracking` TINYINT NOT NULL DEFAULT 1 COMMENT 'Enable xAPI tracking',
    `grademethod` SMALLINT NOT NULL DEFAULT 1 COMMENT 'Which H5P attempt is used for grading',
    `reviewmode` SMALLINT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_h5pactivity_fk_course_fk` FOREIGN KEY (`course`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the h5pactivity activity module instances.';

CREATE TABLE `mdl_h5pactivity_attempts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `h5pactivityid` BIGINT NOT NULL COMMENT 'H5P activity ID',
    `userid` BIGINT NOT NULL COMMENT 'Attempt user ID',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `attempt` MEDIUMINT NOT NULL DEFAULT 1 COMMENT 'Attempt number',
    `rawscore` BIGINT NULL DEFAULT 0,
    `maxscore` BIGINT NULL DEFAULT 0,
    `scaled` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'Number 0..1 that reflects the performance of the learner',
    `duration` BIGINT NULL DEFAULT 0 COMMENT 'Number of second inverted in that attempt (provided by the statement)',
    `completion` TINYINT NULL COMMENT 'Store the xAPI tracking completion result.',
    `success` TINYINT NULL COMMENT 'Store the xAPI tracking success result.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_activityuserattempt` (`h5pactivityid`, `userid`, `attempt`),
    KEY `timecreated` (`timecreated`),
    KEY `h5pactivityid-timecreated` (`h5pactivityid`, `timecreated`),
    KEY `h5pactivityid-userid` (`h5pactivityid`, `userid`),
    CONSTRAINT `mdl_h5pactivity_attempts_fk_h5pactivityid_fk` FOREIGN KEY (`h5pactivityid`) REFERENCES `mdl_h5pactivity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Users attempts inside H5P activities';

CREATE TABLE `mdl_h5pactivity_attempts_results` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `attemptid` BIGINT NOT NULL COMMENT 'h5pactivity_attempts ID',
    `subcontent` VARCHAR(128) NULL,
    `timecreated` BIGINT NOT NULL,
    `interactiontype` VARCHAR(128) NULL,
    `description` LONGTEXT NULL,
    `correctpattern` LONGTEXT NULL COMMENT 'Correct Pattern in xAPI format',
    `response` LONGTEXT NOT NULL COMMENT 'User response data in xAPI format',
    `additionals` LONGTEXT NULL COMMENT 'Extra subcontent information in JSON format',
    `rawscore` BIGINT NOT NULL DEFAULT 0,
    `maxscore` BIGINT NOT NULL DEFAULT 0,
    `duration` BIGINT NULL DEFAULT 0 COMMENT 'Seconds inverted in this result (exctracted directly from statement)',
    `completion` TINYINT NULL COMMENT 'Store the xAPI tracking completion result.',
    `success` TINYINT NULL COMMENT 'Store the xAPI tracking success result.',
    PRIMARY KEY (`id`),
    KEY `attemptid-timecreated` (`attemptid`, `timecreated`),
    CONSTRAINT `mdl_h5pactivity_attempts_results_fk_attemptid_fk` FOREIGN KEY (`attemptid`) REFERENCES `mdl_h5pactivity_attempts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='H5Pactivities_attempts tracking info';

CREATE TABLE `mdl_imscp` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `revision` BIGINT NOT NULL DEFAULT 0 COMMENT 'incremented when after each file changes, solves browser caching issues',
    `keepold` BIGINT NOT NULL DEFAULT -1 COMMENT 'incremented when after each file changes, solves browser caching issues',
    `structure` LONGTEXT NULL,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='each record is one imscp resource';

CREATE TABLE `mdl_infected_files` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `filename` LONGTEXT NOT NULL COMMENT 'Original file name',
    `quarantinedfile` LONGTEXT NULL COMMENT 'Quarantine zip file',
    `userid` BIGINT NOT NULL COMMENT 'The user that uploaded the infected file.',
    `reason` LONGTEXT NOT NULL COMMENT 'The reason for the antivirus failure',
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time the infected file was uploaded.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_infected_files_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store infected file details.';

CREATE TABLE `mdl_label` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines labels';

CREATE TABLE `mdl_lesson` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `practice` SMALLINT NOT NULL DEFAULT 0,
    `modattempts` SMALLINT NOT NULL DEFAULT 0,
    `usepassword` SMALLINT NOT NULL DEFAULT 0,
    `password` VARCHAR(32) NOT NULL,
    `dependency` BIGINT NOT NULL DEFAULT 0,
    `conditions` LONGTEXT NOT NULL,
    `grade` BIGINT NOT NULL DEFAULT 0,
    `custom` SMALLINT NOT NULL DEFAULT 0,
    `ongoing` SMALLINT NOT NULL DEFAULT 0,
    `usemaxgrade` SMALLINT NOT NULL DEFAULT 0,
    `maxanswers` SMALLINT NOT NULL DEFAULT 4,
    `maxattempts` SMALLINT NOT NULL DEFAULT 5,
    `review` SMALLINT NOT NULL DEFAULT 0,
    `nextpagedefault` SMALLINT NOT NULL DEFAULT 0,
    `feedback` SMALLINT NOT NULL DEFAULT 1,
    `minquestions` SMALLINT NOT NULL DEFAULT 0,
    `maxpages` SMALLINT NOT NULL DEFAULT 0,
    `timelimit` BIGINT NOT NULL DEFAULT 0,
    `retake` SMALLINT NOT NULL DEFAULT 1,
    `activitylink` BIGINT NOT NULL DEFAULT 0,
    `mediafile` VARCHAR(255) NOT NULL COMMENT 'Local file path or full external URL',
    `mediaheight` BIGINT NOT NULL DEFAULT 100,
    `mediawidth` BIGINT NOT NULL DEFAULT 650,
    `mediaclose` SMALLINT NOT NULL DEFAULT 0,
    `slideshow` SMALLINT NOT NULL DEFAULT 0,
    `width` BIGINT NOT NULL DEFAULT 640,
    `height` BIGINT NOT NULL DEFAULT 480,
    `bgcolor` VARCHAR(7) NOT NULL DEFAULT '#FFFFFF',
    `displayleft` SMALLINT NOT NULL DEFAULT 0,
    `displayleftif` SMALLINT NOT NULL DEFAULT 0,
    `progressbar` SMALLINT NOT NULL DEFAULT 0,
    `available` BIGINT NOT NULL DEFAULT 0,
    `deadline` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `completionendreached` TINYINT NULL DEFAULT 0,
    `completiontimespent` BIGINT NULL DEFAULT 0,
    `allowofflineattempts` TINYINT NULL DEFAULT 0 COMMENT 'Whether to allow the lesson to be attempted offline in the mobile app',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson';

CREATE TABLE `mdl_lesson_answers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lessonid` BIGINT NOT NULL DEFAULT 0,
    `pageid` BIGINT NOT NULL DEFAULT 0,
    `jumpto` BIGINT NOT NULL DEFAULT 0,
    `grade` SMALLINT NOT NULL DEFAULT 0,
    `score` BIGINT NOT NULL DEFAULT 0,
    `flags` SMALLINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `answer` LONGTEXT NULL,
    `answerformat` TINYINT NOT NULL DEFAULT 0,
    `response` LONGTEXT NULL,
    `responseformat` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_lesson_answers_lessonid_fk` FOREIGN KEY (`lessonid`) REFERENCES `mdl_lesson` (`id`),
    CONSTRAINT `mdl_lesson_answers_pageid_fk` FOREIGN KEY (`pageid`) REFERENCES `mdl_lesson_pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_answers';

CREATE TABLE `mdl_lesson_attempts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lessonid` BIGINT NOT NULL DEFAULT 0,
    `pageid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `answerid` BIGINT NOT NULL DEFAULT 0,
    `retry` SMALLINT NOT NULL DEFAULT 0,
    `correct` BIGINT NOT NULL DEFAULT 0,
    `useranswer` LONGTEXT NULL,
    `timeseen` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_lesson_attempts_lessonid_fk` FOREIGN KEY (`lessonid`) REFERENCES `mdl_lesson` (`id`),
    CONSTRAINT `mdl_lesson_attempts_pageid_fk` FOREIGN KEY (`pageid`) REFERENCES `mdl_lesson_pages` (`id`),
    CONSTRAINT `mdl_lesson_attempts_answerid_fk` FOREIGN KEY (`answerid`) REFERENCES `mdl_lesson_answers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_attempts';

CREATE TABLE `mdl_lesson_branch` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lessonid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `pageid` BIGINT NOT NULL DEFAULT 0,
    `retry` BIGINT NOT NULL DEFAULT 0,
    `flag` SMALLINT NOT NULL DEFAULT 0,
    `timeseen` BIGINT NOT NULL DEFAULT 0,
    `nextpageid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_lesson_branch_lessonid_fk` FOREIGN KEY (`lessonid`) REFERENCES `mdl_lesson` (`id`),
    CONSTRAINT `mdl_lesson_branch_pageid_fk` FOREIGN KEY (`pageid`) REFERENCES `mdl_lesson_pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='branches for each lesson/user';

CREATE TABLE `mdl_lesson_grades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lessonid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `grade` DOUBLE NOT NULL DEFAULT 0,
    `late` SMALLINT NOT NULL DEFAULT 0,
    `completed` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_lesson_grades_lessonid_fk` FOREIGN KEY (`lessonid`) REFERENCES `mdl_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_grades';

CREATE TABLE `mdl_lesson_overrides` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lessonid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references lesson.id',
    `groupid` BIGINT NULL COMMENT 'Foreign key references groups.id.  Can be null if this is a per-user override.',
    `userid` BIGINT NULL COMMENT 'Foreign key references user.id.  Can be null if this is a per-group override.',
    `available` BIGINT NULL COMMENT 'Time at which students may start attempting this lesson. Can be null, in which case the lesson default is used.',
    `deadline` BIGINT NULL COMMENT 'Time by which students must have completed their attempt.  Can be null, in which case the lesson default is used.',
    `timelimit` BIGINT NULL COMMENT 'Time limit in seconds.  Can be null, in which case the lesson default is used.',
    `review` SMALLINT NULL,
    `maxattempts` SMALLINT NULL,
    `retake` SMALLINT NULL,
    `password` VARCHAR(32) NULL COMMENT 'Lesson password.  Can be null, in which case the lesson default is used.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_lesson_overrides_lessonid_fk` FOREIGN KEY (`lessonid`) REFERENCES `mdl_lesson` (`id`),
    CONSTRAINT `mdl_lesson_overrides_groupid_fk` FOREIGN KEY (`groupid`) REFERENCES `mdl_groups` (`id`),
    CONSTRAINT `mdl_lesson_overrides_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The overrides to lesson settings.';

CREATE TABLE `mdl_lesson_pages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lessonid` BIGINT NOT NULL DEFAULT 0,
    `prevpageid` BIGINT NOT NULL DEFAULT 0,
    `nextpageid` BIGINT NOT NULL DEFAULT 0,
    `qtype` SMALLINT NOT NULL DEFAULT 0,
    `qoption` SMALLINT NOT NULL DEFAULT 0,
    `layout` SMALLINT NOT NULL DEFAULT 1,
    `display` SMALLINT NOT NULL DEFAULT 1,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `title` VARCHAR(255) NOT NULL,
    `contents` LONGTEXT NOT NULL,
    `contentsformat` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_lesson_pages_lessonid_fk` FOREIGN KEY (`lessonid`) REFERENCES `mdl_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_pages';

CREATE TABLE `mdl_lesson_timer` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lessonid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `starttime` BIGINT NOT NULL DEFAULT 0,
    `lessontime` BIGINT NOT NULL DEFAULT 0,
    `completed` TINYINT NULL DEFAULT 0,
    `timemodifiedoffline` BIGINT NOT NULL DEFAULT 0 COMMENT 'Last modified time via web services (mobile app).',
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_lesson_timer_lessonid_fk` FOREIGN KEY (`lessonid`) REFERENCES `mdl_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='lesson timer for each lesson';

CREATE TABLE `mdl_license` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `shortname` VARCHAR(255) NULL,
    `fullname` LONGTEXT NULL,
    `source` VARCHAR(255) NULL,
    `enabled` TINYINT NOT NULL DEFAULT 1,
    `version` BIGINT NOT NULL DEFAULT 0,
    `custom` TINYINT NOT NULL DEFAULT 0 COMMENT 'If this flag is set, license is custom and can be updated or deleted, otherwise license is a core license and cannot be edited.',
    `sortorder` MEDIUMINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='store licenses used by moodle';

CREATE TABLE `mdl_lock_db` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `resourcekey` VARCHAR(255) NOT NULL COMMENT 'String identifying the resource to be locked. Should use frankenstyle format.',
    `expires` BIGINT NULL COMMENT 'Expiry time for an active lock.',
    `owner` VARCHAR(36) NULL COMMENT 'uuid indicating the owner of the lock.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `resourcekey_uniq` (`resourcekey`),
    KEY `expires_idx` (`expires`),
    KEY `owner_idx` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores active and inactive lock types for db locking method.';

CREATE TABLE `mdl_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `time` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `ip` VARCHAR(45) NOT NULL,
    `course` BIGINT NOT NULL DEFAULT 0,
    `module` VARCHAR(20) NOT NULL,
    `cmid` BIGINT NOT NULL DEFAULT 0,
    `action` VARCHAR(40) NOT NULL,
    `url` VARCHAR(100) NOT NULL,
    `info` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `course-module-action` (`course`, `module`, `action`),
    KEY `time` (`time`),
    KEY `action` (`action`),
    KEY `userid-course` (`userid`, `course`),
    KEY `cmid` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Every action is logged as far as possible';

CREATE TABLE `mdl_log_display` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `module` VARCHAR(20) NOT NULL,
    `action` VARCHAR(40) NOT NULL,
    `mtable` VARCHAR(30) NOT NULL,
    `field` VARCHAR(200) NOT NULL,
    `component` VARCHAR(100) NOT NULL COMMENT 'owner of the log action',
    PRIMARY KEY (`id`),
    UNIQUE KEY `module-action` (`module`, `action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For a particular module/action, specifies a moodle table/field';

CREATE TABLE `mdl_log_queries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `qtype` MEDIUMINT NOT NULL COMMENT 'query type constant',
    `sqltext` LONGTEXT NOT NULL COMMENT 'query sql',
    `sqlparams` LONGTEXT NULL COMMENT 'query parameters',
    `error` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'is error',
    `info` LONGTEXT NULL COMMENT 'detailed info such as error text',
    `backtrace` LONGTEXT NULL COMMENT 'php execution trace',
    `exectime` DECIMAL(10,5) NOT NULL COMMENT 'query execution time in seconds as float',
    `timelogged` BIGINT NOT NULL COMMENT 'timestamp when log info stored into db',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Logged database queries.';

CREATE TABLE `mdl_logstore_standard_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `eventname` VARCHAR(255) NOT NULL,
    `component` VARCHAR(100) NOT NULL,
    `action` VARCHAR(100) NOT NULL,
    `target` VARCHAR(100) NOT NULL,
    `objecttable` VARCHAR(50) NULL,
    `objectid` BIGINT NULL,
    `crud` VARCHAR(1) NOT NULL,
    `edulevel` TINYINT NOT NULL,
    `contextid` BIGINT NOT NULL,
    `contextlevel` BIGINT NOT NULL,
    `contextinstanceid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `courseid` BIGINT NULL,
    `relateduserid` BIGINT NULL,
    `anonymous` TINYINT NOT NULL DEFAULT 0 COMMENT 'Was this event anonymous at the time of triggering?',
    `other` LONGTEXT NULL,
    `timecreated` BIGINT NOT NULL,
    `origin` VARCHAR(10) NULL COMMENT 'cli, cron, ws, etc.',
    `ip` VARCHAR(45) NULL COMMENT 'IP address',
    `realuserid` BIGINT NULL COMMENT 'real user id when logged-in-as',
    PRIMARY KEY (`id`),
    KEY `timecreated` (`timecreated`),
    KEY `course-time` (`courseid`, `anonymous`, `timecreated`),
    KEY `user-module` (`userid`, `contextlevel`, `contextinstanceid`, `crud`, `edulevel`, `timecreated`),
    CONSTRAINT `mdl_logstore_standard_log_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_logstore_standard_log_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_logstore_standard_log_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_logstore_standard_log_realuserid_fk` FOREIGN KEY (`realuserid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_logstore_standard_log_relateduserid_fk` FOREIGN KEY (`relateduserid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Standard log table';

CREATE TABLE `mdl_lti` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0 COMMENT 'Course basiclti activity belongs to',
    `name` VARCHAR(255) NOT NULL COMMENT 'name field for moodle instances',
    `intro` LONGTEXT NULL COMMENT 'General introduction of the basiclti activity',
    `introformat` SMALLINT NULL DEFAULT 0 COMMENT 'Format of the intro field (MOODLE, HTML, MARKDOWN...)',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `typeid` BIGINT NULL COMMENT 'Basic LTI type',
    `toolurl` LONGTEXT NOT NULL COMMENT 'Remote tool url',
    `securetoolurl` LONGTEXT NULL,
    `instructorchoicesendname` TINYINT NULL COMMENT 'Send user''s name',
    `instructorchoicesendemailaddr` TINYINT NULL COMMENT 'Send user''s email',
    `instructorchoiceallowroster` TINYINT NULL COMMENT 'Allow the roster to be retrieved',
    `instructorchoiceallowsetting` TINYINT NULL COMMENT 'Allow a tool to store a setting',
    `instructorcustomparameters` LONGTEXT NULL COMMENT 'Additional custom parameters provided by the instructor',
    `instructorchoiceacceptgrades` TINYINT NULL COMMENT 'Accept grades from tool',
    `grade` BIGINT NOT NULL DEFAULT 100 COMMENT 'Grade scale',
    `launchcontainer` TINYINT NOT NULL DEFAULT 1 COMMENT 'Launch external tool in a pop-up',
    `resourcekey` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `debuglaunch` TINYINT NOT NULL DEFAULT 0 COMMENT 'Enable the debug-style launch which pauses before auto-submit',
    `showtitlelaunch` TINYINT NOT NULL DEFAULT 0,
    `showdescriptionlaunch` TINYINT NOT NULL DEFAULT 0,
    `servicesalt` VARCHAR(40) NULL,
    `icon` LONGTEXT NULL,
    `secureicon` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains Basic LTI activities instances';

CREATE TABLE `mdl_lti_access_tokens` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `typeid` BIGINT NOT NULL COMMENT 'Basic LTI type id',
    `scope` LONGTEXT NOT NULL COMMENT 'Scope values as JSON array',
    `token` VARCHAR(128) NOT NULL COMMENT 'security token, aka private access key',
    `validuntil` BIGINT NOT NULL COMMENT 'timestamp - valid until data',
    `timecreated` BIGINT NOT NULL COMMENT 'created timestamp',
    `lastaccess` BIGINT NULL COMMENT 'last access timestamp',
    PRIMARY KEY (`id`),
    UNIQUE KEY `token` (`token`),
    CONSTRAINT `mdl_lti_access_tokens_typeid_fk` FOREIGN KEY (`typeid`) REFERENCES `mdl_lti_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Security tokens for accessing of LTI services';

CREATE TABLE `mdl_lti_coursevisible` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `typeid` BIGINT NOT NULL,
    `courseid` BIGINT NOT NULL COMMENT 'Course ID',
    `coursevisible` TINYINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `typeid` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store coursevisible setting for site tool on course level';

CREATE TABLE `mdl_lti_submission` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `ltiid` BIGINT NOT NULL COMMENT 'ID of the LTI tool instance',
    `userid` BIGINT NOT NULL,
    `datesubmitted` BIGINT NOT NULL,
    `dateupdated` BIGINT NOT NULL,
    `gradepercent` DECIMAL(10,5) NOT NULL,
    `originalgrade` DECIMAL(10,5) NOT NULL,
    `launchid` BIGINT NOT NULL,
    `state` TINYINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `ltiid` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of individual submissions for LTI activities.';

CREATE TABLE `mdl_lti_tool_proxies` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL DEFAULT 'Tool Provider' COMMENT 'Tool Provider name',
    `regurl` LONGTEXT NULL,
    `state` TINYINT NOT NULL DEFAULT 1 COMMENT 'Configured = 1, Pending = 2, Accepted = 3, Rejected = 4, Cancelled = 5',
    `guid` VARCHAR(255) NULL,
    `secret` VARCHAR(255) NULL,
    `vendorcode` VARCHAR(255) NULL,
    `capabilityoffered` LONGTEXT NOT NULL COMMENT 'List of capabilities offered, one per line',
    `serviceoffered` LONGTEXT NOT NULL COMMENT 'List of services offered, one per line',
    `toolproxy` LONGTEXT NULL COMMENT 'JSON string representing tool proxy returned by tool provider',
    `createdby` BIGINT NOT NULL COMMENT 'ID of user which initiated the registration process',
    `timecreated` BIGINT NOT NULL COMMENT 'Date/time at which the record was created',
    `timemodified` BIGINT NOT NULL COMMENT 'Date/time at which the record was last modified',
    PRIMARY KEY (`id`),
    UNIQUE KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='LTI tool proxy registrations';

CREATE TABLE `mdl_lti_tool_settings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `toolproxyid` BIGINT NOT NULL COMMENT 'Primary key of related tool proxy',
    `typeid` BIGINT NULL,
    `course` BIGINT NULL COMMENT 'Primary key of course (null for system-wide settings)',
    `coursemoduleid` BIGINT NULL COMMENT 'Primary key of course module - tool link added to course (null for system-wide and context-wide settings)',
    `settings` LONGTEXT NOT NULL COMMENT 'Setting values as JSON',
    `timecreated` BIGINT NOT NULL COMMENT 'Date/time at which the record was created',
    `timemodified` BIGINT NOT NULL COMMENT 'Date/time at which the record was last modified',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_lti_tool_settings_toolproxy_fk` FOREIGN KEY (`toolproxyid`) REFERENCES `mdl_lti_tool_proxies` (`id`),
    CONSTRAINT `mdl_lti_tool_settings_typeid_fk` FOREIGN KEY (`typeid`) REFERENCES `mdl_lti_types` (`id`),
    CONSTRAINT `mdl_lti_tool_settings_course_fk` FOREIGN KEY (`course`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_lti_tool_settings_coursemodule_fk` FOREIGN KEY (`coursemoduleid`) REFERENCES `mdl_lti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='LTI tool setting values';

CREATE TABLE `mdl_lti_types` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL DEFAULT 'basiclti Activity' COMMENT 'Activity name',
    `baseurl` LONGTEXT NOT NULL,
    `tooldomain` VARCHAR(255) NOT NULL,
    `state` TINYINT NOT NULL DEFAULT 2 COMMENT 'Active = 1, Pending = 2, Rejected = 3',
    `course` BIGINT NOT NULL,
    `coursevisible` TINYINT NOT NULL DEFAULT 0,
    `ltiversion` VARCHAR(10) NOT NULL,
    `clientid` VARCHAR(255) NULL,
    `toolproxyid` BIGINT NULL COMMENT 'Primary key of related tool proxy (null for LTI 1 tools)',
    `enabledcapability` LONGTEXT NULL COMMENT 'Enabled capabilities, one per line (null for LTI 1 tools)',
    `parameter` LONGTEXT NULL COMMENT 'Launch parameters, one per line (null for LTI 1 tools)',
    `icon` LONGTEXT NULL COMMENT 'URL to icon file',
    `secureicon` LONGTEXT NULL COMMENT 'Secure URL to icon file',
    `createdby` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `description` LONGTEXT NULL COMMENT 'A description of what this LTI module is.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `clientid` (`clientid`),
    KEY `course` (`course`),
    KEY `tooldomain` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Basic LTI pre-configured activities';

CREATE TABLE `mdl_lti_types_categories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `typeid` BIGINT NOT NULL,
    `categoryid` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_lti_types_categories_typeid_fk` FOREIGN KEY (`typeid`) REFERENCES `mdl_lti_types` (`id`),
    CONSTRAINT `mdl_lti_types_categories_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_course_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link LTI types to course categories';

CREATE TABLE `mdl_lti_types_config` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `typeid` BIGINT NOT NULL COMMENT 'Basic LTI type id',
    `name` VARCHAR(100) NOT NULL COMMENT 'Basic LTI param',
    `value` LONGTEXT NOT NULL COMMENT 'Param value',
    PRIMARY KEY (`id`),
    KEY `typeid` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Basic LTI types configuration';

CREATE TABLE `mdl_ltiservice_gradebookservices` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `gradeitemid` BIGINT NOT NULL COMMENT 'ID of the gradeItem related.',
    `courseid` BIGINT NOT NULL COMMENT 'ID of the course related.',
    `toolproxyid` BIGINT NULL COMMENT 'ID of the Tool Proxy instance.',
    `typeid` BIGINT NULL COMMENT 'ID of the LTI Type if not Proxy.',
    `baseurl` LONGTEXT NULL COMMENT 'Lineitem URL that will be returned to the Tool provider',
    `ltilinkid` BIGINT NULL COMMENT 'ID of the LTI element related with this lineitem.',
    `resourceid` VARCHAR(512) NULL COMMENT 'Resource id for the line item',
    `tag` VARCHAR(255) NULL COMMENT 'Tag type specified for the line item',
    `subreviewurl` LONGTEXT NULL COMMENT 'Submission review URL',
    `subreviewparams` LONGTEXT NULL COMMENT 'Submission review custom params',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_ltiservice_gradebookservices_ltilinkid_fk` FOREIGN KEY (`ltilinkid`) REFERENCES `mdl_lti` (`id`),
    CONSTRAINT `mdl_ltiservice_gradebookservices_itemnumbercourse_fk` FOREIGN KEY (`gradeitemid`, `courseid`) REFERENCES `mdl_grade_items` (`id`, `courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This file records the grade items created by the LTI Gradebook Services service';

CREATE TABLE `mdl_matrix_room` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `commid` BIGINT NOT NULL COMMENT 'ID of the communication record',
    `roomid` VARCHAR(255) NULL COMMENT 'ID of the matrix room instance',
    `topic` VARCHAR(255) NULL COMMENT 'Topic of the matrix room instance.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_matrix_room_fk_commid_fk` FOREIGN KEY (`commid`) REFERENCES `mdl_communication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the matrix room information associated with the communication instance.';

CREATE TABLE `mdl_message` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `useridfrom` BIGINT NOT NULL DEFAULT 0,
    `useridto` BIGINT NOT NULL DEFAULT 0,
    `subject` LONGTEXT NULL COMMENT 'The message subject',
    `fullmessage` LONGTEXT NULL,
    `fullmessageformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of the full message',
    `fullmessagehtml` LONGTEXT NULL COMMENT 'html format of message',
    `smallmessage` LONGTEXT NULL COMMENT 'Smal version of message (eg sms)',
    `notification` TINYINT NULL DEFAULT 0,
    `contexturl` LONGTEXT NULL COMMENT 'If this message is a notification of an event contexturl should contain a link to view this event. For example if its a notification of a forum post contexturl should contain a link to the forum post.',
    `contexturlname` LONGTEXT NULL COMMENT 'Display text for the contexturl',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timeuserfromdeleted` BIGINT NOT NULL DEFAULT 0,
    `timeusertodeleted` BIGINT NOT NULL DEFAULT 0,
    `component` VARCHAR(100) NULL,
    `eventtype` VARCHAR(100) NULL,
    `customdata` LONGTEXT NULL COMMENT 'Custom data to be passed to the message processor. Must be serialisable using json_encode()',
    PRIMARY KEY (`id`),
    KEY `useridfromtodeleted` (`useridfrom`, `useridto`, `timeuserfromdeleted`, `timeusertodeleted`),
    KEY `useridfrom_timeuserfromdeleted_notification` (`useridfrom`, `timeuserfromdeleted`, `notification`),
    KEY `useridto_timeusertodeleted_notification` (`useridto`, `timeusertodeleted`, `notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all unread messages';

CREATE TABLE `mdl_message_airnotifier_devices` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userdeviceid` BIGINT NOT NULL COMMENT 'The user device id in the user_devices table',
    `enable` TINYINT NOT NULL DEFAULT 1 COMMENT 'The user can enable/disable his devices',
    PRIMARY KEY (`id`),
    KEY `userdeviceid` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store information about the devices registered in Airnotifier for PUSH notifications';

CREATE TABLE `mdl_message_contact_requests` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `requesteduserid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-requesteduserid` (`userid`, `requesteduserid`),
    CONSTRAINT `mdl_message_contact_requests_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_message_contact_requests_requesteduserid_fk` FOREIGN KEY (`requesteduserid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintains list of contact requests between users';

CREATE TABLE `mdl_message_contacts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `contactid` BIGINT NOT NULL,
    `timecreated` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-contactid` (`userid`, `contactid`),
    CONSTRAINT `mdl_message_contacts_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_message_contacts_contactid_fk` FOREIGN KEY (`contactid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintains lists of contacts between users';

CREATE TABLE `mdl_message_conversation_actions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `conversationid` BIGINT NOT NULL,
    `action` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_message_conversation_actions_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_message_conversation_actions_conversationid_fk` FOREIGN KEY (`conversationid`) REFERENCES `mdl_message_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all per-user actions on individual conversations';

CREATE TABLE `mdl_message_conversation_members` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `conversationid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_message_conversation_members_conversationid_fk` FOREIGN KEY (`conversationid`) REFERENCES `mdl_message_conversations` (`id`),
    CONSTRAINT `mdl_message_conversation_members_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all members in a conversations';

CREATE TABLE `mdl_message_conversations` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` BIGINT NOT NULL DEFAULT 1,
    `name` VARCHAR(255) NULL,
    `convhash` VARCHAR(40) NULL,
    `component` VARCHAR(100) NULL COMMENT 'Defines the Moodle component which the area was added to',
    `itemtype` VARCHAR(100) NULL,
    `itemid` BIGINT NULL,
    `contextid` BIGINT NULL COMMENT 'The context id of the itemid or course of the itemtype was added',
    `enabled` TINYINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `type` (`type`),
    KEY `convhash` (`convhash`),
    KEY `component-itemtype-itemid-contextid` (`component`, `itemtype`, `itemid`, `contextid`),
    CONSTRAINT `mdl_message_conversations_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all message conversations';

CREATE TABLE `mdl_message_email_messages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `useridto` BIGINT NOT NULL,
    `conversationid` BIGINT NOT NULL,
    `messageid` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_message_email_messages_useridto_fk` FOREIGN KEY (`useridto`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_message_email_messages_conversationid_fk` FOREIGN KEY (`conversationid`) REFERENCES `mdl_message_conversations` (`id`),
    CONSTRAINT `mdl_message_email_messages_messageid_fk` FOREIGN KEY (`messageid`) REFERENCES `mdl_messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of what emails to send in an email digest';

CREATE TABLE `mdl_message_popup` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `messageid` BIGINT NOT NULL,
    `isread` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `messageid-isread` (`messageid`, `isread`),
    KEY `isread` (`isread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keep state of notifications for the popup message processor';

CREATE TABLE `mdl_message_popup_notifications` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `notificationid` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_message_popup_notifications_notificationid_fk` FOREIGN KEY (`notificationid`) REFERENCES `mdl_notifications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of notifications to display in the message output popup';

CREATE TABLE `mdl_message_processors` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(166) NOT NULL COMMENT 'Name of the message processor',
    `enabled` TINYINT NOT NULL DEFAULT 1 COMMENT 'Defines if processor is enabled',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of message output plugins';

CREATE TABLE `mdl_message_providers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id of the table, please edit me',
    `name` VARCHAR(100) NOT NULL COMMENT 'The full name of the message provider in standard form',
    `component` VARCHAR(200) NOT NULL COMMENT 'The name of the component that produces these messages',
    `capability` VARCHAR(255) NULL COMMENT 'Optional: permission that is required on the user''s setting screen to see this message provider.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `componentname` (`component`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores the message providers (modules and core systems)';

CREATE TABLE `mdl_message_read` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `useridfrom` BIGINT NOT NULL DEFAULT 0,
    `useridto` BIGINT NOT NULL DEFAULT 0,
    `subject` LONGTEXT NULL COMMENT 'The message subject',
    `fullmessage` LONGTEXT NULL,
    `fullmessageformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of the full message',
    `fullmessagehtml` LONGTEXT NULL COMMENT 'html format of message',
    `smallmessage` LONGTEXT NULL COMMENT 'Smal version of message (eg sms)',
    `notification` TINYINT NULL DEFAULT 0,
    `contexturl` LONGTEXT NULL COMMENT 'If this message is a notification of an event contexturl should contain a link to view this event. For example if its a notification of a forum post contexturl should contain a link to the forum post.',
    `contexturlname` LONGTEXT NULL COMMENT 'Display text for the contexturl',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timeread` BIGINT NOT NULL DEFAULT 0,
    `timeuserfromdeleted` BIGINT NOT NULL DEFAULT 0,
    `timeusertodeleted` BIGINT NOT NULL DEFAULT 0,
    `component` VARCHAR(100) NULL,
    `eventtype` VARCHAR(100) NULL,
    PRIMARY KEY (`id`),
    KEY `useridfromtodeleted` (`useridfrom`, `useridto`, `timeuserfromdeleted`, `timeusertodeleted`),
    KEY `notificationtimeread` (`notification`, `timeread`),
    KEY `useridfrom_timeuserfromdeleted_notification` (`useridfrom`, `timeuserfromdeleted`, `notification`),
    KEY `useridto_timeusertodeleted_notification` (`useridto`, `timeusertodeleted`, `notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all messages that have been read';

CREATE TABLE `mdl_message_user_actions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `messageid` BIGINT NOT NULL,
    `action` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid_messageid_action` (`userid`, `messageid`, `action`),
    CONSTRAINT `mdl_message_user_actions_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_message_user_actions_messageid_fk` FOREIGN KEY (`messageid`) REFERENCES `mdl_messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all per-user actions on individual messages';

CREATE TABLE `mdl_message_users_blocked` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `blockeduserid` BIGINT NOT NULL,
    `timecreated` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-blockeduserid` (`userid`, `blockeduserid`),
    CONSTRAINT `mdl_message_users_blocked_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_message_users_blocked_blockeduserid_fk` FOREIGN KEY (`blockeduserid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintains lists of blocked users';

CREATE TABLE `mdl_messageinbound_datakeys` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `handler` BIGINT NOT NULL COMMENT 'The handler that this key belongs to.',
    `datavalue` BIGINT NOT NULL COMMENT 'The integer value of the data item that this key belongs to.',
    `datakey` VARCHAR(64) NULL COMMENT 'The secret key for this data item.',
    `timecreated` BIGINT NOT NULL COMMENT 'The time that the data key was created.',
    `expires` BIGINT NULL COMMENT 'The expiry time of this key.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `handler_datavalue` (`handler`, `datavalue`),
    CONSTRAINT `mdl_messageinbound_datakeys_handler_fk` FOREIGN KEY (`handler`) REFERENCES `mdl_messageinbound_handlers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Inbound Message data item secret keys.';

CREATE TABLE `mdl_messageinbound_handlers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(100) NOT NULL COMMENT 'The component this handler belongs to.',
    `classname` VARCHAR(255) NOT NULL COMMENT 'The class defining the Inbound Message handler to be called.',
    `defaultexpiration` BIGINT NOT NULL DEFAULT 86400 COMMENT 'The default expiration period to use when creating a new key',
    `validateaddress` TINYINT NOT NULL DEFAULT 1 COMMENT 'Whether to validate the sender address against the user record.',
    `enabled` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether this handler is currently enabled.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `classname` (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Inbound Message Handler definitions.';

CREATE TABLE `mdl_messageinbound_messagelist` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `messageid` LONGTEXT NOT NULL,
    `userid` BIGINT NOT NULL,
    `address` LONGTEXT NOT NULL COMMENT 'The Inbound Message address that the message was originally sent to',
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_messageinbound_messagelist_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A list of message IDs for existing replies';

CREATE TABLE `mdl_messages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `useridfrom` BIGINT NOT NULL,
    `conversationid` BIGINT NOT NULL,
    `subject` LONGTEXT NULL,
    `fullmessage` LONGTEXT NULL,
    `fullmessageformat` TINYINT NOT NULL DEFAULT 0,
    `fullmessagehtml` LONGTEXT NULL,
    `smallmessage` LONGTEXT NULL,
    `timecreated` BIGINT NOT NULL,
    `fullmessagetrust` TINYINT NOT NULL DEFAULT 0,
    `customdata` LONGTEXT NULL COMMENT 'Custom data to be passed to the message processor. Must be serialisable using json_encode()',
    PRIMARY KEY (`id`),
    KEY `conversationid_timecreated` (`conversationid`, `timecreated`),
    CONSTRAINT `mdl_messages_useridfrom_fk` FOREIGN KEY (`useridfrom`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_messages_conversationid_fk` FOREIGN KEY (`conversationid`) REFERENCES `mdl_message_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all messages';

CREATE TABLE `mdl_mnet_application` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `display_name` VARCHAR(50) NOT NULL,
    `xmlrpc_server_url` VARCHAR(255) NOT NULL,
    `sso_land_url` VARCHAR(255) NOT NULL,
    `sso_jump_url` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about applications on remote hosts';

CREATE TABLE `mdl_mnet_host` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Unique Host ID',
    `deleted` TINYINT NOT NULL DEFAULT 0,
    `wwwroot` VARCHAR(255) NOT NULL,
    `ip_address` VARCHAR(45) NOT NULL,
    `name` VARCHAR(80) NOT NULL,
    `public_key` LONGTEXT NOT NULL,
    `public_key_expires` BIGINT NOT NULL DEFAULT 0,
    `transport` TINYINT NOT NULL DEFAULT 0,
    `portno` MEDIUMINT NOT NULL DEFAULT 0,
    `last_connect_time` BIGINT NOT NULL DEFAULT 0,
    `last_log_id` BIGINT NOT NULL DEFAULT 0,
    `force_theme` TINYINT NOT NULL DEFAULT 0,
    `theme` VARCHAR(100) NULL,
    `applicationid` BIGINT NOT NULL DEFAULT 1,
    `sslverification` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `last_log_id` (`last_log_id`),
    CONSTRAINT `mdl_mnet_host_applicationid_fk` FOREIGN KEY (`applicationid`) REFERENCES `mdl_mnet_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about the local and remote hosts for RPC';

CREATE TABLE `mdl_mnet_host2service` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `hostid` BIGINT NOT NULL DEFAULT 0,
    `serviceid` BIGINT NOT NULL DEFAULT 0,
    `publish` TINYINT NOT NULL DEFAULT 0,
    `subscribe` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `hostid_serviceid` (`hostid`, `serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about the services for a given host';

CREATE TABLE `mdl_mnet_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `hostid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Unique host ID',
    `remoteid` BIGINT NOT NULL DEFAULT 0,
    `time` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `ip` VARCHAR(45) NOT NULL,
    `course` BIGINT NOT NULL DEFAULT 0,
    `coursename` VARCHAR(40) NOT NULL,
    `module` VARCHAR(20) NOT NULL,
    `cmid` BIGINT NOT NULL DEFAULT 0,
    `action` VARCHAR(40) NOT NULL,
    `url` VARCHAR(100) NOT NULL,
    `info` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `hostid_userid_course` (`hostid`, `userid`, `course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store session data from users migrating to other sites';

CREATE TABLE `mdl_mnet_remote_rpc` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `functionname` VARCHAR(40) NOT NULL,
    `xmlrpcpath` VARCHAR(80) NOT NULL,
    `plugintype` VARCHAR(20) NOT NULL,
    `pluginname` VARCHAR(20) NOT NULL,
    `enabled` TINYINT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table describes functions that might be called remotely (we have less information about them than local functions)';

CREATE TABLE `mdl_mnet_remote_service2rpc` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Required ID field',
    `serviceid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Unique service ID',
    `rpcid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Unique Function ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `rpcid_serviceid` (`rpcid`, `serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Group functions or methods under a service';

CREATE TABLE `mdl_mnet_rpc` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Unique Function ID',
    `functionname` VARCHAR(40) NOT NULL,
    `xmlrpcpath` VARCHAR(80) NOT NULL,
    `plugintype` VARCHAR(20) NOT NULL,
    `pluginname` VARCHAR(20) NOT NULL,
    `enabled` TINYINT NOT NULL DEFAULT 0,
    `help` LONGTEXT NOT NULL,
    `profile` LONGTEXT NOT NULL COMMENT 'Method signature',
    `filename` VARCHAR(100) NOT NULL,
    `classname` VARCHAR(150) NULL,
    `static` TINYINT NULL,
    PRIMARY KEY (`id`),
    KEY `enabled_xmlrpcpath` (`enabled`, `xmlrpcpath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Functions or methods that we may publish or subscribe to';

CREATE TABLE `mdl_mnet_service` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Unique Service ID',
    `name` VARCHAR(40) NOT NULL,
    `description` VARCHAR(40) NOT NULL,
    `apiversion` VARCHAR(10) NOT NULL,
    `offer` TINYINT NOT NULL DEFAULT 0 COMMENT 'Do we even offer this service?',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A service is a group of functions';

CREATE TABLE `mdl_mnet_service2rpc` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Required ID field',
    `serviceid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Unique service ID',
    `rpcid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Unique Function ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `rpcid_serviceid` (`rpcid`, `serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Group functions or methods under a service';

CREATE TABLE `mdl_mnet_session` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Required ID field',
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Unique user ID',
    `username` VARCHAR(100) NOT NULL COMMENT 'Unique username',
    `token` VARCHAR(40) NOT NULL COMMENT 'Unique SHA1 Token',
    `mnethostid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Unique remote host ID',
    `useragent` VARCHAR(40) NOT NULL COMMENT 'SHA1 hash of User Agent',
    `confirm_timeout` BIGINT NOT NULL DEFAULT 0 COMMENT 'UNIX timestamp for expiry of session',
    `session_id` VARCHAR(40) NOT NULL COMMENT 'The PHP Session ID',
    `expires` BIGINT NOT NULL DEFAULT 0 COMMENT 'Expire time of session on peer',
    PRIMARY KEY (`id`),
    UNIQUE KEY `token` (`token`),
    CONSTRAINT `mdl_mnet_session_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_mnet_session_mnethostid_fk` FOREIGN KEY (`mnethostid`) REFERENCES `mdl_mnet_host` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store session data from users migrating to other sites';

CREATE TABLE `mdl_mnet_sso_access_control` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Required ID field',
    `username` VARCHAR(100) NOT NULL COMMENT 'Username',
    `mnet_host_id` BIGINT NOT NULL DEFAULT 0 COMMENT 'id of mnet host',
    `accessctrl` VARCHAR(20) NOT NULL DEFAULT 'allow' COMMENT 'Whether or not this user/host can login',
    PRIMARY KEY (`id`),
    UNIQUE KEY `mnethostid_username` (`mnet_host_id`, `username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Users by host permitted (or not) to login from a remote provider';

CREATE TABLE `mdl_mnetservice_enrol_courses` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Unique remote-course ID',
    `hostid` BIGINT NOT NULL COMMENT 'The id of the remote MNet host',
    `remoteid` BIGINT NOT NULL COMMENT 'ID of course on its home server',
    `categoryid` BIGINT NOT NULL COMMENT 'The id of the category on the remote server',
    `categoryname` VARCHAR(255) NOT NULL,
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    `fullname` VARCHAR(254) NOT NULL,
    `shortname` VARCHAR(100) NOT NULL,
    `idnumber` VARCHAR(100) NOT NULL,
    `summary` LONGTEXT NOT NULL,
    `summaryformat` SMALLINT NULL DEFAULT 0 COMMENT 'Format of the summary field',
    `startdate` BIGINT NOT NULL,
    `roleid` BIGINT NOT NULL COMMENT 'The ID of the role at the remote server that our users will get when we enrol them there',
    `rolename` VARCHAR(255) NOT NULL COMMENT 'The name of the role at the remote server that our users will get when we enrol them there',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_hostid_remoteid` (`hostid`, `remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Caches the information fetched via XML-RPC about courses on remote hosts that are offered for our users';

CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Unique enrollment ID',
    `hostid` BIGINT NOT NULL COMMENT 'ID of the remote MNet host',
    `userid` BIGINT NOT NULL COMMENT 'ID of our local user on this server',
    `remotecourseid` BIGINT NOT NULL COMMENT 'ID of the course at  the remote server. Note that this may and may not be cached in our mnetservice_enrol_courses table, depends of whether the course is opened for remote enrolments or our student is the enrolled there via other plugin',
    `rolename` VARCHAR(255) NOT NULL,
    `enroltime` BIGINT NOT NULL DEFAULT 0,
    `enroltype` VARCHAR(20) NOT NULL COMMENT 'The name of the enrol plugin at the remote server that was used to enrol our student into their course',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_mnetservice_enrol_enrolments_fk_user_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_mnetservice_enrol_enrolments_fk_mnet_host_fk` FOREIGN KEY (`hostid`) REFERENCES `mdl_mnet_host` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Caches the information about enrolments of our local users in courses on remote hosts';

CREATE TABLE `mdl_modules` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `cron` BIGINT NOT NULL DEFAULT 0,
    `lastcron` BIGINT NOT NULL DEFAULT 0,
    `search` VARCHAR(255) NOT NULL,
    `visible` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='modules available in the site';

CREATE TABLE `mdl_moodlenet_share_progress` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` TINYINT NOT NULL,
    `courseid` BIGINT NOT NULL,
    `cmid` BIGINT NULL,
    `userid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `resourceurl` VARCHAR(255) NULL,
    `status` TINYINT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Records MoodleNet share progress';

CREATE TABLE `mdl_my_pages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NULL DEFAULT 0 COMMENT 'The user who owns this page or 0 for system defaults',
    `name` VARCHAR(200) NOT NULL COMMENT 'The page name (freeform text)',
    `private` TINYINT NOT NULL DEFAULT 1 COMMENT 'Whether or not the page is private (dashboard) or public (profile)',
    `sortorder` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'The order of the pages for a user',
    PRIMARY KEY (`id`),
    KEY `user_idx` (`userid`, `private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Extra user pages for the My Moodle system';

CREATE TABLE `mdl_notifications` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `useridfrom` BIGINT NOT NULL,
    `useridto` BIGINT NOT NULL,
    `subject` LONGTEXT NULL COMMENT 'The message subject',
    `fullmessage` LONGTEXT NULL,
    `fullmessageformat` TINYINT NOT NULL DEFAULT 0,
    `fullmessagehtml` LONGTEXT NULL,
    `smallmessage` LONGTEXT NULL,
    `component` VARCHAR(100) NULL,
    `eventtype` VARCHAR(100) NULL,
    `contexturl` LONGTEXT NULL,
    `contexturlname` LONGTEXT NULL,
    `timeread` BIGINT NULL,
    `timecreated` BIGINT NOT NULL,
    `customdata` LONGTEXT NULL COMMENT 'Custom data to be passed to the message processor. Must be serialisable using json_encode()',
    PRIMARY KEY (`id`),
    KEY `useridfrom` (`useridfrom`),
    CONSTRAINT `mdl_notifications_useridto_fk` FOREIGN KEY (`useridto`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all notifications';

CREATE TABLE `mdl_oauth2_access_token` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timecreated` BIGINT NOT NULL COMMENT 'Time this record was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'Time this record was modified.',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who modified this record.',
    `issuerid` BIGINT NOT NULL COMMENT 'Corresponding oauth2 issuer',
    `token` LONGTEXT NOT NULL COMMENT 'access token',
    `expires` BIGINT NOT NULL COMMENT 'Expiry timestamp (according to the issuer)',
    `scope` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `issueridkey` (`issuerid`),
    CONSTRAINT `mdl_oauth2_access_token_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores access tokens for system accounts in order to be able to use a single token across multiple sessions';

CREATE TABLE `mdl_oauth2_endpoint` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timecreated` BIGINT NOT NULL COMMENT 'The time this record was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this record was modified.',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who modified this record.',
    `name` VARCHAR(255) NOT NULL COMMENT 'The service name.',
    `url` LONGTEXT NOT NULL COMMENT 'The url to the endpoint',
    `issuerid` BIGINT NOT NULL COMMENT 'The identity provider this service belongs to.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_oauth2_endpoint_issuer_id_key_fk` FOREIGN KEY (`issuerid`) REFERENCES `mdl_oauth2_issuer` (`id`),
    CONSTRAINT `mdl_oauth2_endpoint_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Describes the named endpoint for an oauth2 service.';

CREATE TABLE `mdl_oauth2_issuer` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timecreated` BIGINT NOT NULL COMMENT 'Time this record was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'Time this record was modified.',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who modified this record',
    `name` VARCHAR(255) NOT NULL COMMENT 'The name of this identity issuer',
    `image` LONGTEXT NOT NULL,
    `baseurl` LONGTEXT NOT NULL COMMENT 'The base url to the issuer',
    `clientid` LONGTEXT NOT NULL COMMENT 'The client id used to connect to this oauth2 service.',
    `clientsecret` LONGTEXT NOT NULL COMMENT 'The secret used to connect to this oauth2 service.',
    `loginscopes` LONGTEXT NOT NULL COMMENT 'The scopes requested for a normal login attempt.',
    `loginscopesoffline` LONGTEXT NOT NULL COMMENT 'The scopes requested for a login attempt to generate a refresh token.',
    `loginparams` LONGTEXT NOT NULL COMMENT 'Additional parameters sent for a login attempt.',
    `loginparamsoffline` LONGTEXT NOT NULL COMMENT 'Additional parameters sent for a login attempt to generate a refresh token.',
    `alloweddomains` LONGTEXT NOT NULL COMMENT 'Allowed domains for this issuer.',
    `scopessupported` LONGTEXT NULL COMMENT 'The list of scopes this service supports.',
    `enabled` TINYINT NOT NULL DEFAULT 1,
    `showonloginpage` TINYINT NOT NULL DEFAULT 1,
    `basicauth` TINYINT NOT NULL DEFAULT 0 COMMENT 'Use HTTP Basic authentication scheme when sending client ID and password',
    `sortorder` BIGINT NOT NULL COMMENT 'The defined sort order.',
    `requireconfirmation` TINYINT NOT NULL DEFAULT 1,
    `servicetype` VARCHAR(255) NULL COMMENT 'Issuer service type, such as ''google'' or ''facebook''.',
    `loginpagename` VARCHAR(255) NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Details for an oauth 2 connect identity issuer.';

CREATE TABLE `mdl_oauth2_refresh_token` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timecreated` BIGINT NOT NULL COMMENT 'Time this record was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'Time this record was modified.',
    `userid` BIGINT NOT NULL COMMENT 'The user to whom this refresh token belongs.',
    `issuerid` BIGINT NOT NULL COMMENT 'Corresponding oauth2 issuer',
    `token` LONGTEXT NOT NULL COMMENT 'refresh token',
    `scopehash` VARCHAR(40) NOT NULL COMMENT 'sha1 hash of the scopes used when requesting the refresh token',
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-issuerid-scopehash` (`userid`, `issuerid`, `scopehash`),
    CONSTRAINT `mdl_oauth2_refresh_token_issueridkey_fk` FOREIGN KEY (`issuerid`) REFERENCES `mdl_oauth2_issuer` (`id`),
    CONSTRAINT `mdl_oauth2_refresh_token_useridkey_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores refresh tokens which can be exchanged for access tokens';

CREATE TABLE `mdl_oauth2_system_account` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timecreated` BIGINT NOT NULL COMMENT 'Time this record was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'Time this record was modified.',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who modified this record.',
    `issuerid` BIGINT NOT NULL COMMENT 'The id of the oauth 2 identity issuer',
    `refreshtoken` LONGTEXT NOT NULL COMMENT 'The refresh token used to request access tokens.',
    `grantedscopes` LONGTEXT NOT NULL COMMENT 'The scopes that this system account has been granted access to.',
    `email` LONGTEXT NULL COMMENT 'The email that was connected to this issuer.',
    `username` LONGTEXT NOT NULL COMMENT 'The username that was connected as a system account to this issue.',
    PRIMARY KEY (`id`),
    KEY `issueridkey` (`issuerid`),
    CONSTRAINT `mdl_oauth2_system_account_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stored details used to get an access token as a system user for this oauth2 service.';

CREATE TABLE `mdl_oauth2_user_field_mapping` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timemodified` BIGINT NOT NULL COMMENT 'The time this record was modified',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this record was created.',
    `usermodified` BIGINT NOT NULL COMMENT 'The user who modified this record.',
    `issuerid` BIGINT NOT NULL COMMENT 'The oauth issuer.',
    `externalfield` VARCHAR(500) NOT NULL COMMENT 'The fieldname returned by the userinfo endpoint.',
    `internalfield` VARCHAR(64) NOT NULL COMMENT 'The name of the Moodle field this user field maps to.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniqinternal` (`issuerid`, `internalfield`),
    CONSTRAINT `mdl_oauth2_user_field_mapping_issuerkey_fk` FOREIGN KEY (`issuerid`) REFERENCES `mdl_oauth2_issuer` (`id`),
    CONSTRAINT `mdl_oauth2_user_field_mapping_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Mapping of oauth user fields to moodle fields.';

CREATE TABLE `mdl_page` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `content` LONGTEXT NULL,
    `contentformat` SMALLINT NOT NULL DEFAULT 0,
    `legacyfiles` SMALLINT NOT NULL DEFAULT 0,
    `legacyfileslast` BIGINT NULL,
    `display` SMALLINT NOT NULL DEFAULT 0,
    `displayoptions` LONGTEXT NULL,
    `revision` BIGINT NOT NULL DEFAULT 0 COMMENT 'incremented when after each file changes, solves browser caching issues',
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record is one page and its config data';

CREATE TABLE `mdl_paygw_paypal` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `paymentid` BIGINT NOT NULL,
    `pp_orderid` VARCHAR(255) NOT NULL DEFAULT 'The ID of the order in PayPal',
    PRIMARY KEY (`id`),
    KEY `paymentid` (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores PayPal related information';

CREATE TABLE `mdl_payment_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `idnumber` VARCHAR(100) NULL,
    `contextid` BIGINT NOT NULL,
    `enabled` TINYINT NOT NULL DEFAULT 0,
    `archived` TINYINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NULL,
    `timemodified` BIGINT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_payment_accounts_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Payment accounts';

CREATE TABLE `mdl_payment_gateways` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `accountid` BIGINT NOT NULL,
    `gateway` VARCHAR(100) NOT NULL,
    `enabled` TINYINT NOT NULL DEFAULT 1,
    `config` LONGTEXT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_payment_gateways_accountid_fk` FOREIGN KEY (`accountid`) REFERENCES `mdl_payment_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Configuration for one gateway for one payment account';

CREATE TABLE `mdl_payments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(100) NOT NULL COMMENT 'The plugin this payment belongs to.',
    `paymentarea` VARCHAR(50) NOT NULL COMMENT 'The name of payable area',
    `itemid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `amount` VARCHAR(20) NOT NULL,
    `currency` VARCHAR(3) NOT NULL,
    `accountid` BIGINT NOT NULL,
    `gateway` VARCHAR(100) NOT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `gateway` (`gateway`),
    KEY `component-paymentarea-itemid` (`component`, `paymentarea`, `itemid`),
    CONSTRAINT `mdl_payments_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_payments_accountid_fk` FOREIGN KEY (`accountid`) REFERENCES `mdl_payment_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores information about payments';

CREATE TABLE `mdl_portfolio_instance` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `plugin` VARCHAR(50) NOT NULL COMMENT 'fk to plugin',
    `name` VARCHAR(255) NOT NULL COMMENT 'name of plugin instance',
    `visible` TINYINT NOT NULL DEFAULT 1 COMMENT 'whether this instance is visible or not',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='base table (not including config data) for instances of portfolio plugins.';

CREATE TABLE `mdl_portfolio_instance_config` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `instance` BIGINT NOT NULL COMMENT 'instance of plugin we''re configurating',
    `name` VARCHAR(255) NOT NULL COMMENT 'config field',
    `value` LONGTEXT NULL COMMENT 'config value',
    PRIMARY KEY (`id`),
    KEY `name` (`name`),
    CONSTRAINT `mdl_portfolio_instance_config_instancefk_fk` FOREIGN KEY (`instance`) REFERENCES `mdl_portfolio_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='config for portfolio plugin instances';

CREATE TABLE `mdl_portfolio_instance_user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `instance` BIGINT NOT NULL COMMENT 'fk to instance table',
    `userid` BIGINT NOT NULL COMMENT 'fk to user table',
    `name` VARCHAR(255) NOT NULL COMMENT 'name of config item',
    `value` LONGTEXT NULL COMMENT 'value of config item',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_portfolio_instance_user_instancefk_fk` FOREIGN KEY (`instance`) REFERENCES `mdl_portfolio_instance` (`id`),
    CONSTRAINT `mdl_portfolio_instance_user_userfk_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='user data for portfolio instances.';

CREATE TABLE `mdl_portfolio_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'user who exported content',
    `time` BIGINT NOT NULL COMMENT 'time of transfer (in the case of a queued transfer this is the time the actual transfer ran, not when the user started)',
    `portfolio` BIGINT NOT NULL COMMENT 'fk to portfolio_instance',
    `caller_class` VARCHAR(150) NOT NULL COMMENT 'the name of the class used to create the transfer',
    `caller_file` VARCHAR(255) NOT NULL COMMENT 'path to file to include where the class definition lives. (relative to dirroot)',
    `caller_component` VARCHAR(255) NULL COMMENT 'the component name responsible for exporting',
    `caller_sha1` VARCHAR(255) NOT NULL COMMENT 'sha1 of exported content as far as the caller is concerned (before the portfolio plugin gets a hold of it)',
    `tempdataid` BIGINT NOT NULL DEFAULT 0 COMMENT 'old id from portfolio_tempdata.  This is so that we can gracefully catch a race condition between an external system requesting a file and causing the tempdata to be deleted, before the user gets the "your transfer is requested" page',
    `returnurl` VARCHAR(255) NOT NULL COMMENT 'the original "returnurl" of the export - takes us to the moodle page we started from',
    `continueurl` VARCHAR(255) NOT NULL COMMENT 'the url the external system has set to view the transfer',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_portfolio_log_userfk_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_portfolio_log_portfoliofk_fk` FOREIGN KEY (`portfolio`) REFERENCES `mdl_portfolio_instance` (`id`),
    CONSTRAINT `mdl_portfolio_log_tempdataid_fk` FOREIGN KEY (`tempdataid`) REFERENCES `mdl_portfolio_tempdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='log of portfolio transfers (used to later check for duplicates)';

CREATE TABLE `mdl_portfolio_mahara_queue` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `transferid` BIGINT NOT NULL COMMENT 'fk to portfolio_tempdata.id',
    `token` VARCHAR(50) NOT NULL COMMENT 'the token mahara sent us to use for this transfer.',
    PRIMARY KEY (`id`),
    KEY `tokenidx` (`token`),
    CONSTRAINT `mdl_portfolio_mahara_queue_transferfk_fk` FOREIGN KEY (`transferid`) REFERENCES `mdl_portfolio_tempdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='maps mahara tokens to transfer ids';

CREATE TABLE `mdl_portfolio_tempdata` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `data` LONGTEXT NULL COMMENT 'dumping ground for portfolio callers to store their data in.',
    `expirytime` BIGINT NOT NULL COMMENT 'time this record will expire (used for cron cleanups) - the start of export + 24 hours',
    `userid` BIGINT NOT NULL COMMENT 'psuedo fk to user.  this is stored in the serialised data structure in the data field, but added here for ease of lookups.',
    `instance` BIGINT NULL DEFAULT 0 COMMENT 'which portfolio plugin instance is being used',
    `queued` TINYINT NOT NULL DEFAULT 0 COMMENT 'Value 1 means the entry should be processed in cron.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_portfolio_tempdata_userfk_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_portfolio_tempdata_instance_fk` FOREIGN KEY (`instance`) REFERENCES `mdl_portfolio_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='stores temporary data for portfolio exports. the id of this table is used for the itemid for the temporary files area.  cron can clean up stale records (and associated file data) after expirytime.';

CREATE TABLE `mdl_post` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `module` VARCHAR(20) NOT NULL,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `groupid` BIGINT NOT NULL DEFAULT 0,
    `moduleid` BIGINT NOT NULL DEFAULT 0,
    `coursemoduleid` BIGINT NOT NULL DEFAULT 0,
    `subject` VARCHAR(128) NOT NULL,
    `summary` LONGTEXT NULL,
    `content` LONGTEXT NULL,
    `uniquehash` VARCHAR(255) NOT NULL,
    `rating` BIGINT NOT NULL DEFAULT 0,
    `format` BIGINT NOT NULL DEFAULT 0,
    `summaryformat` TINYINT NOT NULL DEFAULT 0,
    `attachment` VARCHAR(100) NULL COMMENT 'attachment',
    `publishstate` VARCHAR(20) NOT NULL DEFAULT 'draft',
    `lastmodified` BIGINT NOT NULL DEFAULT 0,
    `created` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id-userid` (`id`, `userid`),
    KEY `lastmodified` (`lastmodified`),
    KEY `module` (`module`),
    KEY `subject` (`subject`),
    CONSTRAINT `mdl_post_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_post_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_post_coursemoduleid_fk` FOREIGN KEY (`coursemoduleid`) REFERENCES `mdl_course_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Generic post table to hold data blog entries etc in different modules';

CREATE TABLE `mdl_profiling` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `runid` VARCHAR(32) NOT NULL COMMENT 'the unique id for this run (as generated by xhprof)',
    `url` VARCHAR(255) NOT NULL COMMENT 'the url this profiling record is about (without wwwroot nor query params)',
    `data` LONGTEXT NOT NULL COMMENT 'the raw data gathered by xhprof',
    `totalexecutiontime` BIGINT NOT NULL COMMENT 'time (in microseconds) spent by the run',
    `totalcputime` BIGINT NOT NULL COMMENT 'time (in microseconds) spent by the CPU in this run',
    `totalcalls` BIGINT NOT NULL COMMENT 'Total number of calls performed by the run',
    `totalmemory` BIGINT NOT NULL COMMENT 'Total memory used byt the run',
    `runreference` TINYINT NOT NULL DEFAULT 0 COMMENT 'Is this run a reference one',
    `runcomment` VARCHAR(255) NOT NULL COMMENT 'Brief comment for this run',
    `timecreated` BIGINT NOT NULL COMMENT 'unix timestap of the creation of this run',
    PRIMARY KEY (`id`),
    UNIQUE KEY `runid_uk` (`runid`),
    KEY `url_runreference_ix` (`url`, `runreference`),
    KEY `timecreated_runreference_ix` (`timecreated`, `runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the results of all the profiling runs';

CREATE TABLE `mdl_qtype_ddimageortext` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 1,
    `correctfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_qtype_ddimageortext_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines drag and drop (text or images onto a background image) questions';

CREATE TABLE `mdl_qtype_ddimageortext_drags` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `no` BIGINT NOT NULL DEFAULT 0 COMMENT 'drag no',
    `draggroup` BIGINT NOT NULL DEFAULT 0,
    `infinite` SMALLINT NOT NULL DEFAULT 0,
    `label` LONGTEXT NOT NULL COMMENT 'Alt text label for drag-able image.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_qtype_ddimageortext_drags_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Images to drag. Actual file names are not stored here we use the file names as found in the file storage area.';

CREATE TABLE `mdl_qtype_ddimageortext_drops` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `no` BIGINT NOT NULL DEFAULT 0 COMMENT 'drop number',
    `xleft` BIGINT NOT NULL DEFAULT 0,
    `ytop` BIGINT NOT NULL DEFAULT 0,
    `choice` BIGINT NOT NULL DEFAULT 0,
    `label` LONGTEXT NOT NULL COMMENT 'Alt label for drop box',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_qtype_ddimageortext_drops_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Drop boxes';

CREATE TABLE `mdl_qtype_ddmarker` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 1,
    `correctfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0,
    `showmisplaced` SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_qtype_ddmarker_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines drag and drop (text or images onto a background image) questions';

CREATE TABLE `mdl_qtype_ddmarker_drags` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `no` BIGINT NOT NULL DEFAULT 0 COMMENT 'drag no',
    `label` LONGTEXT NOT NULL COMMENT 'Alt text label for drag-able image.',
    `infinite` SMALLINT NOT NULL DEFAULT 0,
    `noofdrags` BIGINT NOT NULL DEFAULT 1 COMMENT 'No of drag items, ignored if drag is infinite.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_qtype_ddmarker_drags_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Labels for markers to drag.';

CREATE TABLE `mdl_qtype_ddmarker_drops` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `no` BIGINT NOT NULL DEFAULT 0 COMMENT 'drop number',
    `shape` VARCHAR(255) NULL COMMENT 'circle, rectangle, polygon',
    `coords` LONGTEXT NOT NULL,
    `choice` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_qtype_ddmarker_drops_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='drop regions';

CREATE TABLE `mdl_qtype_essay_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL COMMENT 'Foreign key linking to the question table.',
    `responseformat` VARCHAR(16) NOT NULL DEFAULT 'editor' COMMENT 'The type of input area students should be given for their response.',
    `responserequired` TINYINT NOT NULL DEFAULT 1 COMMENT 'Nonzero if an online text response is optional',
    `responsefieldlines` SMALLINT NOT NULL DEFAULT 15 COMMENT 'Approximate height, in lines, of the input box the students should be given for their response.',
    `minwordlimit` BIGINT NULL COMMENT 'Minimum number of words',
    `maxwordlimit` BIGINT NULL COMMENT 'Maximum number of words',
    `attachments` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Whether, and how many, attachments a student is allowed to include with their response. -1 means unlimited.',
    `attachmentsrequired` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The number of attachments that should be required',
    `graderinfo` LONGTEXT NULL COMMENT 'Information shown to people with permission to manually grade the question, when they are grading.',
    `graderinfoformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The text format for graderinfo.',
    `responsetemplate` LONGTEXT NULL COMMENT 'The template to pre-populate student''s response field during attempt.',
    `responsetemplateformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The text format for responsetemplate.',
    `maxbytes` BIGINT NOT NULL DEFAULT 0 COMMENT 'Maximum size of attached files in bytes.',
    `filetypeslist` LONGTEXT NULL COMMENT 'What attachment file type a student is allowed to include with their response. * or empty means unlimited.',
    PRIMARY KEY (`id`),
    KEY `questionid` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Extra options for essay questions.';

CREATE TABLE `mdl_qtype_match_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key link to question.id.',
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 1,
    `correctfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0 COMMENT 'If true, then when the user gets the question partially correct, tell them how many choices they got correct alongside the feedback.',
    PRIMARY KEY (`id`),
    KEY `questionid` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines the question-type specific options for matching questions';

CREATE TABLE `mdl_qtype_match_subquestions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key link to question.id.',
    `questiontext` LONGTEXT NOT NULL,
    `questiontextformat` TINYINT NOT NULL DEFAULT 0,
    `answertext` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_qtype_match_subquestions_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The subquestions that make up a matching question';

CREATE TABLE `mdl_qtype_multichoice_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question.id',
    `layout` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Not used. Was intended for a vertical/horizontal layout option. See MDL-18445.',
    `single` SMALLINT NOT NULL DEFAULT 0 COMMENT 'If 0 it multiple response (checkboxes). Otherwise it is radio buttons.',
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 1 COMMENT 'Whether the choices can be randomly shuffled.',
    `correctfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `answernumbering` VARCHAR(10) NOT NULL DEFAULT 'abc' COMMENT 'Indicates how and whether the choices should be numbered.',
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0 COMMENT 'If true, then when the user gets a multiple-response question partially correct, tell them how many choices they got correct alongside the feedback.',
    `showstandardinstruction` TINYINT NOT NULL DEFAULT 1 COMMENT 'Whether standard instruction (''Select one:'' or ''Select one or more:'') is displayed',
    PRIMARY KEY (`id`),
    KEY `questionid` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for multiple choice questions';

CREATE TABLE `mdl_qtype_randomsamatch_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question.id.',
    `choose` BIGINT NOT NULL DEFAULT 4 COMMENT 'Number of subquestions to randomly generate.',
    `subcats` TINYINT NOT NULL DEFAULT 1 COMMENT 'Whether to include or not the subcategories.',
    `correctfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0 COMMENT 'If true, then when the user gets the question partially correct, tell them how many choices they got correct alongside the feedback.',
    PRIMARY KEY (`id`),
    KEY `questionid` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about a random short-answer matching question';

CREATE TABLE `mdl_qtype_shortanswer_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question.id.',
    `usecase` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether answers are matched case-sensitively.',
    PRIMARY KEY (`id`),
    KEY `questionid` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for short answer questions';

CREATE TABLE `mdl_question` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `parent` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `questiontext` LONGTEXT NOT NULL,
    `questiontextformat` TINYINT NOT NULL DEFAULT 0,
    `generalfeedback` LONGTEXT NOT NULL COMMENT 'to store the question feedback',
    `generalfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `defaultmark` DECIMAL(12,7) NOT NULL DEFAULT 1,
    `penalty` DECIMAL(12,7) NOT NULL DEFAULT 0.3333333,
    `qtype` VARCHAR(20) NOT NULL,
    `length` BIGINT NOT NULL DEFAULT 1,
    `stamp` VARCHAR(255) NOT NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'time question was created',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'time that question was last modified',
    `createdby` BIGINT NULL COMMENT 'userid of person who created this question',
    `modifiedby` BIGINT NULL COMMENT 'userid of person who last edited this question',
    PRIMARY KEY (`id`),
    KEY `qtype` (`qtype`),
    CONSTRAINT `mdl_question_parent_fk` FOREIGN KEY (`parent`) REFERENCES `mdl_question` (`id`),
    CONSTRAINT `mdl_question_createdby_fk` FOREIGN KEY (`createdby`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_question_modifiedby_fk` FOREIGN KEY (`modifiedby`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores the definition of one version of a question.';

CREATE TABLE `mdl_question_answers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0,
    `answer` LONGTEXT NOT NULL,
    `answerformat` TINYINT NOT NULL DEFAULT 0,
    `fraction` DECIMAL(12,7) NOT NULL DEFAULT 0,
    `feedback` LONGTEXT NOT NULL,
    `feedbackformat` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_answers_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Answers, with a fractional grade (0-1) and feedback';

CREATE TABLE `mdl_question_attempt_step_data` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `attemptstepid` BIGINT NOT NULL COMMENT 'Foreign key, references question_attempt_steps.id',
    `name` VARCHAR(32) NOT NULL COMMENT 'The name of this bit of data.',
    `value` LONGTEXT NULL COMMENT 'The corresponding value',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_attempt_step_data_attemptstepid_fk` FOREIGN KEY (`attemptstepid`) REFERENCES `mdl_question_attempt_steps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each question_attempt_step has an associative array of the data that was submitted by the user in the POST request. It can also contain extra data from the question type or behaviour to avoid re-computation. The convention is that names belonging to the behaviour start with -, and cached values added to the submitted data start with _, or _-';

CREATE TABLE `mdl_question_attempt_steps` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionattemptid` BIGINT NOT NULL COMMENT 'Foreign key, references question_attempt.id',
    `sequencenumber` BIGINT NOT NULL COMMENT 'Numbers the steps in a question attempt sequentially from 0.',
    `state` VARCHAR(13) NOT NULL COMMENT 'One of the constants defined by the question_state class, giving the state of the question at the end of this step.',
    `fraction` DECIMAL(12,7) NULL COMMENT 'The grade for this question, when graded out of 1. Needs to be multiplied by question_attempt.maxmark to get the actual mark for the question.',
    `timecreated` BIGINT NOT NULL COMMENT 'Time-stamp of the action that lead to this state being created.',
    `userid` BIGINT NULL COMMENT 'The user whose action lead to this state being created.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `questionattemptid-sequencenumber` (`questionattemptid`, `sequencenumber`),
    CONSTRAINT `mdl_question_attempt_steps_questionattemptid_fk` FOREIGN KEY (`questionattemptid`) REFERENCES `mdl_question_attempts` (`id`),
    CONSTRAINT `mdl_question_attempt_steps_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores one step in in a question attempt. As well as the data here, the step will have some data in the question_attempt_step_data table.';

CREATE TABLE `mdl_question_attempts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionusageid` BIGINT NOT NULL COMMENT 'Foreign key, references question_usages.id',
    `slot` BIGINT NOT NULL COMMENT 'Used to number the questions in one attempt sequentially.',
    `behaviour` VARCHAR(32) NOT NULL COMMENT 'The name of the question behaviour that is managing this question attempt.',
    `questionid` BIGINT NOT NULL COMMENT 'The id of the question being attempted. Foreign key references question.id.',
    `variant` BIGINT NOT NULL DEFAULT 1 COMMENT 'The variant of the qusetion being used.',
    `maxmark` DECIMAL(12,7) NOT NULL COMMENT 'The grade this question is marked out of in this attempt.',
    `minfraction` DECIMAL(12,7) NOT NULL COMMENT 'Some questions can award negative marks. This indicates the most negative mark that can be awarded, on the faction scale where the maximum positive mark is 1.',
    `maxfraction` DECIMAL(12,7) NOT NULL DEFAULT 1 COMMENT 'Some questions can give fractions greater than 1. This indicates the greatest fraction that can be awarded.',
    `flagged` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether this question has been flagged within the attempt.',
    `questionsummary` LONGTEXT NULL COMMENT 'If this question uses randomisation, it should set this field to summarise what random version the student actually saw. This is a human-readable textual summary of the student''s response which might, for example, be used in a report.',
    `rightanswer` LONGTEXT NULL COMMENT 'This is a human-readable textual summary of the right answer to this question. Might be used, for example on the quiz preview, to help people who are testing the question. Or might be used in reports.',
    `responsesummary` LONGTEXT NULL COMMENT 'This is a textual summary of the student''s response (basically what you would expect to in the Quiz responses report).',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this record was last changed.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `questionusageid-slot` (`questionusageid`, `slot`),
    KEY `behaviour` (`behaviour`),
    CONSTRAINT `mdl_question_attempts_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`),
    CONSTRAINT `mdl_question_attempts_questionusageid_fk` FOREIGN KEY (`questionusageid`) REFERENCES `mdl_question_usages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each row here corresponds to an attempt at one question, as part of a question_usage. A question_attempt will have some question_attempt_steps';

CREATE TABLE `mdl_question_bank_entries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questioncategoryid` BIGINT NOT NULL DEFAULT 0 COMMENT 'ID of the category this question is part of.',
    `idnumber` VARCHAR(100) NULL COMMENT 'Unique identifier, useful especially for mapping to external entities.',
    `ownerid` BIGINT NULL COMMENT 'userid of person who owns this question bank entry.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `categoryidnumber` (`questioncategoryid`, `idnumber`),
    CONSTRAINT `mdl_question_bank_entries_questioncategoryid_fk` FOREIGN KEY (`questioncategoryid`) REFERENCES `mdl_question_categories` (`id`),
    CONSTRAINT `mdl_question_bank_entries_ownerid_fk` FOREIGN KEY (`ownerid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each question bank entry. This table has one row for each question that appears in the question bank.';

CREATE TABLE `mdl_question_calculated` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0,
    `answer` BIGINT NOT NULL DEFAULT 0,
    `tolerance` VARCHAR(20) NOT NULL DEFAULT 0.0,
    `tolerancetype` BIGINT NOT NULL DEFAULT 1,
    `correctanswerlength` BIGINT NOT NULL DEFAULT 2,
    `correctanswerformat` BIGINT NOT NULL DEFAULT 2,
    PRIMARY KEY (`id`),
    KEY `answer` (`answer`),
    CONSTRAINT `mdl_question_calculated_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for questions of type calculated';

CREATE TABLE `mdl_question_calculated_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0,
    `synchronize` TINYINT NOT NULL DEFAULT 0,
    `single` SMALLINT NOT NULL DEFAULT 0 COMMENT 'If 0 it multiple response (checkboxes). Otherwise it is radio buttons.',
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Whether the choices can be randomly shuffled.',
    `correctfeedback` LONGTEXT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `answernumbering` VARCHAR(10) NOT NULL DEFAULT 'abc' COMMENT 'Indicates how and whether the choices should be numbered.',
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0 COMMENT 'If true, then when the user gets a multiple-response question partially correct, tell them how many choices they got correct alongside the feedback.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_calculated_options_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for questions of type calculated';

CREATE TABLE `mdl_question_categories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `contextid` BIGINT NOT NULL DEFAULT 0 COMMENT 'context that this category is shared in',
    `info` LONGTEXT NOT NULL,
    `infoformat` TINYINT NOT NULL DEFAULT 0,
    `stamp` VARCHAR(255) NOT NULL,
    `parent` BIGINT NOT NULL DEFAULT 0,
    `sortorder` BIGINT NOT NULL DEFAULT 999,
    `idnumber` VARCHAR(100) NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `contextidstamp` (`contextid`, `stamp`),
    UNIQUE KEY `contextididnumber` (`contextid`, `idnumber`),
    KEY `contextid` (`contextid`),
    CONSTRAINT `mdl_question_categories_parent_fk` FOREIGN KEY (`parent`) REFERENCES `mdl_question_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Categories are for grouping questions';

CREATE TABLE `mdl_question_dataset_definitions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `category` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `type` BIGINT NOT NULL DEFAULT 0,
    `options` VARCHAR(255) NOT NULL,
    `itemcount` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_dataset_definitions_category_fk` FOREIGN KEY (`category`) REFERENCES `mdl_question_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Organises and stores properties for dataset items';

CREATE TABLE `mdl_question_dataset_items` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `definition` BIGINT NOT NULL DEFAULT 0,
    `itemnumber` BIGINT NOT NULL DEFAULT 0,
    `value` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `definition` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Individual dataset items';

CREATE TABLE `mdl_question_datasets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0,
    `datasetdefinition` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `question-datasetdefinition` (`question`, `datasetdefinition`),
    CONSTRAINT `mdl_question_datasets_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`),
    CONSTRAINT `mdl_question_datasets_datasetdefinition_fk` FOREIGN KEY (`datasetdefinition`) REFERENCES `mdl_question_dataset_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Many-many relation between questions and dataset definitions';

CREATE TABLE `mdl_question_ddwtos` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 1,
    `correctfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_ddwtos_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines drag and drop (words into sentences) questions';

CREATE TABLE `mdl_question_gapselect` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL DEFAULT 0,
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 1,
    `correctfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any correct response.',
    `correctfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `partiallycorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any partially correct response.',
    `partiallycorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `incorrectfeedback` LONGTEXT NOT NULL COMMENT 'Feedback shown for any incorrect response.',
    `incorrectfeedbackformat` TINYINT NOT NULL DEFAULT 0,
    `shownumcorrect` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_gapselect_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines select missing words questions';

CREATE TABLE `mdl_question_hints` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionid` BIGINT NOT NULL,
    `hint` LONGTEXT NOT NULL COMMENT 'The text of the feedback to be given.',
    `hintformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of the hint.',
    `shownumcorrect` TINYINT NULL COMMENT 'Whether the feedback should include a message about how many things the student got right. This is only applicable to certain question types (for example matching or multiple choice multiple-response).',
    `clearwrong` TINYINT NULL COMMENT 'Whether any wrong choices should be cleared before the next try. Whether this is applicable, and what it means, depends on the question type, as with the shownumright option.',
    `options` VARCHAR(255) NULL COMMENT 'A space for any other question-type specific options.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_hints_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the the part of the question definition that gives different feedback after each try in interactive and similar behaviours.';

CREATE TABLE `mdl_question_multianswer` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0,
    `sequence` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_multianswer_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for multianswer questions';

CREATE TABLE `mdl_question_numerical` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0 COMMENT 'Redundant, because of the answer field. Foreign key references question.id.',
    `answer` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question_answers.id.',
    `tolerance` VARCHAR(255) NOT NULL DEFAULT 0.0 COMMENT 'Allowed error when matching a response to this answer. I don''t know why this is stored as a string.',
    PRIMARY KEY (`id`),
    KEY `answer` (`answer`),
    CONSTRAINT `mdl_question_numerical_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for numerical questions.';

CREATE TABLE `mdl_question_numerical_options` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0,
    `showunits` SMALLINT NOT NULL DEFAULT 0 COMMENT 'How units are handled: 3) Not used at all, 0) Optional, or 1) must be right or penalty applied.',
    `unitsleft` SMALLINT NOT NULL DEFAULT 0 COMMENT 'display the unit at left as in $1.00',
    `unitgradingtype` SMALLINT NOT NULL DEFAULT 0 COMMENT '0 no penalty, 1 fraction response grade, 2 fraction total grade',
    `unitpenalty` DECIMAL(12,7) NOT NULL DEFAULT 0.1 COMMENT 'Penalty for getting the unit wrong, when they are being graded.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_numerical_options_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for questions of type numerical This table is also used by the calculated question type';

CREATE TABLE `mdl_question_numerical_units` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question.id',
    `multiplier` DECIMAL(38,19) NOT NULL DEFAULT 1.00000000000000000000 COMMENT 'The multiplier for this unit. For example, if the first unit is (1.0, ''cm''), another unit might be (0.1, ''mm'') or (100.0, ''m'').',
    `unit` VARCHAR(50) NOT NULL COMMENT 'The unit. For example ''m'' or ''kg''.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `question-unit` (`question`, `unit`),
    CONSTRAINT `mdl_question_numerical_units_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Optional unit options for numerical questions. This table is also used by the calculated question type.';

CREATE TABLE `mdl_question_references` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `usingcontextid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Context where question is used.',
    `component` VARCHAR(100) NULL COMMENT 'Component (e.g. mod_quiz or core_question)',
    `questionarea` VARCHAR(50) NULL COMMENT 'Depending on the component, which area the question is used in (e.g. slot for quiz).',
    `itemid` BIGINT NULL COMMENT 'Plugin specific id (e.g. slotid for quiz) where its used.',
    `questionbankentryid` BIGINT NOT NULL DEFAULT 0 COMMENT 'ID of the question bank entry this question is part of.',
    `version` BIGINT NULL COMMENT 'Version number for the question where NULL means use the latest non-draft version.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `context-component-area-itemid` (`usingcontextid`, `component`, `questionarea`, `itemid`),
    CONSTRAINT `mdl_question_references_usingcontextid_fk` FOREIGN KEY (`usingcontextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_question_references_questionbankentryid_fk` FOREIGN KEY (`questionbankentryid`) REFERENCES `mdl_question_bank_entries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Records where a specific question is used.';

CREATE TABLE `mdl_question_response_analysis` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `hashcode` VARCHAR(40) NOT NULL COMMENT 'sha1 hash of serialized qubaids_condition class. Unique for every combination of class name and property.',
    `whichtries` VARCHAR(255) NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `questionid` BIGINT NOT NULL,
    `variant` BIGINT NULL,
    `subqid` VARCHAR(100) NOT NULL,
    `aid` VARCHAR(100) NULL,
    `response` LONGTEXT NULL,
    `credit` DECIMAL(15,5) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_response_analysis_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Analysis of student responses given to questions.';

CREATE TABLE `mdl_question_response_count` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `analysisid` BIGINT NOT NULL,
    `try` BIGINT NOT NULL,
    `rcount` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_response_count_analysisid_fk` FOREIGN KEY (`analysisid`) REFERENCES `mdl_question_response_analysis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Count for each responses for each try at a question.';

CREATE TABLE `mdl_question_set_references` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `usingcontextid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Context where question is used.',
    `component` VARCHAR(100) NULL COMMENT 'Component (e.g. mod_quiz)',
    `questionarea` VARCHAR(50) NULL COMMENT 'Depending on the component, which area the question is used in (e.g. slot for quiz).',
    `itemid` BIGINT NULL COMMENT 'Plugin specific id (e.g. slotid for quiz) where its used.',
    `questionscontextid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Context questions come from.',
    `filtercondition` LONGTEXT NULL COMMENT 'Filter expression in json format',
    PRIMARY KEY (`id`),
    UNIQUE KEY `context-component-area-itemid` (`usingcontextid`, `component`, `questionarea`, `itemid`),
    CONSTRAINT `mdl_question_set_references_usingcontextid_fk` FOREIGN KEY (`usingcontextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_question_set_references_questionscontextid_fk` FOREIGN KEY (`questionscontextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Records where groups of questions are used.';

CREATE TABLE `mdl_question_statistics` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `hashcode` VARCHAR(40) NOT NULL COMMENT 'sha1 hash of serialized qubaids_condition class. Unique for every combination of class name and property.',
    `timemodified` BIGINT NOT NULL,
    `questionid` BIGINT NOT NULL,
    `slot` BIGINT NULL COMMENT 'The position in the quiz where this question appears',
    `subquestion` SMALLINT NOT NULL,
    `variant` BIGINT NULL,
    `s` BIGINT NOT NULL DEFAULT 0,
    `effectiveweight` DECIMAL(15,5) NULL,
    `negcovar` TINYINT NOT NULL DEFAULT 0,
    `discriminationindex` DECIMAL(15,5) NULL,
    `discriminativeefficiency` DECIMAL(15,5) NULL,
    `sd` DECIMAL(15,10) NULL,
    `facility` DECIMAL(15,10) NULL,
    `subquestions` LONGTEXT NULL,
    `maxmark` DECIMAL(12,7) NULL,
    `positions` LONGTEXT NULL COMMENT 'positions in which this item appears. Only used for random questions.',
    `randomguessscore` DECIMAL(12,7) NULL COMMENT 'An estimate of the score a student would get by guessing randomly.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_statistics_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Statistics for individual questions used in an activity.';

CREATE TABLE `mdl_question_truefalse` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `question` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question.id.',
    `trueanswer` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question_answers.id. The ''True'' choice.',
    `falseanswer` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references question_answers.id. The ''False'' choice.',
    `showstandardinstruction` TINYINT NOT NULL DEFAULT 1 COMMENT 'Whether standard instruction (''Select one:'') is displayed',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_truefalse_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Options for True-False questions';

CREATE TABLE `mdl_question_usages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL COMMENT 'Every question usage must be associated with some context.',
    `component` VARCHAR(255) NOT NULL COMMENT 'The plugin this attempt belongs to, e.g. ''mod_quiz'', ''block_questionoftheday'', ''filter_embedquestion''.',
    `preferredbehaviour` VARCHAR(32) NOT NULL COMMENT 'The archetypal behaviour that should be used for question attempts in this usage.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_usages_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table''s main purpose it to assign a unique id to each attempt at a set of questions by some part of Moodle. A question usage is made up of a number of question_attempts.';

CREATE TABLE `mdl_question_versions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionbankentryid` BIGINT NOT NULL DEFAULT 0 COMMENT 'ID of the question bank entry this question version is part of.',
    `version` BIGINT NOT NULL DEFAULT 1 COMMENT 'Version number for the question where the first version is always 1.',
    `questionid` BIGINT NOT NULL DEFAULT 0 COMMENT 'The question ID.',
    `status` VARCHAR(10) NOT NULL DEFAULT 'ready' COMMENT 'If the question is ready, hidden or draft',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_question_versions_questionbankentryid_fk` FOREIGN KEY (`questionbankentryid`) REFERENCES `mdl_question_bank_entries` (`id`),
    CONSTRAINT `mdl_question_versions_questionid_fk` FOREIGN KEY (`questionid`) REFERENCES `mdl_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A join table linking the different question version definitions in the question table to the question_bank_entires.';

CREATE TABLE `mdl_quiz` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Standard Moodle primary key.',
    `course` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key reference to the course this quiz is part of.',
    `name` VARCHAR(255) NOT NULL COMMENT 'Quiz name.',
    `intro` LONGTEXT NOT NULL COMMENT 'Quiz introduction text.',
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Quiz intro text format.',
    `timeopen` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time when this quiz opens. (0 = no restriction.)',
    `timeclose` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time when this quiz closes. (0 = no restriction.)',
    `timelimit` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time limit for quiz attempts, in seconds.',
    `overduehandling` VARCHAR(16) NOT NULL DEFAULT 'autoabandon' COMMENT 'The method used to handle overdue attempts. ''autosubmit'', ''graceperiod'' or ''autoabandon''.',
    `graceperiod` BIGINT NOT NULL DEFAULT 0 COMMENT 'The amount of time (in seconds) after the time limit runs out during which attempts can still be submitted, if overduehandling is set to allow it.',
    `preferredbehaviour` VARCHAR(32) NOT NULL COMMENT 'The behaviour to ask questions to use.',
    `canredoquestions` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Allows students to redo any completed question within a quiz attempt.',
    `attempts` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'The maximum number of attempts a student is allowed.',
    `attemptonlast` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Whether subsequent attempts start from the answer to the previous attempt (1) or start blank (0).',
    `grademethod` SMALLINT NOT NULL DEFAULT 1 COMMENT 'One of the values QUIZ_GRADEHIGHEST, QUIZ_GRADEAVERAGE, QUIZ_ATTEMPTFIRST or QUIZ_ATTEMPTLAST.',
    `decimalpoints` SMALLINT NOT NULL DEFAULT 2 COMMENT 'Number of decimal points to use when displaying grades.',
    `questiondecimalpoints` SMALLINT NOT NULL DEFAULT -1 COMMENT 'Number of decimal points to use when displaying question grades. (-1 means use decimalpoints.)',
    `reviewattempt` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Whether users are allowed to review their quiz attempts at various times. This is a bit field, decoded by the \mod_quiz\question\display_options class. It is formed by ORing together the constants defined there.',
    `reviewcorrectness` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Whether users are allowed to review the correctness of the questions in their quiz attempts at various times. A bit field, like reviewattempt.',
    `reviewmaxmarks` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Works with reviewmarks to control whether users can see grades at various times. 0 here means no grade information is shown at all. If 1, student can see the number of marks available for this question, and reviewmarks applies. A bit field, like reviewattempt.',
    `reviewmarks` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Works with reviewmaxmarks to control whether users can see grades at various times. If reviewmaxmarks is 1, then this controls whether students can see the the mark they got for the question, in addition to the max. A bit field, like reviewattempt.',
    `reviewspecificfeedback` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Whether users are allowed to see the specific feedback in their quiz attempts. A bit field, like reviewattempt.',
    `reviewgeneralfeedback` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Whether users are allowed to see the general feedback in their quiz attempts. A bit field, like reviewattempt.',
    `reviewrightanswer` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Whether users are allowed to see the right answer in their quiz attempts. A bit field, like reviewattempt.',
    `reviewoverallfeedback` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Whether users are allowed to see the overall feedback in their quiz attempts. A bit field, like reviewattempt.',
    `questionsperpage` BIGINT NOT NULL DEFAULT 0 COMMENT 'How often to insert a page break when editing the quiz, or when shuffling the question order.',
    `navmethod` VARCHAR(16) NOT NULL DEFAULT 'free' COMMENT 'Any constraints on how the user is allowed to navigate around the quiz. Currently recognised values are ''free'' and ''seq''.',
    `shuffleanswers` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Whether the parts of the question should be shuffled, in those question types that support it.',
    `sumgrades` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'The total of all the question instance maxmarks.',
    `grade` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'The total that the quiz overall grade is scaled to be out of.',
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time when the quiz was added to the course.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'Last modified time.',
    `password` VARCHAR(255) NOT NULL COMMENT 'A password that the student must enter before starting or continuing a quiz attempt.',
    `subnet` VARCHAR(255) NOT NULL COMMENT 'Used to restrict the IP addresses from which this quiz can be attempted. The format is as requried by the address_in_subnet function.',
    `browsersecurity` VARCHAR(32) NOT NULL COMMENT 'Restriciton on the browser the student must use. E.g. ''securewindow''.',
    `delay1` BIGINT NOT NULL DEFAULT 0 COMMENT 'Delay that must be left between the first and second attempt, in seconds.',
    `delay2` BIGINT NOT NULL DEFAULT 0 COMMENT 'Delay that must be left between the second and subsequent attempt, in seconds.',
    `showuserpicture` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Option to show the user''s picture during the attempt and on the review page.',
    `showblocks` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Whether blocks should be shown on the attempt.php and review.php pages.',
    `completionattemptsexhausted` TINYINT NULL DEFAULT 0,
    `completionminattempts` BIGINT NOT NULL DEFAULT 0,
    `allowofflineattempts` TINYINT NULL DEFAULT 0 COMMENT 'Whether to allow the quiz to be attempted offline in the mobile app',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The settings for each quiz.';

CREATE TABLE `mdl_quiz_attempts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Standard Moodle primary key.',
    `quiz` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key reference to the quiz that was attempted.',
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key reference to the user whose attempt this is.',
    `attempt` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Sequentially numbers this student''s attempts at this quiz.',
    `uniqueid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key reference to the question_usage that holds the details of the the question_attempts that make up this quiz attempt.',
    `layout` LONGTEXT NOT NULL,
    `currentpage` BIGINT NOT NULL DEFAULT 0,
    `preview` SMALLINT NOT NULL DEFAULT 0,
    `state` VARCHAR(16) NOT NULL DEFAULT 'inprogress' COMMENT 'The current state of the attempts. ''inprogress'', ''overdue'', ''finished'' or ''abandoned''.',
    `timestart` BIGINT NOT NULL DEFAULT 0 COMMENT 'Time when the attempt was started.',
    `timefinish` BIGINT NOT NULL DEFAULT 0 COMMENT 'Time when the attempt was submitted. 0 if the attempt has not been submitted yet.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'Last modified time.',
    `timemodifiedoffline` BIGINT NOT NULL DEFAULT 0 COMMENT 'Last modified time via web services.',
    `timecheckstate` BIGINT NULL DEFAULT 0 COMMENT 'Next time quiz cron should check attempt for state changes.  NULL means never check.',
    `sumgrades` DECIMAL(10,5) NULL COMMENT 'Total marks for this attempt.',
    `gradednotificationsenttime` BIGINT NULL COMMENT 'The timestamp when the ''graded'' notification was sent.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `quiz-userid-attempt` (`quiz`, `userid`, `attempt`),
    KEY `uniqueid` (`uniqueid`),
    KEY `state-timecheckstate` (`state`, `timecheckstate`),
    CONSTRAINT `mdl_quiz_attempts_quiz_fk` FOREIGN KEY (`quiz`) REFERENCES `mdl_quiz` (`id`),
    CONSTRAINT `mdl_quiz_attempts_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores users attempts at quizzes.';

CREATE TABLE `mdl_quiz_feedback` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `quizid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references quiz.id.',
    `feedbacktext` LONGTEXT NOT NULL COMMENT 'The feedback to show for a attempt where mingrade <= attempt grade < maxgrade. See function quiz_feedback_for_grade in mod/quiz/locallib.php.',
    `feedbacktextformat` TINYINT NOT NULL DEFAULT 0,
    `mingrade` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'The lower limit of this grade band. Inclusive.',
    `maxgrade` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'The upper limit of this grade band. Exclusive.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_quiz_feedback_quizid_fk` FOREIGN KEY (`quizid`) REFERENCES `mdl_quiz` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Feedback given to students based on which grade band their overall score lies.';

CREATE TABLE `mdl_quiz_grades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `quiz` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references quiz.id.',
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references user.id.',
    `grade` DECIMAL(10,5) NOT NULL DEFAULT 0 COMMENT 'The overall grade from the quiz. Not affected by overrides in the gradebook.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The last time this grade changed.',
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_quiz_grades_quiz_fk` FOREIGN KEY (`quiz`) REFERENCES `mdl_quiz` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the overall grade for each user on the quiz, based on their various attempts and the quiz.grademethod setting.';

CREATE TABLE `mdl_quiz_overrides` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `quiz` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references quiz.id',
    `groupid` BIGINT NULL COMMENT 'Foreign key references groups.id.  Can be null if this is a per-user override.',
    `userid` BIGINT NULL COMMENT 'Foreign key references user.id.  Can be null if this is a per-group override.',
    `timeopen` BIGINT NULL COMMENT 'Time at which students may start attempting this quiz. Can be null, in which case the quiz default is used.',
    `timeclose` BIGINT NULL COMMENT 'Time by which students must have completed their attempt.  Can be null, in which case the quiz default is used.',
    `timelimit` BIGINT NULL COMMENT 'Time limit in seconds.  Can be null, in which case the quiz default is used.',
    `attempts` MEDIUMINT NULL,
    `password` VARCHAR(255) NULL COMMENT 'Quiz password.  Can be null, in which case the quiz default is used.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_quiz_overrides_quiz_fk` FOREIGN KEY (`quiz`) REFERENCES `mdl_quiz` (`id`),
    CONSTRAINT `mdl_quiz_overrides_groupid_fk` FOREIGN KEY (`groupid`) REFERENCES `mdl_groups` (`id`),
    CONSTRAINT `mdl_quiz_overrides_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The overrides to quiz settings on a per-user and per-group basis.';

CREATE TABLE `mdl_quiz_overview_regrades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `questionusageid` BIGINT NOT NULL COMMENT 'Foreign key references question_usages.id, or equivalently quiz_attempt.uniqueid.',
    `slot` BIGINT NOT NULL COMMENT 'Foreign key, references question_attempts.slot',
    `newfraction` DECIMAL(12,7) NULL COMMENT 'The new fraction for this question_attempt after regrading.',
    `oldfraction` DECIMAL(12,7) NULL COMMENT 'The previous fraction for this question_attempt.',
    `regraded` SMALLINT NOT NULL COMMENT 'set to 0 if element has just been regraded. Set to 1 if element has been marked as needing regrading.',
    `timemodified` BIGINT NOT NULL COMMENT 'Timestamp of when this row was last modified.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_quiz_overview_regrades_questionusageid-slot_fk` FOREIGN KEY (`questionusageid`, `slot`) REFERENCES `mdl_question_attempts` (`questionusageid`, `slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table records which question attempts need regrading and the grade they will be regraded to.';

CREATE TABLE `mdl_quiz_reports` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL COMMENT 'name of the report, same as the directory name',
    `displayorder` BIGINT NOT NULL COMMENT 'display order for report tabs',
    `capability` VARCHAR(255) NULL COMMENT 'Capability required to see this report. May be blank which means use the default of mod/quiz:viewreport. This is used when deciding which tabs to render.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Lists all the installed quiz reports and their display order and so on. No need to worry about deleting old records. Only records with an equivalent directory are displayed.';

CREATE TABLE `mdl_quiz_sections` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `quizid` BIGINT NOT NULL COMMENT 'Foreign key references quiz.id.',
    `firstslot` BIGINT NOT NULL COMMENT 'Number of the first slot in the section. The section runs from here to the start of the next section, or the end of the quiz.',
    `heading` VARCHAR(1333) NULL COMMENT 'The text of the heading. May be an empty string/null. Multilang format.',
    `shufflequestions` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Whether the question order within this section should be shuffled for each attempt.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `quizid-firstslot` (`quizid`, `firstslot`),
    CONSTRAINT `mdl_quiz_sections_quizid_fk` FOREIGN KEY (`quizid`) REFERENCES `mdl_quiz` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores sections of a quiz with section name (heading), from slot-number N and whether the question order should be shuffled.';

CREATE TABLE `mdl_quiz_slots` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `slot` BIGINT NOT NULL COMMENT 'Where this question comes in order in the list of questions in this quiz. Like question_attempts.slot.',
    `quizid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Foreign key references quiz.id.',
    `page` BIGINT NOT NULL COMMENT 'The page number that this questions appears on. If the question in slot n appears on page p, then the question in slot n+1 must appear on page p or p+1. Well, except that when a quiz is being created, there may be empty pages, which would cause the page number to jump here.',
    `displaynumber` VARCHAR(16) NULL COMMENT 'Stores customised question number such as 1.2, A1, B12. If this is null, the default number is used.',
    `requireprevious` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Set to 1 when current question requires previous one to be answered first.',
    `maxmark` DECIMAL(12,7) NOT NULL DEFAULT 0 COMMENT 'How many marks this question contributes to quiz.sumgrades.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `quizid-slot` (`quizid`, `slot`),
    CONSTRAINT `mdl_quiz_slots_quizid_fk` FOREIGN KEY (`quizid`) REFERENCES `mdl_quiz` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the question used in a quiz, with the order, and for each question, which page it appears on, and the maximum mark (weight).';

CREATE TABLE `mdl_quiz_statistics` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `hashcode` VARCHAR(40) NOT NULL COMMENT 'sha1 hash of serialized qubaids_condition class. Unique for every combination of class name and property.',
    `whichattempts` SMALLINT NOT NULL COMMENT 'bool used to indicate whether these stats are for all attempts or just for the first.',
    `timemodified` BIGINT NOT NULL,
    `firstattemptscount` BIGINT NOT NULL,
    `highestattemptscount` BIGINT NOT NULL,
    `lastattemptscount` BIGINT NOT NULL,
    `allattemptscount` BIGINT NOT NULL,
    `firstattemptsavg` DECIMAL(15,5) NULL,
    `highestattemptsavg` DECIMAL(15,5) NULL,
    `lastattemptsavg` DECIMAL(15,5) NULL,
    `allattemptsavg` DECIMAL(15,5) NULL,
    `median` DECIMAL(15,5) NULL,
    `standarddeviation` DECIMAL(15,5) NULL,
    `skewness` DECIMAL(15,10) NULL,
    `kurtosis` DECIMAL(15,5) NULL,
    `cic` DECIMAL(15,10) NULL,
    `errorratio` DECIMAL(15,10) NULL,
    `standarderror` DECIMAL(15,10) NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='table to cache results from analysis done in statistics report for quizzes.';

CREATE TABLE `mdl_quizaccess_seb_quizsettings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `quizid` BIGINT NOT NULL COMMENT 'Foreign key to quiz id.',
    `cmid` BIGINT NOT NULL COMMENT 'Foreign key to course module id.',
    `templateid` BIGINT NOT NULL COMMENT 'Foreign key to quizaccess_seb_template.id.',
    `requiresafeexambrowser` TINYINT NOT NULL COMMENT 'Bool whether to require SEB.',
    `showsebtaskbar` TINYINT NULL COMMENT 'Bool to show SEB task bar',
    `showwificontrol` TINYINT NULL COMMENT 'Bool to allow user to control networking.',
    `showreloadbutton` TINYINT NULL COMMENT 'Bool to show reload button.',
    `showtime` TINYINT NULL COMMENT 'Bool to show the clock.',
    `showkeyboardlayout` TINYINT NULL COMMENT 'Bool to show keyboard layout.',
    `allowuserquitseb` TINYINT NULL COMMENT 'Bool to show quit button.',
    `quitpassword` LONGTEXT NULL COMMENT 'Quit password to exit SEB.',
    `linkquitseb` LONGTEXT NULL COMMENT 'Link to exit SEB.',
    `userconfirmquit` TINYINT NULL COMMENT 'Bool whether confirm quit popup should appear.',
    `enableaudiocontrol` TINYINT NULL COMMENT 'Bool to show volume and audio controls.',
    `muteonstartup` TINYINT NULL COMMENT 'Bool whether browser starts muted.',
    `allowspellchecking` TINYINT NULL COMMENT 'Bool whether spell checking will happen in SEB.',
    `allowreloadinexam` TINYINT NULL COMMENT 'Bool whether user can reload.',
    `activateurlfiltering` TINYINT NULL COMMENT 'Bool whether URLs will be filtered.',
    `filterembeddedcontent` TINYINT NULL COMMENT 'Bool wither embedded content will be filtered',
    `expressionsallowed` LONGTEXT NULL COMMENT 'Comma or newline separated list of allowed expressions',
    `regexallowed` LONGTEXT NULL COMMENT 'Regex of allowed URLs',
    `expressionsblocked` LONGTEXT NULL COMMENT 'Comma or newline separated list of blocked expressions',
    `regexblocked` LONGTEXT NULL COMMENT 'Regex of blocked URLs',
    `allowedbrowserexamkeys` LONGTEXT NULL COMMENT 'List of allowed browser exam keys.',
    `showsebdownloadlink` TINYINT NULL COMMENT 'Bool whether SEB download link should appear',
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `quizid` (`quizid`),
    KEY `cmid` (`cmid`),
    CONSTRAINT `mdl_quizaccess_seb_quizsettings_templateid_fk` FOREIGN KEY (`templateid`) REFERENCES `mdl_quizaccess_seb_template` (`id`),
    CONSTRAINT `mdl_quizaccess_seb_quizsettings_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the quiz level Safe Exam Browser configuration.';

CREATE TABLE `mdl_quizaccess_seb_template` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'Name of the template',
    `description` LONGTEXT NOT NULL,
    `content` LONGTEXT NOT NULL COMMENT 'Content of the template',
    `enabled` TINYINT NOT NULL,
    `sortorder` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_quizaccess_seb_template_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Templates for Safe Exam Browser configuration.';

CREATE TABLE `mdl_rating` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL,
    `component` VARCHAR(100) NOT NULL,
    `ratingarea` VARCHAR(50) NOT NULL,
    `itemid` BIGINT NOT NULL,
    `scaleid` BIGINT NOT NULL,
    `rating` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `uniqueuserrating` (`component`, `ratingarea`, `contextid`, `itemid`),
    CONSTRAINT `mdl_rating_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_rating_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_rating_scaleid_fk` FOREIGN KEY (`scaleid`) REFERENCES `mdl_scale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='moodle ratings';

CREATE TABLE `mdl_registration_hubs` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `token` VARCHAR(255) NOT NULL COMMENT 'the token to communicate with the hub by web service',
    `hubname` VARCHAR(255) NOT NULL,
    `huburl` VARCHAR(255) NOT NULL,
    `confirmed` TINYINT NOT NULL DEFAULT 0,
    `secret` VARCHAR(255) NULL COMMENT 'the unique site identifier for this hub',
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='hub where the site is registered on with their associated token';

CREATE TABLE `mdl_reportbuilder_audience` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `reportid` BIGINT NOT NULL,
    `heading` VARCHAR(255) NULL,
    `classname` VARCHAR(255) NOT NULL,
    `configdata` LONGTEXT NOT NULL,
    `usercreated` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_reportbuilder_audience_reportid_fk` FOREIGN KEY (`reportid`) REFERENCES `mdl_reportbuilder_report` (`id`),
    CONSTRAINT `mdl_reportbuilder_audience_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_reportbuilder_audience_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines report audience';

CREATE TABLE `mdl_reportbuilder_column` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `reportid` BIGINT NOT NULL DEFAULT 0,
    `uniqueidentifier` VARCHAR(255) NOT NULL,
    `aggregation` VARCHAR(32) NULL,
    `heading` VARCHAR(255) NULL,
    `columnorder` BIGINT NOT NULL,
    `sortenabled` TINYINT NOT NULL DEFAULT 0,
    `sortdirection` TINYINT NOT NULL,
    `sortorder` BIGINT NULL,
    `usercreated` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_reportbuilder_column_reportid_fk` FOREIGN KEY (`reportid`) REFERENCES `mdl_reportbuilder_report` (`id`),
    CONSTRAINT `mdl_reportbuilder_column_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_reportbuilder_column_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to represent a report column';

CREATE TABLE `mdl_reportbuilder_filter` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `reportid` BIGINT NOT NULL DEFAULT 0,
    `uniqueidentifier` VARCHAR(255) NOT NULL,
    `heading` VARCHAR(255) NULL,
    `iscondition` TINYINT NOT NULL DEFAULT 0,
    `filterorder` BIGINT NOT NULL,
    `usercreated` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `report-filter` (`reportid`, `uniqueidentifier`, `iscondition`),
    CONSTRAINT `mdl_reportbuilder_filter_reportid_fk` FOREIGN KEY (`reportid`) REFERENCES `mdl_reportbuilder_report` (`id`),
    CONSTRAINT `mdl_reportbuilder_filter_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_reportbuilder_filter_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to represent a report filter/condition';

CREATE TABLE `mdl_reportbuilder_report` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `source` VARCHAR(255) NOT NULL,
    `type` TINYINT NOT NULL DEFAULT 0,
    `uniquerows` TINYINT NOT NULL DEFAULT 0,
    `conditiondata` LONGTEXT NULL,
    `settingsdata` LONGTEXT NULL,
    `contextid` BIGINT NOT NULL,
    `component` VARCHAR(100) NOT NULL,
    `area` VARCHAR(100) NOT NULL,
    `itemid` BIGINT NOT NULL DEFAULT 0,
    `usercreated` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_reportbuilder_report_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_reportbuilder_report_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_reportbuilder_report_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to represent a report';

CREATE TABLE `mdl_reportbuilder_schedule` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `reportid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `enabled` TINYINT NOT NULL DEFAULT 1,
    `audiences` LONGTEXT NOT NULL,
    `format` VARCHAR(255) NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `message` LONGTEXT NOT NULL,
    `messageformat` BIGINT NOT NULL,
    `userviewas` BIGINT NOT NULL DEFAULT 0,
    `timescheduled` BIGINT NOT NULL DEFAULT 0,
    `recurrence` BIGINT NOT NULL DEFAULT 0,
    `reportempty` BIGINT NOT NULL DEFAULT 0,
    `timelastsent` BIGINT NOT NULL DEFAULT 0,
    `timenextsend` BIGINT NOT NULL DEFAULT 0,
    `usercreated` BIGINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_reportbuilder_schedule_reportid_fk` FOREIGN KEY (`reportid`) REFERENCES `mdl_reportbuilder_report` (`id`),
    CONSTRAINT `mdl_reportbuilder_schedule_userviewas_fk` FOREIGN KEY (`userviewas`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_reportbuilder_schedule_usercreated_fk` FOREIGN KEY (`usercreated`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_reportbuilder_schedule_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to represent a report schedule';

CREATE TABLE `mdl_repository` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NOT NULL,
    `visible` TINYINT NULL DEFAULT 1,
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains one entry for every configured external repository instance.';

CREATE TABLE `mdl_repository_instance_config` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `instanceid` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The config for intances';

CREATE TABLE `mdl_repository_instances` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `typeid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `contextid` BIGINT NOT NULL,
    `username` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `timecreated` BIGINT NULL,
    `timemodified` BIGINT NULL,
    `readonly` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_repository_instances_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_repository_instances_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains one entry for every configured external repository instance.';

CREATE TABLE `mdl_repository_onedrive_access` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `timemodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `usermodified` BIGINT NOT NULL,
    `permissionid` VARCHAR(255) NOT NULL COMMENT 'The permission id in OneDrive.',
    `itemid` VARCHAR(255) NOT NULL COMMENT 'The item id in OneDrive.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_repository_onedrive_access_usermodifiedkey_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of temporary access grants.';

CREATE TABLE `mdl_resource` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `tobemigrated` SMALLINT NOT NULL DEFAULT 0,
    `legacyfiles` SMALLINT NOT NULL DEFAULT 0,
    `legacyfileslast` BIGINT NULL,
    `display` SMALLINT NOT NULL DEFAULT 0,
    `displayoptions` LONGTEXT NULL,
    `filterfiles` SMALLINT NOT NULL DEFAULT 0,
    `revision` BIGINT NOT NULL DEFAULT 0 COMMENT 'incremented when after each file changes, solves browser caching issues',
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record is one resource and its config data';

CREATE TABLE `mdl_resource_old` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(30) NOT NULL,
    `reference` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `alltext` LONGTEXT NOT NULL,
    `popup` LONGTEXT NOT NULL,
    `options` VARCHAR(255) NOT NULL,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `oldid` BIGINT NOT NULL,
    `cmid` BIGINT NULL,
    `newmodule` VARCHAR(50) NULL,
    `newid` BIGINT NULL,
    `migrated` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `oldid` (`oldid`),
    KEY `cmid` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='backup of all old resource instances from 1.9';

CREATE TABLE `mdl_role` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'Empty names are automatically localised',
    `shortname` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NOT NULL COMMENT 'Empty descriptions may be automatically localised',
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    `archetype` VARCHAR(30) NOT NULL COMMENT 'Role archetype is used during install and role reset, marks admin role and helps in site settings',
    PRIMARY KEY (`id`),
    UNIQUE KEY `sortorder` (`sortorder`),
    UNIQUE KEY `shortname` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='moodle roles';

CREATE TABLE `mdl_role_allow_assign` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `allowassign` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `roleid-allowassign` (`roleid`, `allowassign`),
    CONSTRAINT `mdl_role_allow_assign_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_role_allow_assign_allowassign_fk` FOREIGN KEY (`allowassign`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='this defines what role can assign what role';

CREATE TABLE `mdl_role_allow_override` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `allowoverride` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `roleid-allowoverride` (`roleid`, `allowoverride`),
    CONSTRAINT `mdl_role_allow_override_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_role_allow_override_allowoverride_fk` FOREIGN KEY (`allowoverride`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='this defines what role can override what role';

CREATE TABLE `mdl_role_allow_switch` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `roleid` BIGINT NOT NULL COMMENT 'The role the user has.',
    `allowswitch` BIGINT NOT NULL COMMENT 'The id of a role that the user is allowed to switch to as a result of having this role.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `roleid-allowoverride` (`roleid`, `allowswitch`),
    CONSTRAINT `mdl_role_allow_switch_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_role_allow_switch_allowswitch_fk` FOREIGN KEY (`allowswitch`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores which which other roles a user is allowed to switch to if they have one role.';

CREATE TABLE `mdl_role_allow_view` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `roleid` BIGINT NOT NULL COMMENT 'The role the user has.',
    `allowview` BIGINT NOT NULL COMMENT 'The id of a role that the user is allowed to view to as a result of having this role.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `roleid-allowview` (`roleid`, `allowview`),
    CONSTRAINT `mdl_role_allow_view_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_role_allow_view_allowview_fk` FOREIGN KEY (`allowview`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores which which other roles a user is allowed to view to if they have one role.';

CREATE TABLE `mdl_role_assignments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `contextid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `modifierid` BIGINT NOT NULL DEFAULT 0,
    `component` VARCHAR(100) NOT NULL COMMENT 'plugin responsible responsible for role assignment, empty when manually assigned',
    `itemid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Id of enrolment/auth instance responsible for this role assignment',
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `sortorder` (`sortorder`),
    KEY `rolecontext` (`roleid`, `contextid`),
    KEY `usercontextrole` (`userid`, `contextid`, `roleid`),
    KEY `component-itemid-userid` (`component`, `itemid`, `userid`),
    CONSTRAINT `mdl_role_assignments_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_role_assignments_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_role_assignments_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='assigning roles in different context';

CREATE TABLE `mdl_role_capabilities` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL DEFAULT 0,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `capability` VARCHAR(255) NOT NULL,
    `permission` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `modifierid` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `roleid-contextid-capability` (`roleid`, `contextid`, `capability`),
    CONSTRAINT `mdl_role_capabilities_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_role_capabilities_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_role_capabilities_modifierid_fk` FOREIGN KEY (`modifierid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_role_capabilities_capability_fk` FOREIGN KEY (`capability`) REFERENCES `mdl_capabilities` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='permission has to be signed, overriding a capability for a particular role in a particular context';

CREATE TABLE `mdl_role_context_levels` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `roleid` BIGINT NOT NULL,
    `contextlevel` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `contextlevel-roleid` (`contextlevel`, `roleid`),
    CONSTRAINT `mdl_role_context_levels_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Lists which roles can be assigned at which context levels. The assignment is allowed in the corresponding row is present in this table.';

CREATE TABLE `mdl_role_names` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `contextid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `roleid-contextid` (`roleid`, `contextid`),
    CONSTRAINT `mdl_role_names_roleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_role_names_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='role names in native strings';

CREATE TABLE `mdl_scale` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `scale` LONGTEXT NOT NULL,
    `description` LONGTEXT NOT NULL,
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    CONSTRAINT `mdl_scale_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines grading scales';

CREATE TABLE `mdl_scale_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `action` BIGINT NOT NULL DEFAULT 0 COMMENT 'created/modified/deleted constants',
    `oldid` BIGINT NOT NULL,
    `source` VARCHAR(255) NULL COMMENT 'What caused the modification? manual/module/import/...',
    `timemodified` BIGINT NULL COMMENT 'The last time this grade_item was modified',
    `loggeduser` BIGINT NULL COMMENT 'the userid of the person who last modified this outcome',
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `scale` LONGTEXT NOT NULL,
    `description` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `action` (`action`),
    KEY `timemodified` (`timemodified`),
    CONSTRAINT `mdl_scale_history_oldid_fk` FOREIGN KEY (`oldid`) REFERENCES `mdl_scale` (`id`),
    CONSTRAINT `mdl_scale_history_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_scale_history_loggeduser_fk` FOREIGN KEY (`loggeduser`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_scale_history_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History table';

CREATE TABLE `mdl_scorm` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `scormtype` VARCHAR(50) NOT NULL DEFAULT 'local' COMMENT 'local, external or repository',
    `reference` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `version` VARCHAR(9) NOT NULL,
    `maxgrade` DOUBLE NOT NULL DEFAULT 0,
    `grademethod` TINYINT NOT NULL DEFAULT 0,
    `whatgrade` BIGINT NOT NULL DEFAULT 0,
    `maxattempt` BIGINT NOT NULL DEFAULT 1,
    `forcecompleted` TINYINT NOT NULL DEFAULT 0,
    `forcenewattempt` TINYINT NOT NULL DEFAULT 0,
    `lastattemptlock` TINYINT NOT NULL DEFAULT 0,
    `masteryoverride` TINYINT NOT NULL DEFAULT 1,
    `displayattemptstatus` TINYINT NOT NULL DEFAULT 1,
    `displaycoursestructure` TINYINT NOT NULL DEFAULT 0,
    `updatefreq` TINYINT NOT NULL DEFAULT 0 COMMENT 'Define when the package must be automatically update',
    `sha1hash` VARCHAR(40) NULL COMMENT 'package content or ext path hash',
    `md5hash` VARCHAR(32) NOT NULL COMMENT 'MD5 Hash of package file',
    `revision` BIGINT NOT NULL DEFAULT 0 COMMENT 'revison number',
    `launch` BIGINT NOT NULL DEFAULT 0,
    `skipview` TINYINT NOT NULL DEFAULT 1,
    `hidebrowse` TINYINT NOT NULL DEFAULT 0,
    `hidetoc` TINYINT NOT NULL DEFAULT 0,
    `nav` TINYINT NOT NULL DEFAULT 1,
    `navpositionleft` BIGINT NULL DEFAULT -100,
    `navpositiontop` BIGINT NULL DEFAULT -100,
    `auto` TINYINT NOT NULL DEFAULT 0,
    `popup` TINYINT NOT NULL DEFAULT 0,
    `options` VARCHAR(255) NOT NULL,
    `width` BIGINT NOT NULL DEFAULT 100,
    `height` BIGINT NOT NULL DEFAULT 600,
    `timeopen` BIGINT NOT NULL DEFAULT 0,
    `timeclose` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `completionstatusrequired` TINYINT NULL,
    `completionscorerequired` BIGINT NULL,
    `completionstatusallscos` TINYINT NULL,
    `autocommit` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='each table is one SCORM module and its configuration';

CREATE TABLE `mdl_scorm_aicc_session` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id from user table',
    `scormid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id from scorm table',
    `hacpsession` VARCHAR(255) NOT NULL COMMENT 'sessionid used to authenticate AICC HACP communication',
    `scoid` BIGINT NULL DEFAULT 0 COMMENT 'id from scorm_scoes table',
    `scormmode` VARCHAR(50) NULL,
    `scormstatus` VARCHAR(255) NULL,
    `attempt` BIGINT NULL,
    `lessonstatus` VARCHAR(255) NULL,
    `sessiontime` VARCHAR(255) NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'time this session was created',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'time this session was last used',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_scorm_aicc_session_scormid_fk` FOREIGN KEY (`scormid`) REFERENCES `mdl_scorm` (`id`),
    CONSTRAINT `mdl_scorm_aicc_session_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Used by AICC HACP to store session information';

CREATE TABLE `mdl_scorm_attempt` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `scormid` BIGINT NOT NULL COMMENT 'The id of the scorm table',
    `attempt` BIGINT NOT NULL DEFAULT 1 COMMENT 'The attempt number',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_scorm_attempt_user_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_scorm_attempt_scorm_fk` FOREIGN KEY (`scormid`) REFERENCES `mdl_scorm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of SCORM attempts made by user.';

CREATE TABLE `mdl_scorm_element` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `element` VARCHAR(255) NOT NULL COMMENT 'Name of SCORM element',
    PRIMARY KEY (`id`),
    UNIQUE KEY `element` (`element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of scorm elements.';

CREATE TABLE `mdl_scorm_scoes` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scorm` BIGINT NOT NULL DEFAULT 0,
    `manifest` VARCHAR(255) NOT NULL,
    `organization` VARCHAR(255) NOT NULL,
    `parent` VARCHAR(255) NOT NULL,
    `identifier` VARCHAR(255) NOT NULL,
    `launch` LONGTEXT NOT NULL,
    `scormtype` VARCHAR(5) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'order of scoes',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_scorm_scoes_scorm_fk` FOREIGN KEY (`scorm`) REFERENCES `mdl_scorm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='each SCO part of the SCORM module';

CREATE TABLE `mdl_scorm_scoes_data` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_scorm_scoes_data_scorm_scoes_data_scoid_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains variable data get from packages';

CREATE TABLE `mdl_scorm_scoes_value` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL COMMENT 'The id of the scorm_scoes table',
    `attemptid` BIGINT NOT NULL COMMENT 'id from scorm_attempt',
    `elementid` BIGINT NOT NULL COMMENT 'id from scorm_element',
    `value` LONGTEXT NOT NULL COMMENT 'Value passed from SCORM package',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'Time value last changed.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_scorm_scoes_value_scoe_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`),
    CONSTRAINT `mdl_scorm_scoes_value_attempt_fk` FOREIGN KEY (`attemptid`) REFERENCES `mdl_scorm_attempt` (`id`),
    CONSTRAINT `mdl_scorm_scoes_value_element_fk` FOREIGN KEY (`elementid`) REFERENCES `mdl_scorm_element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Values passed from SCORM package';

CREATE TABLE `mdl_scorm_seq_mapinfo` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL DEFAULT 0,
    `objectiveid` BIGINT NOT NULL DEFAULT 0,
    `targetobjectiveid` BIGINT NOT NULL DEFAULT 0,
    `readsatisfiedstatus` TINYINT NOT NULL DEFAULT 1,
    `readnormalizedmeasure` TINYINT NOT NULL DEFAULT 1,
    `writesatisfiedstatus` TINYINT NOT NULL DEFAULT 0,
    `writenormalizedmeasure` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `scorm_mapinfo_uniq` (`scoid`, `id`, `objectiveid`),
    CONSTRAINT `mdl_scorm_seq_mapinfo_scorm_mapinfo_scoid_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`),
    CONSTRAINT `mdl_scorm_seq_mapinfo_scorm_mapinfo_objectiveid_fk` FOREIGN KEY (`objectiveid`) REFERENCES `mdl_scorm_seq_objective` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SCORM2004 objective mapinfo description';

CREATE TABLE `mdl_scorm_seq_objective` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL DEFAULT 0,
    `primaryobj` TINYINT NOT NULL DEFAULT 0,
    `objectiveid` VARCHAR(255) NOT NULL,
    `satisfiedbymeasure` TINYINT NOT NULL DEFAULT 1,
    `minnormalizedmeasure` DOUBLE NOT NULL DEFAULT 0.0000,
    PRIMARY KEY (`id`),
    UNIQUE KEY `scorm_objective_uniq` (`scoid`, `id`),
    CONSTRAINT `mdl_scorm_seq_objective_scorm_objective_scoid_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SCORM2004 objective description';

CREATE TABLE `mdl_scorm_seq_rolluprule` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL DEFAULT 0,
    `childactivityset` VARCHAR(15) NOT NULL,
    `minimumcount` BIGINT NOT NULL DEFAULT 0,
    `minimumpercent` DOUBLE NOT NULL DEFAULT 0.0000,
    `conditioncombination` VARCHAR(3) NOT NULL DEFAULT 'all',
    `action` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `scorm_rolluprule_uniq` (`scoid`, `id`),
    CONSTRAINT `mdl_scorm_seq_rolluprule_scorm_rolluprule_scoid_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SCORM2004 sequencing rule';

CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL DEFAULT 0,
    `rollupruleid` BIGINT NOT NULL DEFAULT 0,
    `operator` VARCHAR(5) NOT NULL DEFAULT 'noOp',
    `cond` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `scorm_rulluprulecond_uniq` (`scoid`, `rollupruleid`, `id`),
    CONSTRAINT `mdl_scorm_seq_rolluprulecond_scorm_rolluprulecond_scoid_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`),
    CONSTRAINT `mdl_scorm_seq_rolluprulecond_scorm_rolluprulecond_rolluprule_fk` FOREIGN KEY (`rollupruleid`) REFERENCES `mdl_scorm_seq_rolluprule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SCORM2004 sequencing rule';

CREATE TABLE `mdl_scorm_seq_rulecond` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL DEFAULT 0,
    `ruleconditionsid` BIGINT NOT NULL DEFAULT 0,
    `refrencedobjective` VARCHAR(255) NOT NULL,
    `measurethreshold` DOUBLE NOT NULL DEFAULT 0.0000,
    `operator` VARCHAR(5) NOT NULL DEFAULT 'noOp',
    `cond` VARCHAR(30) NOT NULL DEFAULT 'always',
    PRIMARY KEY (`id`),
    UNIQUE KEY `scorm_rulecond_uniq` (`id`, `scoid`, `ruleconditionsid`),
    CONSTRAINT `mdl_scorm_seq_rulecond_scorm_rulecond_scoid_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`),
    CONSTRAINT `mdl_scorm_seq_rulecond_scorm_rulecond_ruleconditionsid_fk` FOREIGN KEY (`ruleconditionsid`) REFERENCES `mdl_scorm_seq_ruleconds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SCORM2004 rule condition';

CREATE TABLE `mdl_scorm_seq_ruleconds` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `scoid` BIGINT NOT NULL DEFAULT 0,
    `conditioncombination` VARCHAR(3) NOT NULL DEFAULT 'all',
    `ruletype` TINYINT NOT NULL DEFAULT 0,
    `action` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `scorm_ruleconds_un` (`scoid`, `id`),
    CONSTRAINT `mdl_scorm_seq_ruleconds_scorm_ruleconds_scoid_fk` FOREIGN KEY (`scoid`) REFERENCES `mdl_scorm_scoes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SCORM2004 rule conditions';

CREATE TABLE `mdl_search_index_requests` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL COMMENT 'Context ID that has been requested for reindexing.',
    `searcharea` VARCHAR(255) NOT NULL COMMENT 'Set (e.g. ''forum-post'') if a specific area is to be reindexed. Blank indicates all areas.',
    `timerequested` BIGINT NOT NULL COMMENT 'Time at which this index update was requested.',
    `partialarea` VARCHAR(255) NOT NULL COMMENT 'If processing of this context partially completed, set to the area that needs processing next. Blank indicates not processed yet.',
    `partialtime` BIGINT NOT NULL COMMENT 'If processing partially completed, set to the timestamp within the next area where processing should start. 0 indicates not processed yet.',
    `indexpriority` BIGINT NOT NULL COMMENT 'Priority value so that important requests can be dealt with first; higher numbers are processed first',
    PRIMARY KEY (`id`),
    KEY `indexprioritytimerequested` (`indexpriority`, `timerequested`),
    CONSTRAINT `mdl_search_index_requests_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Records requests for (re)indexing of specific contexts. Entries will be removed from this table when indexing of that context is complete. (This table is not used for normal time-based indexing of new content.)';

CREATE TABLE `mdl_search_simpledb_index` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `docid` VARCHAR(255) NOT NULL,
    `itemid` BIGINT NOT NULL,
    `title` LONGTEXT NULL,
    `content` LONGTEXT NULL,
    `contextid` BIGINT NOT NULL,
    `areaid` VARCHAR(255) NOT NULL,
    `type` TINYINT NOT NULL,
    `courseid` BIGINT NOT NULL,
    `owneruserid` BIGINT NULL,
    `modified` BIGINT NOT NULL,
    `userid` BIGINT NULL,
    `description1` LONGTEXT NULL,
    `description2` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `docid` (`docid`),
    KEY `owneruserid-contextid` (`owneruserid`, `contextid`),
    KEY `contextid` (`contextid`),
    KEY `courseid` (`courseid`),
    KEY `areaid` (`areaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='search_simpledb table containing the index data.';

CREATE TABLE `mdl_sessions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `state` BIGINT NOT NULL DEFAULT 0 COMMENT '0 means normal session',
    `sid` VARCHAR(128) NOT NULL COMMENT 'Session id',
    `userid` BIGINT NOT NULL,
    `sessdata` LONGTEXT NULL COMMENT 'session content',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    `firstip` VARCHAR(45) NULL,
    `lastip` VARCHAR(45) NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `sid` (`sid`),
    KEY `state` (`state`),
    KEY `timecreated` (`timecreated`),
    KEY `timemodified` (`timemodified`),
    CONSTRAINT `mdl_sessions_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Database based session storage - now recommended';

CREATE TABLE `mdl_stats_daily` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `roleid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id of role for the aggregates',
    `stattype` VARCHAR(20) NOT NULL DEFAULT 'activity' COMMENT 'type of stat',
    `stat1` BIGINT NOT NULL DEFAULT 0 COMMENT 'stat1. usually used for reads',
    `stat2` BIGINT NOT NULL DEFAULT 0 COMMENT 'stat2. usually used for writes.',
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `timeend` (`timeend`),
    KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='to accumulate daily stats';

CREATE TABLE `mdl_stats_monthly` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `roleid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id of role for the aggregates',
    `stattype` VARCHAR(20) NOT NULL DEFAULT 'activity' COMMENT 'type of stat',
    `stat1` BIGINT NOT NULL DEFAULT 0 COMMENT 'stat1. usually used for reads',
    `stat2` BIGINT NOT NULL DEFAULT 0 COMMENT 'stat2. usually used for writes.',
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `timeend` (`timeend`),
    KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To accumulate monthly stats';

CREATE TABLE `mdl_stats_user_daily` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `statsreads` BIGINT NOT NULL DEFAULT 0,
    `statswrites` BIGINT NOT NULL DEFAULT 0,
    `stattype` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `userid` (`userid`),
    KEY `roleid` (`roleid`),
    KEY `timeend` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To accumulate daily stats per course/user';

CREATE TABLE `mdl_stats_user_monthly` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `statsreads` BIGINT NOT NULL DEFAULT 0,
    `statswrites` BIGINT NOT NULL DEFAULT 0,
    `stattype` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `userid` (`userid`),
    KEY `roleid` (`roleid`),
    KEY `timeend` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To accumulate monthly stats per course/user';

CREATE TABLE `mdl_stats_user_weekly` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `roleid` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `statsreads` BIGINT NOT NULL DEFAULT 0,
    `statswrites` BIGINT NOT NULL DEFAULT 0,
    `stattype` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `userid` (`userid`),
    KEY `roleid` (`roleid`),
    KEY `timeend` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To accumulate weekly stats per course/user';

CREATE TABLE `mdl_stats_weekly` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 0,
    `roleid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id of role for the aggregates',
    `stattype` VARCHAR(20) NOT NULL DEFAULT 'activity' COMMENT 'type of stat',
    `stat1` BIGINT NOT NULL DEFAULT 0 COMMENT 'stat1. usually used for reads',
    `stat2` BIGINT NOT NULL DEFAULT 0 COMMENT 'stat2. usually used for writes.',
    PRIMARY KEY (`id`),
    KEY `courseid` (`courseid`),
    KEY `timeend` (`timeend`),
    KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To accumulate weekly stats';

CREATE TABLE `mdl_survey` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `template` BIGINT NOT NULL DEFAULT 0,
    `days` MEDIUMINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NOT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'intro text field format',
    `questions` VARCHAR(255) NOT NULL,
    `completionsubmit` TINYINT NOT NULL DEFAULT 0 COMMENT 'If this field is set to 1, then the activity will be automatically marked as ''complete'' once the user submits the survey.',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record is one SURVEY module with its configuration';

CREATE TABLE `mdl_survey_analysis` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `survey` BIGINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `notes` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_survey_analysis_survey_fk` FOREIGN KEY (`survey`) REFERENCES `mdl_survey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='text about each survey submission';

CREATE TABLE `mdl_survey_answers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `survey` BIGINT NOT NULL DEFAULT 0,
    `question` BIGINT NOT NULL DEFAULT 0,
    `time` BIGINT NOT NULL DEFAULT 0,
    `answer1` LONGTEXT NOT NULL,
    `answer2` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    CONSTRAINT `mdl_survey_answers_survey_fk` FOREIGN KEY (`survey`) REFERENCES `mdl_survey` (`id`),
    CONSTRAINT `mdl_survey_answers_question_fk` FOREIGN KEY (`question`) REFERENCES `mdl_survey_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='the answers to each questions filled by the users';

CREATE TABLE `mdl_survey_questions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(255) NOT NULL,
    `shorttext` VARCHAR(30) NOT NULL,
    `multi` VARCHAR(100) NOT NULL,
    `intro` VARCHAR(50) NOT NULL,
    `type` SMALLINT NOT NULL DEFAULT 0,
    `options` LONGTEXT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='the questions conforming one survey';

CREATE TABLE `mdl_tag` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `tagcollid` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `rawname` VARCHAR(255) NOT NULL COMMENT 'The raw, unnormalised name for the tag as entered by users',
    `isstandard` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether this tag is standard',
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    `flag` SMALLINT NULL DEFAULT 0 COMMENT 'a tag can be ''flagged'' as inappropriate',
    `timemodified` BIGINT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `tagcollname` (`tagcollid`, `name`),
    KEY `tagcolltype` (`tagcollid`, `isstandard`),
    CONSTRAINT `mdl_tag_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_tag_tagcollid_fk` FOREIGN KEY (`tagcollid`) REFERENCES `mdl_tag_coll` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tag table - this generic table will replace the old "tags" table.';

CREATE TABLE `mdl_tag_area` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(100) NOT NULL,
    `itemtype` VARCHAR(100) NOT NULL,
    `enabled` TINYINT NOT NULL DEFAULT 1,
    `tagcollid` BIGINT NOT NULL,
    `callback` VARCHAR(100) NULL,
    `callbackfile` VARCHAR(100) NULL,
    `showstandard` TINYINT NOT NULL DEFAULT 0,
    `multiplecontexts` TINYINT NOT NULL DEFAULT 0 COMMENT 'Whether the tag area allows tag instances to be created in multiple contexts.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `compitemtype` (`component`, `itemtype`),
    CONSTRAINT `mdl_tag_area_tagcollid_fk` FOREIGN KEY (`tagcollid`) REFERENCES `mdl_tag_coll` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines various tag areas, one area is identified by component and itemtype';

CREATE TABLE `mdl_tag_coll` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `isdefault` TINYINT NOT NULL DEFAULT 0,
    `component` VARCHAR(100) NULL,
    `sortorder` MEDIUMINT NOT NULL DEFAULT 0,
    `searchable` TINYINT NOT NULL DEFAULT 1 COMMENT 'Whether the tag collection is searchable',
    `customurl` VARCHAR(255) NULL COMMENT 'Custom URL for the tag page instead of /tag/index.php',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines different set of tags';

CREATE TABLE `mdl_tag_correlation` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `tagid` BIGINT NOT NULL,
    `correlatedtags` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tag_correlation_tagid_fk` FOREIGN KEY (`tagid`) REFERENCES `mdl_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The rationale for the ''tag_correlation'' table is performance.   It works as a cache for a potentially heavy load query done at the ''tag_instance'' table.   So, the ''tag_correlation'' table stores redundant information derived from the ''tag_instance'' table';

CREATE TABLE `mdl_tag_instance` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `tagid` BIGINT NOT NULL,
    `component` VARCHAR(100) NOT NULL COMMENT 'Defines the Moodle component which the tag was added to',
    `itemtype` VARCHAR(100) NOT NULL,
    `itemid` BIGINT NOT NULL,
    `contextid` BIGINT NULL COMMENT 'The context id of the item that was tagged',
    `tiuserid` BIGINT NOT NULL DEFAULT 0,
    `ordering` BIGINT NULL COMMENT 'Maintains the order of the tag instances of an item',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'timemodified',
    PRIMARY KEY (`id`),
    UNIQUE KEY `taggeditem` (`component`, `itemtype`, `itemid`, `contextid`, `tiuserid`, `tagid`),
    KEY `taglookup` (`itemtype`, `component`, `tagid`, `contextid`),
    CONSTRAINT `mdl_tag_instance_tagid_fk` FOREIGN KEY (`tagid`) REFERENCES `mdl_tag` (`id`),
    CONSTRAINT `mdl_tag_instance_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tag_instance table holds the information of associations between tags and other items';

CREATE TABLE `mdl_task_adhoc` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(255) NOT NULL COMMENT 'The component that triggered this adhoc task.',
    `classname` VARCHAR(255) NOT NULL COMMENT 'The name of the class extending adhoc_task to run when this task is executed.',
    `nextruntime` BIGINT NOT NULL,
    `faildelay` BIGINT NULL,
    `customdata` LONGTEXT NULL COMMENT 'Custom data to be passed to the adhoc task. Must be serialisable using json_encode()',
    `userid` BIGINT NULL,
    `blocking` TINYINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'Timestamp of adhoc task creation',
    `timestarted` BIGINT NULL COMMENT 'Time when the task was started',
    `hostname` VARCHAR(255) NULL COMMENT 'Hostname where the task is running',
    `pid` BIGINT NULL COMMENT 'PHP process ID that is running the task',
    PRIMARY KEY (`id`),
    KEY `nextruntime_idx` (`nextruntime`),
    KEY `timestarted_idx` (`timestarted`),
    CONSTRAINT `mdl_task_adhoc_useriduser_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of adhoc tasks waiting to run.';

CREATE TABLE `mdl_task_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` SMALLINT NOT NULL COMMENT 'The type of task. Scheduled task = 0; Adhoc task = 1.',
    `component` VARCHAR(255) NOT NULL COMMENT 'The component that the task belongs to',
    `classname` VARCHAR(255) NOT NULL COMMENT 'The class of the task being run',
    `userid` BIGINT NOT NULL COMMENT 'The userid that the task was configured to run as (Adhoc tasks only)',
    `timestart` DECIMAL(20,10) NOT NULL COMMENT 'The start time of the task',
    `timeend` DECIMAL(20,10) NOT NULL COMMENT 'The end time of the task',
    `dbreads` BIGINT NOT NULL COMMENT 'The number of DB reads performed during the task.',
    `dbwrites` BIGINT NOT NULL COMMENT 'The number of DB writes performed during the task.',
    `result` TINYINT NOT NULL COMMENT 'Whether the task was successful or not. 0 = pass; 1 = fail.',
    `output` LONGTEXT NOT NULL,
    `hostname` VARCHAR(255) NULL COMMENT 'Hostname where the task was executed',
    `pid` BIGINT NULL COMMENT 'PHP process ID that was running the task',
    PRIMARY KEY (`id`),
    KEY `classname` (`classname`),
    KEY `timestart` (`timestart`),
    CONSTRAINT `mdl_task_log_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The log table for all tasks';

CREATE TABLE `mdl_task_scheduled` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(255) NOT NULL COMMENT 'The component this scheduled task belongs to.',
    `classname` VARCHAR(255) NOT NULL COMMENT 'The class extending scheduled_task to be called when running this task.',
    `lastruntime` BIGINT NULL,
    `nextruntime` BIGINT NULL,
    `blocking` TINYINT NOT NULL DEFAULT 0 COMMENT 'Block the entire cron when this task is running.',
    `minute` VARCHAR(200) NOT NULL,
    `hour` VARCHAR(70) NOT NULL,
    `day` VARCHAR(90) NOT NULL,
    `month` VARCHAR(30) NOT NULL,
    `dayofweek` VARCHAR(25) NOT NULL,
    `faildelay` BIGINT NULL,
    `customised` TINYINT NOT NULL DEFAULT 0 COMMENT 'Used on upgrades to prevent overwriting custom schedules.',
    `disabled` TINYINT NOT NULL DEFAULT 0 COMMENT '1 means do not run from cron',
    `timestarted` BIGINT NULL COMMENT 'Time when the task was started',
    `hostname` VARCHAR(255) NULL COMMENT 'Hostname where the task is running',
    `pid` BIGINT NULL COMMENT 'PHP process ID that is running the task',
    PRIMARY KEY (`id`),
    UNIQUE KEY `classname_uniq` (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of scheduled tasks to be run by cron.';

CREATE TABLE `mdl_tiny_autosave` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `elementid` VARCHAR(255) NOT NULL COMMENT 'The unique id for the text editor in the form.',
    `contextid` BIGINT NOT NULL COMMENT 'The contextid that the form was loaded with.',
    `pagehash` VARCHAR(64) NOT NULL COMMENT 'The HTML DOM id of the page that loaded the form.',
    `userid` BIGINT NOT NULL COMMENT 'The id of the user that loaded the form.',
    `drafttext` LONGTEXT NOT NULL COMMENT 'The draft text',
    `draftid` BIGINT NULL COMMENT 'Optional draft area id containing draft files.',
    `pageinstance` VARCHAR(64) NOT NULL COMMENT 'The browser tab instance that last saved the draft text. This is to prevent multiple tabs from the same user saving different text alternately.',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'Store the last modified time for the auto save text.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `autosave_uniq_key` (`elementid`, `contextid`, `userid`, `pagehash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The content of the textarea saved during autosave operations';

CREATE TABLE `mdl_tool_brickfield_areas` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` TINYINT NOT NULL DEFAULT 0,
    `contextid` BIGINT NULL,
    `component` VARCHAR(100) NULL,
    `tablename` VARCHAR(40) NULL,
    `fieldorarea` VARCHAR(50) NULL,
    `itemid` BIGINT NULL,
    `filename` VARCHAR(1333) NULL,
    `reftable` VARCHAR(40) NULL,
    `refid` BIGINT NULL,
    `cmid` BIGINT NULL,
    `courseid` BIGINT NULL,
    `categoryid` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `coursecm` (`courseid`, `cmid`),
    KEY `tablefield` (`type`, `tablename`, `itemid`, `fieldorarea`),
    KEY `file` (`type`, `contextid`, `component`, `fieldorarea`, `itemid`),
    KEY `reftable` (`reftable`, `refid`, `type`),
    CONSTRAINT `mdl_tool_brickfield_areas_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_tool_brickfield_areas_cmid_fk` FOREIGN KEY (`cmid`) REFERENCES `mdl_course_modules` (`id`),
    CONSTRAINT `mdl_tool_brickfield_areas_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_course_categories` (`id`),
    CONSTRAINT `mdl_tool_brickfield_areas_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Areas that have been checked for accessibility problems';

CREATE TABLE `mdl_tool_brickfield_cache_acts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `status` TINYINT NULL,
    `component` VARCHAR(64) NULL,
    `totalactivities` BIGINT NULL,
    `failedactivities` BIGINT NULL,
    `passedactivities` BIGINT NULL,
    `errorcount` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `status` (`status`),
    CONSTRAINT `mdl_tool_brickfield_cache_acts_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains accessibility summary information per activity.';

CREATE TABLE `mdl_tool_brickfield_cache_check` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `status` TINYINT NULL,
    `checkid` BIGINT NULL,
    `checkcount` BIGINT NULL,
    `errorcount` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `status` (`status`),
    KEY `errorcount` (`errorcount`),
    CONSTRAINT `mdl_tool_brickfield_cache_check_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains accessibility summary information per check.';

CREATE TABLE `mdl_tool_brickfield_checks` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `checktype` VARCHAR(64) NULL,
    `shortname` VARCHAR(64) NULL,
    `checkgroup` BIGINT NULL DEFAULT 0 COMMENT 'The group category identifier.',
    `status` SMALLINT NOT NULL,
    `severity` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `checktype` (`checktype`),
    KEY `checkgroup` (`checkgroup`),
    KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Checks details';

CREATE TABLE `mdl_tool_brickfield_content` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `areaid` BIGINT NOT NULL,
    `contenthash` VARCHAR(40) NOT NULL,
    `iscurrent` TINYINT NOT NULL DEFAULT 0,
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT '0 - needs checking, -1 in progress, 1 checked',
    `timecreated` BIGINT NOT NULL,
    `timechecked` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `status` (`status`),
    KEY `iscurrent` (`iscurrent`, `areaid`),
    CONSTRAINT `mdl_tool_brickfield_content_areaid_fk` FOREIGN KEY (`areaid`) REFERENCES `mdl_tool_brickfield_areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Content of an area at a particular time (recognised by a hash)';

CREATE TABLE `mdl_tool_brickfield_errors` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `resultid` BIGINT NOT NULL,
    `linenumber` BIGINT NOT NULL DEFAULT 0,
    `errordata` LONGTEXT NULL,
    `htmlcode` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tool_brickfield_errors_resultid_fk` FOREIGN KEY (`resultid`) REFERENCES `mdl_tool_brickfield_results` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Errors during the accessibility checks';

CREATE TABLE `mdl_tool_brickfield_process` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `item` VARCHAR(64) NULL COMMENT 'The item for process action.',
    `contextid` BIGINT NULL,
    `innercontextid` BIGINT NULL,
    `timecreated` BIGINT NULL,
    `timecompleted` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `timecompleted` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Queued records to initiate new processing of specific targets';

CREATE TABLE `mdl_tool_brickfield_results` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contentid` BIGINT NULL,
    `checkid` BIGINT NOT NULL,
    `errorcount` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `areacheck` (`contentid`, `checkid`),
    CONSTRAINT `mdl_tool_brickfield_results_contentid_fk` FOREIGN KEY (`contentid`) REFERENCES `mdl_tool_brickfield_content` (`id`),
    CONSTRAINT `mdl_tool_brickfield_results_checkid_fk` FOREIGN KEY (`checkid`) REFERENCES `mdl_tool_brickfield_checks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Results of the accessibility checks';

CREATE TABLE `mdl_tool_brickfield_schedule` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextlevel` BIGINT NOT NULL DEFAULT 50 COMMENT 'The context level for this item. Defaults to CONTEXT_COURSE.',
    `instanceid` BIGINT NOT NULL COMMENT 'The id of the specific context instance. Course id for courses.',
    `contextid` BIGINT NULL COMMENT 'Id of the specific context record.',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'The schedule status for this item. 0 = not requested; 1 = requested; 2 = analyzed.',
    `timeanalyzed` BIGINT NULL DEFAULT 0 COMMENT 'The most recent time the item was analyzed by scheduler.',
    `timemodified` BIGINT NULL DEFAULT 0 COMMENT 'Time stamp of the last record update.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `courseidx` (`contextlevel`, `instanceid`),
    KEY `statusidx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps the per course content analysis schedule.';

CREATE TABLE `mdl_tool_brickfield_summary` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `status` TINYINT NULL,
    `activities` BIGINT NULL,
    `activitiespassed` BIGINT NULL,
    `activitiesfailed` BIGINT NULL,
    `errorschecktype1` BIGINT NULL,
    `errorschecktype2` BIGINT NULL,
    `errorschecktype3` BIGINT NULL,
    `errorschecktype4` BIGINT NULL,
    `errorschecktype5` BIGINT NULL,
    `errorschecktype6` BIGINT NULL,
    `errorschecktype7` BIGINT NULL,
    `failedchecktype1` BIGINT NULL,
    `failedchecktype2` BIGINT NULL,
    `failedchecktype3` BIGINT NULL,
    `failedchecktype4` BIGINT NULL,
    `failedchecktype5` BIGINT NULL,
    `failedchecktype6` BIGINT NULL,
    `failedchecktype7` BIGINT NULL,
    `percentchecktype1` BIGINT NULL,
    `percentchecktype2` BIGINT NULL,
    `percentchecktype3` BIGINT NULL,
    `percentchecktype4` BIGINT NULL,
    `percentchecktype5` BIGINT NULL,
    `percentchecktype6` BIGINT NULL,
    `percentchecktype7` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `status` (`status`),
    CONSTRAINT `mdl_tool_brickfield_summary_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains accessibility check results summary information.';

CREATE TABLE `mdl_tool_cohortroles` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `cohortid` BIGINT NOT NULL COMMENT 'The cohort to sync',
    `roleid` BIGINT NOT NULL COMMENT 'The role to assign',
    `userid` BIGINT NOT NULL COMMENT 'The user to sync',
    `timecreated` BIGINT NOT NULL COMMENT 'The time this record was created',
    `timemodified` BIGINT NOT NULL COMMENT 'The time this record was modified.',
    `usermodified` BIGINT NULL COMMENT 'Who last modified this record?',
    PRIMARY KEY (`id`),
    UNIQUE KEY `cohortuserrole` (`cohortid`, `roleid`, `userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Mapping of users to cohort role assignments.';

CREATE TABLE `mdl_tool_customlang` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lang` VARCHAR(20) NOT NULL COMMENT 'The code of the language this string belongs to. Like en, cs or es',
    `componentid` BIGINT NOT NULL COMMENT 'The id of the component',
    `stringid` VARCHAR(255) NOT NULL COMMENT 'The identifier of the string',
    `original` LONGTEXT NOT NULL COMMENT 'English original of the string',
    `master` LONGTEXT NULL COMMENT 'Master translation of the string as is distributed in the official lang pack, null if not translated',
    `local` LONGTEXT NULL COMMENT 'Local customization of the string, null if not customized',
    `timemodified` BIGINT NOT NULL COMMENT 'The timestamp of when the original or master was recently modified',
    `timecustomized` BIGINT NULL COMMENT 'The timestamp of when the value of the local translation was recently modified, null if not customized yet',
    `outdated` SMALLINT NULL DEFAULT 0 COMMENT 'Either the English original or the master translation changed and the customization may be outdated',
    `modified` SMALLINT NULL DEFAULT 0 COMMENT 'Has the string been modified via the translator?',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_lang_component_string` (`lang`, `componentid`, `stringid`),
    CONSTRAINT `mdl_tool_customlang_fk_component_fk` FOREIGN KEY (`componentid`) REFERENCES `mdl_tool_customlang_components` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains the working checkout of all strings and their customization';

CREATE TABLE `mdl_tool_customlang_components` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'The normalized name of the plugin',
    `version` VARCHAR(255) NULL COMMENT 'The checked out version of the plugin, null if the version is unknown',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains the list of all installed plugins that provide their own language pack';

CREATE TABLE `mdl_tool_dataprivacy_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NULL,
    `usermodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data categories';

CREATE TABLE `mdl_tool_dataprivacy_contextlist` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(255) NOT NULL COMMENT 'Frankenstyle component name',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of contexts for a component';

CREATE TABLE `mdl_tool_dataprivacy_ctxexpired` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL,
    `unexpiredroles` LONGTEXT NULL COMMENT 'Roles which have explicitly not expired yet.',
    `expiredroles` LONGTEXT NULL COMMENT 'Explicitly expires roles',
    `defaultexpired` TINYINT NOT NULL COMMENT 'The default retention period has passed.',
    `status` TINYINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `contextid` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default comment for the table, please edit me';

CREATE TABLE `mdl_tool_dataprivacy_ctxinstance` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL,
    `purposeid` BIGINT NULL,
    `categoryid` BIGINT NULL,
    `usermodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `contextid` (`contextid`),
    CONSTRAINT `mdl_tool_dataprivacy_ctxinstance_purposeid_fk` FOREIGN KEY (`purposeid`) REFERENCES `mdl_tool_dataprivacy_purpose` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_ctxinstance_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_tool_dataprivacy_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default comment for the table, please edit me';

CREATE TABLE `mdl_tool_dataprivacy_ctxlevel` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextlevel` SMALLINT NOT NULL,
    `purposeid` BIGINT NULL,
    `categoryid` BIGINT NULL,
    `usermodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `contextlevel` (`contextlevel`),
    CONSTRAINT `mdl_tool_dataprivacy_ctxlevel_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_tool_dataprivacy_category` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_ctxlevel_purposeid_fk` FOREIGN KEY (`purposeid`) REFERENCES `mdl_tool_dataprivacy_purpose` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default comment for the table, please edit me';

CREATE TABLE `mdl_tool_dataprivacy_ctxlst_ctx` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `contextid` BIGINT NOT NULL,
    `contextlistid` BIGINT NOT NULL,
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'Approval status of the context item',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_ctxlst_ctx_contextlistid_fk` FOREIGN KEY (`contextlistid`) REFERENCES `mdl_tool_dataprivacy_contextlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A contextlist context item';

CREATE TABLE `mdl_tool_dataprivacy_purpose` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NULL,
    `lawfulbases` LONGTEXT NOT NULL COMMENT 'Comma-separated IDs matching records in tool_dataprivacy_lawfulbasis',
    `sensitivedatareasons` LONGTEXT NULL COMMENT 'Comma-separated IDs matching records in tool_dataprivacy_sensitive',
    `retentionperiod` VARCHAR(255) NOT NULL,
    `protected` TINYINT NULL,
    `usermodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data purposes';

CREATE TABLE `mdl_tool_dataprivacy_purposerole` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `purposeid` BIGINT NOT NULL,
    `roleid` BIGINT NOT NULL,
    `lawfulbases` LONGTEXT NULL,
    `sensitivedatareasons` LONGTEXT NULL,
    `retentionperiod` VARCHAR(255) NOT NULL,
    `protected` TINYINT NULL,
    `usermodified` BIGINT NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `purposerole` (`purposeid`, `roleid`),
    CONSTRAINT `mdl_tool_dataprivacy_purposerole_purposepurposeid_fk` FOREIGN KEY (`purposeid`) REFERENCES `mdl_tool_dataprivacy_purpose` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_purposerole_puproseroleid_fk` FOREIGN KEY (`roleid`) REFERENCES `mdl_role` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_purposerole_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data purpose overrides for a specific role';

CREATE TABLE `mdl_tool_dataprivacy_request` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` BIGINT NOT NULL DEFAULT 0 COMMENT 'Data request type',
    `comments` LONGTEXT NULL COMMENT 'More details about the request',
    `commentsformat` TINYINT NOT NULL DEFAULT 0,
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'The user ID the request is being made for',
    `requestedby` BIGINT NOT NULL DEFAULT 0 COMMENT 'The user ID of the one making the request',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'The current status of the data request',
    `dpo` BIGINT NULL DEFAULT 0 COMMENT 'The user ID of the Data Protection Officer who is reviewing th request',
    `dpocomment` LONGTEXT NULL COMMENT 'DPO''s comments (e.g. reason for rejecting the request, etc.)',
    `dpocommentformat` TINYINT NOT NULL DEFAULT 0,
    `systemapproved` SMALLINT NOT NULL DEFAULT 0,
    `usermodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The user who created/modified this request object',
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time this data request was created',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'The last time this data request was updated',
    `creationmethod` BIGINT NOT NULL DEFAULT 0 COMMENT 'The type of the creation method of the data request',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_request_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_request_requestedby_fk` FOREIGN KEY (`requestedby`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_request_dpo_fk` FOREIGN KEY (`dpo`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_request_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table for data requests';

CREATE TABLE `mdl_tool_dataprivacy_rqst_ctxlst` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `requestid` BIGINT NOT NULL,
    `contextlistid` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `requestidcontextlistid` (`requestid`, `contextlistid`),
    CONSTRAINT `mdl_tool_dataprivacy_rqst_ctxlst_requestid_fk` FOREIGN KEY (`requestid`) REFERENCES `mdl_tool_dataprivacy_request` (`id`),
    CONSTRAINT `mdl_tool_dataprivacy_rqst_ctxlst_contextlistid_fk` FOREIGN KEY (`contextlistid`) REFERENCES `mdl_tool_dataprivacy_contextlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Association table joining requests and contextlists';

CREATE TABLE `mdl_tool_mfa` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'User ID',
    `factor` VARCHAR(100) NOT NULL COMMENT 'Factor type',
    `secret` VARCHAR(1333) NULL COMMENT 'Any secret data for factor',
    `label` VARCHAR(1333) NULL COMMENT 'label for factor instance, eg device or email.',
    `timecreated` BIGINT NULL COMMENT 'Time the factor instance was setup',
    `createdfromip` VARCHAR(100) NULL COMMENT 'IP that the factor was setup from',
    `timemodified` BIGINT NULL COMMENT 'Time factor was last modified.',
    `lastverified` BIGINT NULL COMMENT 'Time user was last verified with this factor.',
    `revoked` TINYINT NOT NULL DEFAULT 0,
    `lockcounter` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Counter of failed attempts',
    PRIMARY KEY (`id`),
    KEY `userid` (`userid`),
    KEY `factor` (`factor`),
    KEY `lockcounter` (`userid`, `factor`, `lockcounter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store factor configurations for users';

CREATE TABLE `mdl_tool_mfa_auth` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'User id',
    `lastverified` BIGINT NOT NULL DEFAULT 0 COMMENT 'Timestamp of last MFA verification.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tool_mfa_auth_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the last time a successful MFA auth was registered for a userid';

CREATE TABLE `mdl_tool_mfa_secrets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `factor` VARCHAR(100) NOT NULL,
    `secret` VARCHAR(1333) NOT NULL,
    `timecreated` BIGINT NOT NULL,
    `expiry` BIGINT NOT NULL,
    `revoked` TINYINT NOT NULL DEFAULT 0,
    `sessionid` VARCHAR(100) NULL,
    PRIMARY KEY (`id`),
    KEY `factor` (`factor`),
    KEY `expiry` (`expiry`),
    CONSTRAINT `mdl_tool_mfa_secrets_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store factor secrets';

CREATE TABLE `mdl_tool_monitor_events` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `eventname` VARCHAR(254) NOT NULL COMMENT 'Event name',
    `contextid` BIGINT NOT NULL COMMENT 'Context id',
    `contextlevel` BIGINT NOT NULL COMMENT 'Context level',
    `contextinstanceid` BIGINT NOT NULL COMMENT 'Context instance id',
    `link` VARCHAR(254) NOT NULL COMMENT 'Link to the event location',
    `courseid` BIGINT NOT NULL COMMENT 'course id',
    `timecreated` BIGINT NOT NULL COMMENT 'Time created',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tool_monitor_events_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`),
    CONSTRAINT `mdl_tool_monitor_events_contextid_fk` FOREIGN KEY (`contextid`) REFERENCES `mdl_context` (`id`),
    CONSTRAINT `mdl_tool_monitor_events_contextinstanceid_fk` FOREIGN KEY (`contextinstanceid`) REFERENCES `mdl_context` (`instanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A table that keeps a log of events related to subscriptions';

CREATE TABLE `mdl_tool_monitor_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `sid` BIGINT NOT NULL COMMENT 'Subscription id',
    `userid` BIGINT NOT NULL COMMENT 'User to whom this notification was sent',
    `timesent` BIGINT NOT NULL COMMENT 'Timestamp of when the message was sent.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `sid_userid_timesent` (`sid`, `userid`, `timesent`),
    CONSTRAINT `mdl_tool_monitor_history_subscrptionid_fk` FOREIGN KEY (`sid`) REFERENCES `mdl_tool_monitor_subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store history of message notifications sent';

CREATE TABLE `mdl_tool_monitor_rules` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `description` LONGTEXT NULL COMMENT 'Description of the rule',
    `descriptionformat` TINYINT NOT NULL COMMENT 'Description format',
    `name` VARCHAR(254) NOT NULL COMMENT 'Name of the rule',
    `userid` BIGINT NOT NULL COMMENT 'Id of user who created the rule',
    `courseid` BIGINT NOT NULL COMMENT 'Id of course to which this rule belongs.',
    `plugin` VARCHAR(254) NOT NULL COMMENT 'Frankenstlye name of the plguin',
    `eventname` VARCHAR(254) NOT NULL COMMENT 'Fully qualified name of the event',
    `template` LONGTEXT NOT NULL COMMENT 'Message template',
    `templateformat` TINYINT NOT NULL COMMENT 'Template format',
    `frequency` SMALLINT NOT NULL COMMENT 'Frequency',
    `timewindow` MEDIUMINT NOT NULL COMMENT 'Time window in seconds',
    `timemodified` BIGINT NOT NULL COMMENT 'Timestamp when this rule was last modified',
    `timecreated` BIGINT NOT NULL COMMENT 'Time stamp of when this rule was created',
    PRIMARY KEY (`id`),
    KEY `courseanduser` (`courseid`, `userid`),
    KEY `eventname` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store rules';

CREATE TABLE `mdl_tool_monitor_subscriptions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL COMMENT 'Course id of the subscription',
    `ruleid` BIGINT NOT NULL COMMENT 'Rule id',
    `cmid` BIGINT NOT NULL COMMENT 'Course module id',
    `userid` BIGINT NOT NULL COMMENT 'User id of the subscriber',
    `timecreated` BIGINT NOT NULL COMMENT 'Timestamp of when this subscription was created',
    `lastnotificationsent` BIGINT NOT NULL DEFAULT 0 COMMENT 'Timestamp of the time when a notification was last sent for this subscription.',
    `inactivedate` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `courseanduser` (`courseid`, `userid`),
    CONSTRAINT `mdl_tool_monitor_subscriptions_rulekey_fk` FOREIGN KEY (`ruleid`) REFERENCES `mdl_tool_monitor_rules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store user subscriptions to various rules';

CREATE TABLE `mdl_tool_policy` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `sortorder` MEDIUMINT NOT NULL DEFAULT 999 COMMENT 'Defines the order in which policies should be presented to users',
    `currentversionid` BIGINT NULL COMMENT 'ID of the current policy version that applies on the site, NULL if the policy does not apply',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tool_policy_fk_currentversionid_fk` FOREIGN KEY (`currentversionid`) REFERENCES `mdl_tool_policy_versions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains the list of policy documents defined on the site.';

CREATE TABLE `mdl_tool_policy_acceptances` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `policyversionid` BIGINT NOT NULL COMMENT 'ID of the policy document version',
    `userid` BIGINT NOT NULL COMMENT 'ID of the user this acceptance is relevant to',
    `status` TINYINT NULL COMMENT 'Acceptance status: 1 - accepted, 0 - not accepted',
    `lang` VARCHAR(30) NOT NULL COMMENT 'Code of the language the user had when the policy document was displayed',
    `usermodified` BIGINT NOT NULL COMMENT 'ID of the user who last modified the acceptance record',
    `timecreated` BIGINT NOT NULL COMMENT 'Timestamp of when the acceptance record was created',
    `timemodified` BIGINT NOT NULL COMMENT 'Timestamp of when the acceptance record was last modified',
    `note` LONGTEXT NULL COMMENT 'Plain text note describing how the actual consent has been obtained if the policy has been accepted on other user''s behalf.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_versionuser` (`policyversionid`, `userid`),
    CONSTRAINT `mdl_tool_policy_acceptances_fk_policyversionid_fk` FOREIGN KEY (`policyversionid`) REFERENCES `mdl_tool_policy_versions` (`id`),
    CONSTRAINT `mdl_tool_policy_acceptances_fk_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_tool_policy_acceptances_fk_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks users accepting the policy versions';

CREATE TABLE `mdl_tool_policy_versions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1333) NOT NULL COMMENT 'Name of the policy document',
    `type` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Type of the policy: 0 - Site policy, 1 - Privacy policy, 2 - Third party policy, 99 - Other',
    `audience` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Who is this policy targeted at: 0 - all users, 1 - logged in users only, 2 - guests only',
    `archived` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Should the version be considered as archived. All non-archived, non-current versions are considered to be drafts.',
    `usermodified` BIGINT NOT NULL COMMENT 'ID of the user who last edited this policy document version.',
    `timecreated` BIGINT NOT NULL COMMENT 'Timestamp of when the policy version was created.',
    `timemodified` BIGINT NOT NULL COMMENT 'Timestamp of when the policy version was last modified.',
    `policyid` BIGINT NOT NULL COMMENT 'ID of the policy document we are version of.',
    `agreementstyle` SMALLINT NOT NULL DEFAULT 0 COMMENT 'How this agreement should flow: 0 - on the consent page, 1 - on a separate page before reaching the consent page.',
    `optional` SMALLINT NOT NULL DEFAULT 0 COMMENT '0 - the policy must be accepted to use the site, 1 - accepting the policy is optional',
    `revision` VARCHAR(1333) NOT NULL COMMENT 'Human readable version of the policy document',
    `summary` LONGTEXT NOT NULL COMMENT 'Policy text summary',
    `summaryformat` SMALLINT NOT NULL COMMENT 'Format of the summary field',
    `content` LONGTEXT NOT NULL COMMENT 'Full policy text',
    `contentformat` SMALLINT NOT NULL COMMENT 'Format of the content field',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_tool_policy_versions_fk_usermodified_fk` FOREIGN KEY (`usermodified`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_tool_policy_versions_fk_policyid_fk` FOREIGN KEY (`policyid`) REFERENCES `mdl_tool_policy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Holds versions of the policy documents';

CREATE TABLE `mdl_tool_recyclebin_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `categoryid` BIGINT NOT NULL,
    `shortname` VARCHAR(255) NOT NULL,
    `fullname` VARCHAR(255) NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `timecreated` (`timecreated`),
    CONSTRAINT `mdl_tool_recyclebin_category_categoryid_fk` FOREIGN KEY (`categoryid`) REFERENCES `mdl_course_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A list of items in the category recycle bin';

CREATE TABLE `mdl_tool_recyclebin_course` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `courseid` BIGINT NOT NULL,
    `section` BIGINT NOT NULL,
    `module` BIGINT NOT NULL,
    `name` VARCHAR(255) NULL,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `timecreated` (`timecreated`),
    CONSTRAINT `mdl_tool_recyclebin_course_courseid_fk` FOREIGN KEY (`courseid`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A list of items in the course recycle bin';

CREATE TABLE `mdl_tool_usertours_steps` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `tourid` BIGINT NOT NULL,
    `title` LONGTEXT NULL COMMENT 'Title of the step',
    `content` LONGTEXT NULL COMMENT 'Content of the user tour - allow for multilang tags',
    `contentformat` SMALLINT NOT NULL DEFAULT 0,
    `targettype` TINYINT NOT NULL COMMENT 'Type of the target (e.g. block, CSS selector, etc.)',
    `targetvalue` LONGTEXT NOT NULL COMMENT 'The value for the specified target type.',
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    `configdata` LONGTEXT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `orderedsteps` (`tourid`, `sortorder`),
    CONSTRAINT `mdl_tool_usertours_steps_tourid-tour_fk` FOREIGN KEY (`tourid`) REFERENCES `mdl_tool_usertours_tours` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Steps in an tour';

CREATE TABLE `mdl_tool_usertours_tours` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'Name of the user tour',
    `description` LONGTEXT NULL,
    `pathmatch` VARCHAR(255) NULL,
    `enabled` TINYINT NOT NULL DEFAULT 0,
    `sortorder` BIGINT NOT NULL DEFAULT 0,
    `endtourlabel` VARCHAR(255) NULL COMMENT 'Custom label for the end tour button',
    `configdata` LONGTEXT NOT NULL,
    `displaystepnumbers` TINYINT NOT NULL DEFAULT 0 COMMENT 'Setting to display step numbers of the tour',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of tours';

CREATE TABLE `mdl_upgrade_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` BIGINT NOT NULL COMMENT 'type: 0==info, 1==notice, 2==error',
    `plugin` VARCHAR(100) NULL,
    `version` VARCHAR(100) NULL COMMENT 'plugin or main version if known',
    `targetversion` VARCHAR(100) NULL COMMENT 'version of plugin or core specified in version.php at the time of upgrade loggging',
    `info` VARCHAR(255) NOT NULL,
    `details` LONGTEXT NULL,
    `backtrace` LONGTEXT NULL,
    `userid` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `timemodified` (`timemodified`),
    KEY `type-timemodified` (`type`, `timemodified`),
    CONSTRAINT `mdl_upgrade_log_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Upgrade logging';

CREATE TABLE `mdl_url` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `intro` LONGTEXT NULL,
    `introformat` SMALLINT NOT NULL DEFAULT 0,
    `externalurl` LONGTEXT NOT NULL,
    `display` SMALLINT NOT NULL DEFAULT 0,
    `displayoptions` LONGTEXT NULL,
    `parameters` LONGTEXT NULL,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='each record is one url resource';

CREATE TABLE `mdl_user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `auth` VARCHAR(20) NOT NULL DEFAULT 'manual',
    `confirmed` TINYINT NOT NULL DEFAULT 0,
    `policyagreed` TINYINT NOT NULL DEFAULT 0,
    `deleted` TINYINT NOT NULL DEFAULT 0,
    `suspended` TINYINT NOT NULL DEFAULT 0 COMMENT 'suspended flag prevents users to log in',
    `mnethostid` BIGINT NOT NULL DEFAULT 0,
    `username` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `idnumber` VARCHAR(255) NOT NULL,
    `firstname` VARCHAR(100) NOT NULL,
    `lastname` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `emailstop` TINYINT NOT NULL DEFAULT 0,
    `phone1` VARCHAR(20) NOT NULL,
    `phone2` VARCHAR(20) NOT NULL,
    `institution` VARCHAR(255) NOT NULL,
    `department` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `city` VARCHAR(120) NOT NULL,
    `country` VARCHAR(2) NOT NULL,
    `lang` VARCHAR(30) NOT NULL DEFAULT 'en',
    `calendartype` VARCHAR(30) NOT NULL DEFAULT 'gregorian',
    `theme` VARCHAR(50) NOT NULL,
    `timezone` VARCHAR(100) NOT NULL DEFAULT 99,
    `firstaccess` BIGINT NOT NULL DEFAULT 0,
    `lastaccess` BIGINT NOT NULL DEFAULT 0,
    `lastlogin` BIGINT NOT NULL DEFAULT 0,
    `currentlogin` BIGINT NOT NULL DEFAULT 0,
    `lastip` VARCHAR(45) NOT NULL,
    `secret` VARCHAR(15) NOT NULL,
    `picture` BIGINT NOT NULL DEFAULT 0 COMMENT '0 means no image uploaded, positive values are revisions thta prevent caching problems, negative values are reserved for future use',
    `description` LONGTEXT NULL,
    `descriptionformat` TINYINT NOT NULL DEFAULT 1,
    `mailformat` TINYINT NOT NULL DEFAULT 1,
    `maildigest` TINYINT NOT NULL DEFAULT 0,
    `maildisplay` TINYINT NOT NULL DEFAULT 2,
    `autosubscribe` TINYINT NOT NULL DEFAULT 1,
    `trackforums` TINYINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `trustbitmask` BIGINT NOT NULL DEFAULT 0,
    `imagealt` VARCHAR(255) NULL COMMENT 'alt tag for user uploaded image',
    `lastnamephonetic` VARCHAR(255) NULL COMMENT 'Last name phonetic',
    `firstnamephonetic` VARCHAR(255) NULL COMMENT 'First name phonetic',
    `middlename` VARCHAR(255) NULL COMMENT 'Middle name',
    `alternatename` VARCHAR(255) NULL COMMENT 'Alternate name - Useful for three-name countries.',
    `moodlenetprofile` VARCHAR(255) NULL COMMENT 'Moodle.net profile information',
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`mnethostid`, `username`),
    KEY `deleted` (`deleted`),
    KEY `confirmed` (`confirmed`),
    KEY `firstname` (`firstname`),
    KEY `lastname` (`lastname`),
    KEY `city` (`city`),
    KEY `country` (`country`),
    KEY `lastaccess` (`lastaccess`),
    KEY `email` (`email`),
    KEY `auth` (`auth`),
    KEY `idnumber` (`idnumber`),
    KEY `firstnamephonetic` (`firstnamephonetic`),
    KEY `lastnamephonetic` (`lastnamephonetic`),
    KEY `middlename` (`middlename`),
    KEY `alternatename` (`alternatename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='One record for each person';

CREATE TABLE `mdl_user_devices` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `appid` VARCHAR(128) NOT NULL COMMENT 'the app id, usually something like com.moodle.moodlemobile',
    `name` VARCHAR(32) NOT NULL COMMENT 'the device name, occam or iPhone etc..',
    `model` VARCHAR(32) NOT NULL COMMENT 'the device model, Nexus 4 or iPad 1,1',
    `platform` VARCHAR(32) NOT NULL COMMENT 'the device platform, Android or iOS etc',
    `version` VARCHAR(32) NOT NULL COMMENT 'The device version, 6.1.2, 4.2.2 etc..',
    `pushid` VARCHAR(255) NOT NULL COMMENT 'the device PUSH token/key/identifier/registration id',
    `uuid` VARCHAR(255) NOT NULL COMMENT 'The device vendor UUID',
    `publickey` LONGTEXT NULL COMMENT 'The app generated public key',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `pushid-userid` (`pushid`, `userid`),
    KEY `uuid-userid` (`uuid`, `userid`),
    CONSTRAINT `mdl_user_devices_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores user''s mobile devices information in order to send PUSH notifications';

CREATE TABLE `mdl_user_enrolments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `status` BIGINT NOT NULL DEFAULT 0 COMMENT '0..9 are system constants, 0 means active participation, see ENROL_PARTICIPATION_* constants, plugins may define own status greater than 10',
    `enrolid` BIGINT NOT NULL,
    `userid` BIGINT NOT NULL,
    `timestart` BIGINT NOT NULL DEFAULT 0,
    `timeend` BIGINT NOT NULL DEFAULT 2147483647,
    `modifierid` BIGINT NOT NULL DEFAULT 0,
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `enrolid-userid` (`enrolid`, `userid`),
    CONSTRAINT `mdl_user_enrolments_enrolid_fk` FOREIGN KEY (`enrolid`) REFERENCES `mdl_enrol` (`id`),
    CONSTRAINT `mdl_user_enrolments_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_user_enrolments_modifierid_fk` FOREIGN KEY (`modifierid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Users participating in courses (aka enrolled users) - everybody who is participating/visible in course, that means both teachers and students';

CREATE TABLE `mdl_user_info_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'Category name',
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'Display order',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Customisable fields categories';

CREATE TABLE `mdl_user_info_data` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id from the user table',
    `fieldid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id from the field table',
    `data` LONGTEXT NOT NULL COMMENT 'Field data',
    `dataformat` TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userfieldidx` (`userid`, `fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data for the customisable user fields';

CREATE TABLE `mdl_user_info_field` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `shortname` VARCHAR(255) NOT NULL DEFAULT 'shortname' COMMENT 'short name for each field',
    `name` LONGTEXT NOT NULL COMMENT 'field name',
    `datatype` VARCHAR(255) NOT NULL COMMENT 'Type of data held in this field',
    `description` LONGTEXT NULL COMMENT 'Description of field',
    `descriptionformat` TINYINT NOT NULL DEFAULT 0,
    `categoryid` BIGINT NOT NULL DEFAULT 0 COMMENT 'id from category table',
    `sortorder` BIGINT NOT NULL DEFAULT 0 COMMENT 'order within the category',
    `required` TINYINT NOT NULL DEFAULT 0 COMMENT 'Field required',
    `locked` TINYINT NOT NULL DEFAULT 0 COMMENT 'Field locked',
    `visible` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Visibility: private, public, hidden',
    `forceunique` TINYINT NOT NULL DEFAULT 0 COMMENT 'should the field contain unique data',
    `signup` TINYINT NOT NULL DEFAULT 0 COMMENT 'display field on signup page',
    `defaultdata` LONGTEXT NULL COMMENT 'Default value for this field',
    `defaultdataformat` TINYINT NOT NULL DEFAULT 0,
    `param1` LONGTEXT NULL COMMENT 'General parameter field',
    `param2` LONGTEXT NULL COMMENT 'General parameter field',
    `param3` LONGTEXT NULL COMMENT 'General parameter field',
    `param4` LONGTEXT NULL COMMENT 'General parameter field',
    `param5` LONGTEXT NULL COMMENT 'General parameter field',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Customisable user profile fields';

CREATE TABLE `mdl_user_lastaccess` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `courseid` BIGINT NOT NULL DEFAULT 0,
    `timeaccess` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-courseid` (`userid`, `courseid`),
    KEY `userid` (`userid`),
    KEY `courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To keep track of course page access times, used in online participants block, and participants list';

CREATE TABLE `mdl_user_password_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL,
    `hash` VARCHAR(255) NOT NULL,
    `timecreated` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_user_password_history_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A rotating log of hashes of previously used passwords for each user.';

CREATE TABLE `mdl_user_password_resets` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL COMMENT 'id of the user account which requester claimed to be',
    `timerequested` BIGINT NOT NULL COMMENT 'The time that the user first requested this password reset',
    `timererequested` BIGINT NOT NULL DEFAULT 0 COMMENT 'The time the user re-requested the password reset.',
    `token` VARCHAR(32) NOT NULL COMMENT 'secret set and emailed to user',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_user_password_resets_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='table tracking password reset confirmation tokens';

CREATE TABLE `mdl_user_preferences` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userid` BIGINT NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `value` VARCHAR(1333) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `userid-name` (`userid`, `name`),
    KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Allows modules to store arbitrary user preferences';

CREATE TABLE `mdl_user_private_key` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `script` VARCHAR(128) NOT NULL COMMENT 'plugin, module - unique identifier',
    `value` VARCHAR(128) NOT NULL COMMENT 'private access key value',
    `userid` BIGINT NOT NULL COMMENT 'owner',
    `instance` BIGINT NULL COMMENT 'optional instance id',
    `iprestriction` VARCHAR(255) NULL COMMENT 'ip restriction',
    `validuntil` BIGINT NULL COMMENT 'timestampt - valid until data',
    `timecreated` BIGINT NULL COMMENT 'created timestamp',
    PRIMARY KEY (`id`),
    KEY `script-value` (`script`, `value`),
    CONSTRAINT `mdl_user_private_key_userid_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='access keys used in cookieless scripts - rss, etc.';

CREATE TABLE `mdl_wiki` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL DEFAULT 0 COMMENT 'Course wiki activity belongs to',
    `name` VARCHAR(255) NOT NULL DEFAULT 'Wiki' COMMENT 'name field for moodle instances',
    `intro` LONGTEXT NULL COMMENT 'General introduction of the wiki activity',
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'Format of the intro field (MOODLE, HTML, MARKDOWN...)',
    `timecreated` BIGINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL DEFAULT 0,
    `firstpagetitle` VARCHAR(255) NOT NULL DEFAULT 'First Page' COMMENT 'Wiki first page''s name',
    `wikimode` VARCHAR(20) NOT NULL DEFAULT 'collaborative' COMMENT 'Wiki mode (individual, collaborative)',
    `defaultformat` VARCHAR(20) NOT NULL DEFAULT 'creole' COMMENT 'Wiki''s default editor',
    `forceformat` TINYINT NOT NULL DEFAULT 1 COMMENT 'Forces the default editor',
    `editbegin` BIGINT NOT NULL DEFAULT 0 COMMENT 'editbegin',
    `editend` BIGINT NULL DEFAULT 0 COMMENT 'editend',
    PRIMARY KEY (`id`),
    KEY `course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores Wiki activity configuration';

CREATE TABLE `mdl_wiki_links` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `subwikiid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Subwiki instance',
    `frompageid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Page id with a link',
    `topageid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Page id that recives a link',
    `tomissingpage` VARCHAR(255) NULL COMMENT 'link to a nonexistent page',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_wiki_links_frompageidfk_fk` FOREIGN KEY (`frompageid`) REFERENCES `mdl_wiki_pages` (`id`),
    CONSTRAINT `mdl_wiki_links_subwikifk_fk` FOREIGN KEY (`subwikiid`) REFERENCES `mdl_wiki_subwikis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Page wiki links';

CREATE TABLE `mdl_wiki_locks` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `pageid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Locked page',
    `sectionname` VARCHAR(255) NULL COMMENT 'locked page section',
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Locking user',
    `lockedat` BIGINT NOT NULL DEFAULT 0 COMMENT 'timestamp',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Manages page locks';

CREATE TABLE `mdl_wiki_pages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `subwikiid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Subwiki instance of this page',
    `title` VARCHAR(255) NOT NULL DEFAULT 'title' COMMENT 'Page name',
    `cachedcontent` LONGTEXT NOT NULL COMMENT 'Cache wiki content',
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'Wiki page creation timestamp',
    `timemodified` BIGINT NOT NULL DEFAULT 0 COMMENT 'page edition timestamp',
    `timerendered` BIGINT NOT NULL DEFAULT 0 COMMENT 'Last render timestamp',
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Edition author',
    `pageviews` BIGINT NOT NULL DEFAULT 0 COMMENT 'Number of page views',
    `readonly` TINYINT NOT NULL DEFAULT 0 COMMENT 'Read only flag',
    PRIMARY KEY (`id`),
    UNIQUE KEY `subwikititleuser` (`subwikiid`, `title`, `userid`),
    CONSTRAINT `mdl_wiki_pages_subwikifk_fk` FOREIGN KEY (`subwikiid`) REFERENCES `mdl_wiki_subwikis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores wiki pages';

CREATE TABLE `mdl_wiki_subwikis` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `wikiid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Wiki activity',
    `groupid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Group that owns this wiki',
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Owner of that subwiki',
    PRIMARY KEY (`id`),
    UNIQUE KEY `wikiidgroupiduserid` (`wikiid`, `groupid`, `userid`),
    CONSTRAINT `mdl_wiki_subwikis_wikifk_fk` FOREIGN KEY (`wikiid`) REFERENCES `mdl_wiki` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores subwiki instances';

CREATE TABLE `mdl_wiki_synonyms` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `subwikiid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Subwiki instance',
    `pageid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Original page',
    `pagesynonym` VARCHAR(255) NOT NULL DEFAULT 'Pagesynonym' COMMENT 'Page name synonym',
    PRIMARY KEY (`id`),
    UNIQUE KEY `pageidsyn` (`pageid`, `pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores wiki pages synonyms';

CREATE TABLE `mdl_wiki_versions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `pageid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Page id',
    `content` LONGTEXT NOT NULL COMMENT 'Not parsed wiki content',
    `contentformat` VARCHAR(20) NOT NULL DEFAULT 'creole' COMMENT 'Markup used to write content',
    `version` MEDIUMINT NOT NULL DEFAULT 0 COMMENT 'Wiki page version',
    `timecreated` BIGINT NOT NULL DEFAULT 0 COMMENT 'Page edition timestamp',
    `userid` BIGINT NOT NULL DEFAULT 0 COMMENT 'Edition autor',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_wiki_versions_pagefk_fk` FOREIGN KEY (`pageid`) REFERENCES `mdl_wiki_pages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores wiki page history';

CREATE TABLE `mdl_workshop` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `course` BIGINT NOT NULL COMMENT 'ID of the parent course',
    `name` VARCHAR(255) NOT NULL COMMENT 'Name of the activity',
    `intro` LONGTEXT NULL COMMENT 'The introduction or description of the activity',
    `introformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of the intro field',
    `instructauthors` LONGTEXT NULL COMMENT 'Instructions for the submission phase',
    `instructauthorsformat` SMALLINT NOT NULL DEFAULT 0,
    `instructreviewers` LONGTEXT NULL COMMENT 'Instructions for the assessment phase',
    `instructreviewersformat` SMALLINT NOT NULL DEFAULT 0,
    `timemodified` BIGINT NOT NULL COMMENT 'The timestamp when the module was modified',
    `phase` SMALLINT NULL DEFAULT 0 COMMENT 'The current phase of workshop (0 = not available, 1 = submission, 2 = assessment, 3 = closed)',
    `useexamples` TINYINT NULL DEFAULT 0 COMMENT 'optional feature: students practise evaluating on example submissions from teacher',
    `usepeerassessment` TINYINT NULL DEFAULT 0 COMMENT 'optional feature: students perform peer assessment of others'' work',
    `useselfassessment` TINYINT NULL DEFAULT 0 COMMENT 'optional feature: students perform self assessment of their own work',
    `grade` DECIMAL(10,5) NULL DEFAULT 80 COMMENT 'The maximum grade for submission',
    `gradinggrade` DECIMAL(10,5) NULL DEFAULT 20 COMMENT 'The maximum grade for assessment',
    `strategy` VARCHAR(30) NOT NULL COMMENT 'The type of the current grading strategy used in this workshop',
    `evaluation` VARCHAR(30) NOT NULL COMMENT 'The recently used grading evaluation method',
    `gradedecimals` SMALLINT NULL DEFAULT 0 COMMENT 'Number of digits that should be shown after the decimal point when displaying grades',
    `submissiontypetext` TINYINT NOT NULL DEFAULT 1 COMMENT 'Can students enter text for their submissions? 0 for no, 1 for optional, 2 for required.',
    `submissiontypefile` TINYINT NOT NULL DEFAULT 1 COMMENT 'Can students attach files for their submissions? 0 for no, 1 for optional, 2 for required.',
    `nattachments` SMALLINT NULL DEFAULT 1 COMMENT 'Maximum number of submission attachments',
    `submissionfiletypes` VARCHAR(255) NULL COMMENT 'comma separated list of file extensions',
    `latesubmissions` TINYINT NULL DEFAULT 0 COMMENT 'Allow submitting the work after the deadline',
    `maxbytes` BIGINT NULL DEFAULT 100000 COMMENT 'Maximum size of the one attached file',
    `examplesmode` SMALLINT NULL DEFAULT 0 COMMENT '0 = example assessments are voluntary, 1 = examples must be assessed before submission, 2 = examples are available after own submission and must be assessed before peer/self assessment phase',
    `submissionstart` BIGINT NULL DEFAULT 0 COMMENT '0 = will be started manually, greater than 0 the timestamp of the start of the submission phase',
    `submissionend` BIGINT NULL DEFAULT 0 COMMENT '0 = will be closed manually, greater than 0 the timestamp of the end of the submission phase',
    `assessmentstart` BIGINT NULL DEFAULT 0 COMMENT '0 = will be started manually, greater than 0 the timestamp of the start of the assessment phase',
    `assessmentend` BIGINT NULL DEFAULT 0 COMMENT '0 = will be closed manually, greater than 0 the timestamp of the end of the assessment phase',
    `phaseswitchassessment` TINYINT NOT NULL DEFAULT 0 COMMENT 'Automatically switch to the assessment phase after the submissions deadline',
    `conclusion` LONGTEXT NULL COMMENT 'A text to be displayed at the end of the workshop.',
    `conclusionformat` SMALLINT NOT NULL DEFAULT 1 COMMENT 'The format of the conclusion field content.',
    `overallfeedbackmode` SMALLINT NULL DEFAULT 1 COMMENT 'Mode of the overall feedback support.',
    `overallfeedbackfiles` SMALLINT NULL DEFAULT 0 COMMENT 'Number of allowed attachments to the overall feedback.',
    `overallfeedbackfiletypes` VARCHAR(255) NULL COMMENT 'comma separated list of file extensions',
    `overallfeedbackmaxbytes` BIGINT NULL DEFAULT 100000 COMMENT 'Maximum size of one file attached to the overall feedback.',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshop_course_fk_fk` FOREIGN KEY (`course`) REFERENCES `mdl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table keeps information about the module instances and their settings';

CREATE TABLE `mdl_workshop_aggregations` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'the id of the workshop instance',
    `userid` BIGINT NOT NULL COMMENT 'The id of the user which aggregated grades are calculated for',
    `gradinggrade` DECIMAL(10,5) NULL COMMENT 'The aggregated grade for all assessments made by this reviewer. The grade is a number from interval 0..100. If NULL then the grade for assessments has not been aggregated yet.',
    `timegraded` BIGINT NULL COMMENT 'The timestamp of when the participant''s gradinggrade was recently aggregated.',
    PRIMARY KEY (`id`),
    UNIQUE KEY `workshopuser` (`workshopid`, `userid`),
    CONSTRAINT `mdl_workshop_aggregations_workshop_fk_fk` FOREIGN KEY (`workshopid`) REFERENCES `mdl_workshop` (`id`),
    CONSTRAINT `mdl_workshop_aggregations_user_fk_fk` FOREIGN KEY (`userid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Aggregated grades for assessment are stored here. The aggregated grade for submission is stored in workshop_submissions';

CREATE TABLE `mdl_workshop_assessments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `submissionid` BIGINT NOT NULL COMMENT 'The id of the assessed submission',
    `reviewerid` BIGINT NOT NULL COMMENT 'The id of the reviewer who makes this assessment',
    `weight` BIGINT NOT NULL DEFAULT 1 COMMENT 'The weight of the assessment for the purposes of aggregation',
    `timecreated` BIGINT NULL DEFAULT 0 COMMENT 'If 0 then the assessment was allocated but the reviewer has not assessed yet. If greater than 0 then the timestamp of when the reviewer assessed for the first time',
    `timemodified` BIGINT NULL DEFAULT 0 COMMENT 'If 0 then the assessment was allocated but the reviewer has not assessed yet. If greater than 0 then the timestamp of when the reviewer assessed for the last time',
    `grade` DECIMAL(10,5) NULL COMMENT 'The aggregated grade for submission suggested by the reviewer. The grade 0..100 is computed from the values assigned to the assessment dimensions fields. If NULL then it has not been aggregated yet.',
    `gradinggrade` DECIMAL(10,5) NULL COMMENT 'The computed grade 0..100 for this assessment. If NULL then it has not been computed yet.',
    `gradinggradeover` DECIMAL(10,5) NULL COMMENT 'Grade for the assessment manually overridden by a teacher. Grade is always from interval 0..100. If NULL then the grade is not overriden.',
    `gradinggradeoverby` BIGINT NULL COMMENT 'The id of the user who has overridden the grade for submission.',
    `feedbackauthor` LONGTEXT NULL COMMENT 'The comment/feedback from the reviewer for the author.',
    `feedbackauthorformat` SMALLINT NULL DEFAULT 0,
    `feedbackauthorattachment` SMALLINT NULL DEFAULT 0 COMMENT 'Are there some files attached to the feedbackauthor field? Sets to 1 by file_postupdate_standard_filemanager().',
    `feedbackreviewer` LONGTEXT NULL COMMENT 'The comment/feedback from the teacher for the reviewer. For example the reason why the grade for assessment was overridden',
    `feedbackreviewerformat` SMALLINT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshop_assessments_submission_fk_fk` FOREIGN KEY (`submissionid`) REFERENCES `mdl_workshop_submissions` (`id`),
    CONSTRAINT `mdl_workshop_assessments_overriddenby_fk_fk` FOREIGN KEY (`gradinggradeoverby`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_workshop_assessments_reviewer_fk_fk` FOREIGN KEY (`reviewerid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about the made assessment and automatically calculated grade for it. The proposed grade can be overridden by teacher.';

CREATE TABLE `mdl_workshop_grades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `assessmentid` BIGINT NOT NULL COMMENT 'Part of which assessment this grade is of',
    `strategy` VARCHAR(30) NOT NULL,
    `dimensionid` BIGINT NOT NULL COMMENT 'Foreign key. References dimension id in one of the grading strategy tables.',
    `grade` DECIMAL(10,5) NULL COMMENT 'Given grade in the referenced assessment dimension.',
    `peercomment` LONGTEXT NULL COMMENT 'Reviewer''s comment to the grade value.',
    `peercommentformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of peercomment field',
    PRIMARY KEY (`id`),
    UNIQUE KEY `formfield_uk` (`assessmentid`, `strategy`, `dimensionid`),
    CONSTRAINT `mdl_workshop_grades_assessment_fk_fk` FOREIGN KEY (`assessmentid`) REFERENCES `mdl_workshop_assessments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='How the reviewers filled-up the grading forms, given grades and comments';

CREATE TABLE `mdl_workshop_submissions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'the id of the workshop instance',
    `example` TINYINT NULL DEFAULT 0 COMMENT 'Is this submission an example from teacher',
    `authorid` BIGINT NOT NULL COMMENT 'The author of the submission',
    `timecreated` BIGINT NOT NULL COMMENT 'Timestamp when the work was submitted for the first time',
    `timemodified` BIGINT NOT NULL COMMENT 'Timestamp when the submission has been updated',
    `title` VARCHAR(255) NOT NULL COMMENT 'The submission title',
    `content` LONGTEXT NULL COMMENT 'Submission text',
    `contentformat` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The format of submission text',
    `contenttrust` SMALLINT NOT NULL DEFAULT 0 COMMENT 'The trust mode of the data',
    `attachment` TINYINT NULL DEFAULT 0 COMMENT 'Used by File API file_postupdate_standard_filemanager',
    `grade` DECIMAL(10,5) NULL COMMENT 'Aggregated grade for the submission. The grade is a decimal number from interval 0..100. If NULL then the grade for submission has not been aggregated yet.',
    `gradeover` DECIMAL(10,5) NULL COMMENT 'Grade for the submission manually overridden by a teacher. Grade is always from interval 0..100. If NULL then the grade is not overriden.',
    `gradeoverby` BIGINT NULL COMMENT 'The id of the user who has overridden the grade for submission.',
    `feedbackauthor` LONGTEXT NULL COMMENT 'Teacher comment/feedback for the author of the submission, for example describing the reasons for the grade overriding',
    `feedbackauthorformat` SMALLINT NULL DEFAULT 0,
    `timegraded` BIGINT NULL COMMENT 'The timestamp when grade or gradeover was recently modified',
    `published` TINYINT NULL DEFAULT 0 COMMENT 'Shall the submission be available to other when the workshop is closed',
    `late` TINYINT NOT NULL DEFAULT 0 COMMENT 'Has this submission been submitted after the deadline or during the assessment phase?',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshop_submissions_workshop_fk_fk` FOREIGN KEY (`workshopid`) REFERENCES `mdl_workshop` (`id`),
    CONSTRAINT `mdl_workshop_submissions_overriddenby_fk_fk` FOREIGN KEY (`gradeoverby`) REFERENCES `mdl_user` (`id`),
    CONSTRAINT `mdl_workshop_submissions_author_fk_fk` FOREIGN KEY (`authorid`) REFERENCES `mdl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about the submission and the aggregation of the grade for submission, grade for assessment and final grade. Both grade for submission and grade for assessment can be overridden by teacher. Final grade is always the sum of them. All grades are stored as of 0-100.';

CREATE TABLE `mdl_workshopallocation_scheduled` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'workshop id we are part of',
    `enabled` TINYINT NOT NULL DEFAULT 0 COMMENT 'Is the scheduled allocation enabled',
    `submissionend` BIGINT NOT NULL COMMENT 'What was the workshop''s submissionend when this record was created or modified',
    `timeallocated` BIGINT NULL COMMENT 'When was the last scheduled allocation executed',
    `settings` LONGTEXT NULL COMMENT 'The pre-defined settings for the underlying random allocation to run it with',
    `resultstatus` BIGINT NULL COMMENT 'The resulting status of the most recent execution',
    `resultmessage` VARCHAR(1333) NULL COMMENT 'Optional short message describing the resulting status',
    `resultlog` LONGTEXT NULL COMMENT 'The log of the most recent execution',
    PRIMARY KEY (`id`),
    KEY `fkuq_workshopid` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the allocation settings for the scheduled allocator';

CREATE TABLE `mdl_workshopeval_best_settings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL,
    `comparison` SMALLINT NULL DEFAULT 5 COMMENT 'Here we store the recently set factor of comparison of assessment in the given workshop. Reasonable values are from 1 to 10 or so. Default to 5.',
    PRIMARY KEY (`id`),
    KEY `fkuq_workshop` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Settings for the grading evaluation subplugin Comparison with the best assessment.';

CREATE TABLE `mdl_workshopform_accumulative` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'Workshop ID',
    `sort` BIGINT NULL DEFAULT 0 COMMENT 'Defines the dimension order within the assessment form',
    `description` LONGTEXT NULL COMMENT 'The description of the dimension',
    `descriptionformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of the description field',
    `grade` BIGINT NOT NULL COMMENT 'If greater than 0, then the value is maximum grade on a scale 0..grade. If lesser than 0, then its absolute value is the id of a record in scale table. If equals 0, then no grading is possible for this dimension, just commenting.',
    `weight` MEDIUMINT NULL DEFAULT 1 COMMENT 'The weigh of the dimension',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshopform_accumulative_workshop_fk_fk` FOREIGN KEY (`workshopid`) REFERENCES `mdl_workshop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The assessment dimensions definitions of Accumulative grading strategy forms';

CREATE TABLE `mdl_workshopform_comments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'Workshop ID',
    `sort` BIGINT NULL DEFAULT 0 COMMENT 'Defines the dimension order within the assessment form',
    `description` LONGTEXT NULL COMMENT 'The description of the dimension',
    `descriptionformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of the description field',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshopform_comments_workshop_fk_fk` FOREIGN KEY (`workshopid`) REFERENCES `mdl_workshop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The assessment dimensions definitions of Comments strategy forms';

CREATE TABLE `mdl_workshopform_numerrors` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'Workshop ID',
    `sort` BIGINT NULL DEFAULT 0 COMMENT 'Defines the dimension order within the assessment form',
    `description` LONGTEXT NULL COMMENT 'The description of the dimension',
    `descriptionformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of the description field',
    `descriptiontrust` BIGINT NULL,
    `grade0` VARCHAR(50) NULL COMMENT 'The word describing the negative evaluation (like Poor, Missing, Absent, etc.). If NULL, it defaults to a translated string False',
    `grade1` VARCHAR(50) NULL COMMENT 'A word for possitive evaluation (like Good, Present, OK etc). If NULL, it defaults to a translated string True',
    `weight` MEDIUMINT NULL DEFAULT 1 COMMENT 'Weight of this dimension',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshopform_numerrors_workshop_fk_fk` FOREIGN KEY (`workshopid`) REFERENCES `mdl_workshop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The assessment dimensions definitions of Number of errors grading strategy forms';

CREATE TABLE `mdl_workshopform_numerrors_map` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'The id of the workshop',
    `nonegative` BIGINT NOT NULL COMMENT 'Number of negative responses given by the reviewer',
    `grade` DECIMAL(10,5) NOT NULL COMMENT 'Percentual grade 0..100 for this number of negative responses',
    PRIMARY KEY (`id`),
    UNIQUE KEY `nonegative_uq` (`workshopid`, `nonegative`),
    CONSTRAINT `mdl_workshopform_numerrors_map_workshop_fk_fk` FOREIGN KEY (`workshopid`) REFERENCES `mdl_workshop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This maps the number of errors to a percentual grade for submission';

CREATE TABLE `mdl_workshopform_rubric` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'Workshop ID',
    `sort` BIGINT NULL DEFAULT 0 COMMENT 'Defines the dimension order within the assessment form',
    `description` LONGTEXT NULL COMMENT 'The description of the dimension',
    `descriptionformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of the description field',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshopform_rubric_workshop_fk_fk` FOREIGN KEY (`workshopid`) REFERENCES `mdl_workshop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The assessment dimensions definitions of Rubric grading strategy forms';

CREATE TABLE `mdl_workshopform_rubric_config` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workshopid` BIGINT NOT NULL COMMENT 'The id of workshop this configuartion applies for',
    `layout` VARCHAR(30) NULL DEFAULT 'list' COMMENT 'How should the rubric be displayed for reviewers',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uqfk_workshop` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Configuration table for the Rubric grading strategy';

CREATE TABLE `mdl_workshopform_rubric_levels` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `dimensionid` BIGINT NOT NULL COMMENT 'Which criterion this level is part of',
    `grade` DECIMAL(10,5) NOT NULL COMMENT 'Grade representing this level.',
    `definition` LONGTEXT NULL COMMENT 'The definition of this level',
    `definitionformat` SMALLINT NULL DEFAULT 0 COMMENT 'The format of the definition field',
    PRIMARY KEY (`id`),
    CONSTRAINT `mdl_workshopform_rubric_levels_dimension_fk_fk` FOREIGN KEY (`dimensionid`) REFERENCES `mdl_workshopform_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The definition of rubric rating scales';

CREATE TABLE `mdl_xapi_states` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `component` VARCHAR(255) NOT NULL COMMENT 'The component name',
    `userid` BIGINT NULL,
    `itemid` BIGINT NOT NULL COMMENT 'The Agent Id (usually the plugin instance)',
    `stateid` VARCHAR(255) NOT NULL COMMENT 'Component identified for the state data',
    `statedata` LONGTEXT NULL COMMENT 'JSON state data',
    `registration` VARCHAR(255) NULL COMMENT 'Optional registration identifier',
    `timecreated` BIGINT NOT NULL,
    `timemodified` BIGINT NULL,
    PRIMARY KEY (`id`),
    KEY `component-itemid` (`component`, `itemid`),
    KEY `userid` (`userid`),
    KEY `timemodified` (`timemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The stored xAPI states';
