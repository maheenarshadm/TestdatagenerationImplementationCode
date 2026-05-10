--
-- =============================================================

PRAGMA foreign_keys = ON;


-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT1_EnrolmentValidity                                   ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: enrol_ACTIVE_FULL
-- DT:   DT1_EnrolmentValidity
-- Triggered: True
-- Derived attribute values when triggered:
--   courseVisible = 1.0
--   daysSinceEnrolment = 30.0
--   daysUntilEnrolExpiry = 59.0
--   enrolPeriodDays = 120.0
--   enrolStatus = 0.0
--   moduleCompletionCount = 3.0
--   moduleCompletionPct = 100.0
--   timecompleted = 0.0
--   userConfirmed = 1.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 1, 1649795257, 1717691309, 1714883715, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1718292881, 1767460294, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 10368000, 1745188564, 1753818146, 0, 0, 5);

-- mdl_course_modules (3 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 0, 2, 427000596, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 1, 1, 0, 964669077, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 1, 1, 0, 1629526405, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1772418087, 1780194087, 0, 0, 0);

-- mdl_course_modules_completion (3 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: enrol_ACTIVE_EXPIRING
-- DT:   DT1_EnrolmentValidity
-- Triggered: True
-- Derived attribute values when triggered:
--   courseVisible = 1.0
--   daysSinceEnrolment = 20.0
--   daysUntilEnrolExpiry = 14.0
--   enrolPeriodDays = 626.0
--   enrolStatus = 0.0
--   moduleCompletionCount = 2.0
--   moduleCompletionPct = 66.67
--   timecompleted = 0.0
--   userConfirmed = 1.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 0, 1674411511, 1713631207, 1713313634, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1702756298, 1762228077, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 54165461, 1743502628, 1788117071, 0, 0, 5);

-- mdl_course_modules (3 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 1185498232, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 1, 1, 2, 1328261053, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 1, 1, 2, 412936598, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1773282087, 1776306087, 0, 0, 0);

-- mdl_course_modules_completion (3 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: enrol_SUSPENDED_ADMIN
-- DT:   DT1_EnrolmentValidity
-- Triggered: True
-- Derived attribute values when triggered:
--   courseVisible = 1.0
--   daysSinceEnrolment = 10.0
--   daysUntilEnrolExpiry = 483.0
--   enrolPeriodDays = 162.0
--   enrolStatus = 1.0
--   moduleCompletionCount = 2.0
--   moduleCompletionPct = 66.67
--   timecompleted = 0.0
--   userConfirmed = 1.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 0, 1611169965, 1722956519, 1719528846, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 1, 1689581131, 1763988024, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 14059778, 1764532021, 1757062178, 0, 0, 5);

-- mdl_course_modules (3 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 0, 2, 1565787882, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 1, 0, 0, 992696249, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 1, 1, 1, 1374389012, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1774146087, 1816798145, 0, 0, 0);

-- mdl_course_modules_completion (3 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: enrol_EXPIRED_NO_COMPLETION
-- DT:   DT1_EnrolmentValidity
-- Triggered: True
-- Derived attribute values when triggered:
--   courseVisible = 0.0
--   daysSinceEnrolment = 60.0
--   daysUntilEnrolExpiry = -30.0
--   enrolPeriodDays = 687.0
--   enrolStatus = 1.0
--   moduleCompletionCount = 0.0
--   moduleCompletionPct = 0.0
--   timecompleted = 0.0
--   userConfirmed = 1.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 1, 1691744453, 1719185493, 1712422521, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1692934725, 1772648442, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 59370081, 1772731798, 1782286658, 0, 0, 5);

-- mdl_course_modules (3 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 0, 0, 1599851660, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 1, 1, 2, 1255388860, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 1, 1, 2, 857706059, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1769826087, 1772342036, 0, 0, 0);

-- mdl_course_modules_completion (3 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);

-- UNCOVERED: enrol_PENDING_UNCONFIRMED  (see header for reason)

-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT2_AssignmentCompleteness                              ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: assign_INCOMPLETE_RESUBMITTING
-- DT:   DT2_AssignmentCompleteness
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   avgAssignGrade = 0.0
--   daysSinceEnrolment = 209.0
--   maxAttemptNumber = 3.0
--   overriddenGradeCount = 0.0
--   submittedLate = 0.0
--   submittedOnTime = 1.0
--   totalAssignments = 4.0
--   unsubmittedCount = 3.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 0, 1635116414, 1728196363, 1725254572, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1690979273, 1757838448, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 16764226, 1771387553, 1801104905, 0, 0, 5);

-- mdl_assign (4 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1770104749, 1772558971, 100, 7, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1770462728, 1774859313, 100, 2, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1773089632, 1771162237, 100, 6, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (4, 1, 'Assignment 4', 0, 1776933597, 1770452553, 100, -1, 0, '', 1, 0, 0, 0, 0);

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 75.14, 8.53, 43.15, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_course_modules (4 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 407802566, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 125591915, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 2, 673461213, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 0, 1254511837, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1756913674, 1828410928, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 3, 1, 1770018349, 1772354864, 0);

-- mdl_assign_grades (1 row)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 0, 7, 1719772975, 1724395375);

-- mdl_grade_grades (1 row)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 85.13, 6.85, 0, 0, 1, 0, 0, '', 0.0, '2026-03-02', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: assign_NON_SUBMISSION_RISK
-- DT:   DT2_AssignmentCompleteness
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   avgAssignGrade = 35.0
--   daysSinceEnrolment = 30.0
--   maxAttemptNumber = 2.0
--   overriddenGradeCount = 1.0
--   submittedLate = 0.0
--   submittedOnTime = 0.0
--   totalAssignments = 4.0
--   unsubmittedCount = 4.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 0, 1696592430, 1732259383, 1729786392, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 1, 1692373202, 1760230122, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 17825088, 1755325043, 1747928692, 0, 0, 5);

-- mdl_assign (4 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1769758527, 1770932761, 100, 8, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1770294939, 1771598388, 100, 2, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1770791510, 1774917131, 100, 4, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (4, 1, 'Assignment 4', 0, 1777056237, 1769137590, 100, 4, 0, '', 1, 0, 0, 0, 0);

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 0, 63.62, 6.05, 54.35, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_course_modules (4 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 2, 1190999339, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 222450317, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 247881174, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 1188038731, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1772418087, 1795403766, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'new', 2, 0, 1769672127, 1774918359, 0);

-- mdl_assign_grades (1 row)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 35.0, 9, 1737283380, 1732145403);

-- mdl_grade_grades (1 row)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 68.75, 85.29, 1, 1, 0, 0, 0, '', 0.0, '2026-03-09', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- UNCOVERED: assign_FULLY_COMPLIANT  (see header for reason)

-- UNCOVERED: assign_LATE_PASS  (see header for reason)

-- UNCOVERED: assign_GRADE_OVERRIDE_REVIEW  (see header for reason)

-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT3_QuizPerformanceBand                                 ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: quiz_MASTERY
-- DT:   DT3_QuizPerformanceBand
-- Triggered: True
-- Derived attribute values when triggered:
--   avgQuizScore = 80.0
--   daysSinceEnrolment = 71.0
--   moduleCompletionCount = 5.0
--   quizAttemptCount = 3.0
--   quizMaxAllowed = 5.0
--   quizPassCount = 3.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 0, 1616105645, 1735453563, 1723081675, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 0, 1720578709, 1759640401, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 37268849, 1750176690, 1766053127, 0, 0, 5);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 5, 100.0, 100.0, 1685591694, 1743281485, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 52.78, 1.01, 55.96, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 920353259, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 766406787, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 1613974421, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 414242824, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 0, 1593681084, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 1, 363657768, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 1715056397, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 0, 733646411, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 2, 307045319, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1768819842, 1814055755, 0, 0, 0);

-- mdl_quiz_attempts (4 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 5, 'inprogress', 4, 1769846293, 1737150161, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 5, 'finished', 80.0, 1759805758, 1735332513, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 4, 'finished', 80.0, 1763593450, 1738426497, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (4, 1, 1, 3, 'finished', 80.0, 1769982404, 1739187003, 0, '', 0, 0);

-- mdl_grade_grades (1 row)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 44.75, 28.5, 0, 0, 0, 0, 0, '', 0.0, '2026-01-29', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: quiz_PASS_WITH_RETRIES
-- DT:   DT3_QuizPerformanceBand
-- Triggered: True
-- Derived attribute values when triggered:
--   avgQuizScore = 73.85
--   daysSinceEnrolment = 358.0
--   moduleCompletionCount = 3.0
--   quizAttemptCount = 4.0
--   quizMaxAllowed = 8.0
--   quizPassCount = 4.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 0, 1709145070, 1738412775, 1712573138, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1696791574, 1769696464, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 37116837, 1750498991, 1759259830, 0, 0, 5);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 8, 100.0, 100.0, 1731587247, 1742200037, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 0, 64.55, 5.33, 40.24, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 2, 1565285288, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 1033882942, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 1437491667, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 0, 954832707, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 2, 1677144103, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 1, 963751866, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 1027690016, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 0, 1415722270, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 2, 25724160, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1744076020, 1832239685, 0, 0, 0);

-- mdl_quiz_attempts (4 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 5, 'finished', 73.95, 1760162710, 1718765568, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 5, 'finished', 47.47, 1765864483, 1719261357, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 2, 'finished', 88.72, 1771521331, 1729686027, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (4, 1, 1, 5, 'finished', 85.27, 1768900603, 1733835749, 0, '', 0, 0);

-- mdl_grade_grades (1 row)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 21.26, 6.87, 0, 0, 0, 0, 0, '', 0.0, '2025-10-18', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: quiz_ATTEMPTS_EXHAUSTED_FAIL
-- DT:   DT3_QuizPerformanceBand
-- Triggered: True
-- Derived attribute values when triggered:
--   avgQuizScore = 30.0
--   daysSinceEnrolment = 149.0
--   moduleCompletionCount = 6.0
--   quizAttemptCount = 4.0
--   quizMaxAllowed = 3.0
--   quizPassCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 1, 0, 1585009388, 1721393900, 1736076067, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1689509182, 1768796679, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 38962717, 1750952247, 1741712997, 0, 0, 5);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 3, 100.0, 100.0, 1726022140, 1742733297, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 0, 94.95, 2.1, 44.99, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 53228317, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 713362851, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 2, 1578524038, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 341874760, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 83160453, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 0, 428579384, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 655392397, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 0, 50818989, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 1, 704937174, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1762062283, 1803348554, 0, 0, 0);

-- mdl_quiz_attempts (4 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 1, 'finished', 30.0, 1772844740, 1733388370, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 2, 'finished', 30.0, 1772030854, 1722590432, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 5, 'finished', 30.0, 1765239298, 1714477962, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (4, 1, 1, 1, 'finished', 30.0, 1773111080, 1741510838, 0, '', 0, 0);

-- mdl_grade_grades (1 row)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 35.37, 55.99, 1, 0, 0, 0, 0, '', 0.0, '2026-02-19', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: quiz_SINGLE_ATTEMPT_FAIL
-- DT:   DT3_QuizPerformanceBand
-- Triggered: True
-- Derived attribute values when triggered:
--   avgQuizScore = 25.0
--   daysSinceEnrolment = 172.0
--   moduleCompletionCount = 5.0
--   quizAttemptCount = 1.0
--   quizMaxAllowed = 3.0
--   quizPassCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 1, 1597537994, 1728905034, 1718563306, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1687613835, 1770327279, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 20039555, 1767327103, 1765317160, 0, 0, 5);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 3, 100.0, 100.0, 1716174441, 1744140616, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 2, 71.34, 9.07, 48.92, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 2, 513776588, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 1, 166394235, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 583503756, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 1159968067, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 0, 323906379, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 1, 1490245880, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 2, 459460310, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 875312989, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 2, 1000564829, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1760104359, 1824350401, 0, 0, 0);

-- mdl_quiz_attempts (1 row)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 4, 'finished', 25.0, 1770096088, 1740132834, 0, '', 0, 0);

-- mdl_grade_grades (1 row)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 74.37, 47.47, 1, 0, 1, 0, 0, '', 0.0, '2025-11-19', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: quiz_NOT_ATTEMPTED
-- DT:   DT3_QuizPerformanceBand
-- Triggered: True
-- Derived attribute values when triggered:
--   avgQuizScore = 0.0
--   daysSinceEnrolment = 20.0
--   moduleCompletionCount = 3.0
--   quizAttemptCount = 0.0
--   quizMaxAllowed = 3.0
--   quizPassCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 1, 0, 1604457748, 1730069107, 1733374774, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 0, 1725453430, 1759384471, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 16197130, 1766206370, 1766420529, 0, 0, 5);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 3, 100.0, 100.0, 1732099503, 1743892986, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 76.64, 6.62, 41.38, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 2, 328545991, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 1575813409, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 2, 1735594600, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 935389095, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 527196854, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 1, 968089926, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 1223742795, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 61632768, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 1, 390498115, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1773282087, 1825065042, 0, 0, 0);

-- mdl_grade_grades (1 row)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 1.27, 42.01, 1, 0, 1, 0, 0, '', 0.0, '2025-12-30', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);

-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT4_CourseCompletionStatus                              ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: completion_AWARDED
-- DT:   DT4_CourseCompletionStatus
-- Triggered: True
-- Derived attribute values when triggered:
--   daysSinceEnrolment = 367.0
--   daysUntilEnrolExpiry = 207.0
--   failedItemCount = 0.0
--   finalGrade = 79.47
--   forumPostCount = 0.0
--   gradePassMark = 59.44
--   moduleCompletionPct = 100.0
--   quizPassCount = 3.0
--   timecompleted = 1773033236.0
--   unsubmittedCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 0, 1733848140, 1732223851, 1731990420, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1713480226, 1765361139, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 12830613, 1762431582, 1773878896, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1770085300, 1768328423, 40, 3, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1770344500, 1774738711, 77, 4, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1769680384, 1771182157, 83, 3, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 7, 100.0, 86, 1706834426, 1742735730, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 0, 99.98, 2.24, 47.51, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 1, 93.82, 1.94, 59.44, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 1, 72.5, 2.04, 46.44, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 858018778, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 799602122, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 1738335108, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 0, 2, 503358698, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 1590432781, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 0, 1, 767450488, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 2, 1599901387, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 0, 2, 689228614, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 0, 2, 1575631938, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 1, 1588177637, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1743229400, 1792959005, 0, 0, 0);

-- mdl_assign_submission (3 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 4, 1, 1771467700, 1766126649, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 0, 0, 1771035700, 1767537553, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 3, 1, 'submitted', 3, 0, 1767581814, 1769690061, 0);

-- mdl_quiz_attempts (4 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 4, 'inprogress', 80.0, 1762932426, 1741737600, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 2, 'finished', 80.0, 1767929027, 1720302924, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 1, 'abandoned', 14.29, 1755455201, 1731553815, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (4, 1, 1, 5, 'finished', 23.19, 1759486247, 1723508803, 0, '', 0, 0);

-- mdl_grade_grades (3 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 87.5, 50.01, 1, 0, 1, 0, 0, '', 0.0, '2026-02-19', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 86.94, 62.12, 1, 1, 1, 0, 0, '', 0.0, '2025-10-27', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 9.46, 79.47, 1, 1, 1, 0, 0, '', 0.0, '2026-02-25', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (1 row)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1765463262, 1774185474, 1, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 1773033236);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1771667633, 1720057947, 1, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1768061852, 1738974470, 0, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 1, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: completion_ELIGIBLE_PENDING
-- DT:   DT4_CourseCompletionStatus
-- Triggered: True
-- Derived attribute values when triggered:
--   daysSinceEnrolment = 59.0
--   daysUntilEnrolExpiry = 601.0
--   failedItemCount = 2.0
--   finalGrade = 96.52
--   forumPostCount = 0.0
--   gradePassMark = 63.83
--   moduleCompletionPct = 90.0
--   quizPassCount = 3.0
--   timecompleted = 0.0
--   unsubmittedCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 1, 1611968923, 1736034437, 1729390071, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 0, 1693867184, 1748791705, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 20966279, 1758785478, 1760747192, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1777355687, 1771380202, 98, 6, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1774844282, 1771079045, 100, 3, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1774793784, 1768378123, 100, 7, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 2, 91.69, 100.0, 1739154603, 1742464800, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 82.83, 0.61, 63.83, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 2, 62.38, 0.76, 58.16, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 50.47, 8.75, 46.27, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 0, 2, 906086541, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 1666930800, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 0, 1, 849232496, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 0, 2, 1154487471, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 2, 511988880, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 713938667, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 1184368419, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 0, 2, 1436047001, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 0, 440324855, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 0, 1411630638, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1769912507, 1826966860, 0, 0, 0);

-- mdl_assign_submission (3 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 3, 0, 1774766129, 1773478379, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 2, 0, 1773843384, 1774635536, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 3, 1, 'submitted', 2, 0, 1766021447, 1770585117, 0);

-- mdl_quiz_attempts (2 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 3, 'abandoned', 75.3, 1758666382, 1730601036, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 4, 'finished', 66.51, 1772671731, 1726446104, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 100.0, 70.27, 1, 0, 0, 0, 0, '', 0.0, '2025-10-16', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 55.26, 96.52, 0, 1, 1, 0, 0, '', 0.0, '2025-11-29', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 51.54, 15.02, 1, 1, 1, 0, 0, '', 0.0, '2025-11-10', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 96.01, 23.16, 0, 1, 0, 0, 0, '', 0.0, '2026-02-23', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (3 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1761743296, 1774358274, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1742471232, 1774185474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1772516271, 1774444674, 1, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 1, 1, NULL, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: completion_IN_PROGRESS_ON_TRACK
-- DT:   DT4_CourseCompletionStatus
-- Triggered: True
-- Derived attribute values when triggered:
--   daysSinceEnrolment = 7.0
--   daysUntilEnrolExpiry = 526.0
--   failedItemCount = 0.0
--   finalGrade = 90.39
--   forumPostCount = 2.0
--   gradePassMark = 59.12
--   moduleCompletionPct = 60.0
--   quizPassCount = 2.0
--   timecompleted = 0.0
--   unsubmittedCount = 1.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 1, 1724671054, 1712228531, 1730135728, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1708224175, 1748915378, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 10819363, 1760257272, 1761179727, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1775597853, 1775096500, 100, 6, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1772330513, 1768875700, 100, 9, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1777407528, 1772072500, 100, 7, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 3, 100.0, 82, 1705961665, 1743723787, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 2, 53.7, 4.38, 57.5, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 1, 60.14, 2.43, 59.12, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 0, 57.24, 7.75, 50.2, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 1427112793, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 662169353, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 1717595305, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 0, 932920024, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 0, 1710901599, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 461080513, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 2, 1001053857, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 0, 2, 204839144, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 2, 110883578, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 0, 2, 644215477, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1774339817, 1820472194, 0, 0, 0);

-- mdl_assign_submission (2 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 1, 1, 1770430900, 1768552618, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 3, 0, 1771899700, 1773466050, 0);

-- mdl_quiz_attempts (3 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 4, 'finished', 52.74, 1763547719, 1716790877, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 4, 'abandoned', 87.09, 1766060174, 1732713954, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 4, 'finished', 55.37, 1764219804, 1732256893, 0, '', 0, 0);

-- mdl_grade_grades (3 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 86.04, 89.58, 0, 1, 1, 0, 0, '', 0.0, '2026-02-10', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 58.21, 88.65, 0, 1, 1, 0, 0, '', 0.0, '2025-12-24', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 100.0, 90.39, 1, 0, 0, 0, 0, '', 0.0, '2025-12-01', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (3 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1756893043, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1756238668, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1759853072, 0, 0, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1767082815, 1718931522, 1, 'Re: Test', 'Test post', 1, 1, '', 0, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1771690319, 1731690314, 0, 'Re: Test', 'Test post', 1, 1, '', 2, 1, 0, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: completion_AT_RISK_LOW_ACTIVITY
-- DT:   DT4_CourseCompletionStatus
-- Triggered: True
-- Derived attribute values when triggered:
--   daysSinceEnrolment = 239.0
--   daysUntilEnrolExpiry = 628.0
--   failedItemCount = 2.0
--   finalGrade = 52.76
--   forumPostCount = 0.0
--   gradePassMark = 56.14
--   moduleCompletionPct = 0.0
--   quizPassCount = 5.0
--   timecompleted = 0.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 1, 1, 1652107557, 1740987960, 1717756245, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1696395722, 1767643923, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 37286764, 1767165635, 1757073474, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1773916678, 1772084620, 100, -1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1774007638, 1772242464, 100, 10, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1771066577, 1767442351, 100, 7, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 10, 100.0, 100, 1739642173, 1742909360, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 0, 75.25, 4.67, 56.14, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 1, 76.8, 4.97, 40.24, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 1, 73.87, 7.95, 50.74, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 1498917477, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 243517798, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 639751301, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 1647329369, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 0, 349831394, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 0, 1365589121, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 1521500693, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 2, 63412993, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 0, 2, 295669477, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 2, 545994184, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1754282519, 1829287260, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 0, 1, 1773242442, 1768145570, 0);

-- mdl_quiz_attempts (3 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 2, 'finished', 53.02, 1771934028, 1737205287, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 1, 'finished', 22.1, 1770006298, 1730975021, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 3, 'finished', 84.08, 1771763554, 1716024912, 0, '', 0, 0);

-- mdl_grade_grades (3 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 52.31, 9.89, 0, 0, 1, 0, 0, '', 0.0, '2025-10-10', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 46.24, 37.13, 1, 0, 0, 0, 0, '', 0.0, '2025-10-07', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 47.14, 52.76, 1, 0, 0, 0, 0, '', 0.0, '2025-12-23', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (2 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1748063579, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1746165662, 1774185474, 1, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 0, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1769133921, 1729712767, 0, 'Re: Test', 'Test post', 1, 1, '', 6, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1770923032, 1716353064, 0, 'Re: Test', 'Test post', 1, 1, '', 0, 1, 1, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: completion_FAILED_GRADE
-- DT:   DT4_CourseCompletionStatus
-- Triggered: True
-- Derived attribute values when triggered:
--   daysSinceEnrolment = 70.0
--   daysUntilEnrolExpiry = -20.0
--   failedItemCount = 3.0
--   finalGrade = 40.0
--   forumPostCount = 0.0
--   gradePassMark = 55.24
--   moduleCompletionPct = 60.0
--   quizPassCount = 3.0
--   timecompleted = 0.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 1, 1704363538, 1736808012, 1710780187, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1693536682, 1766284500, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 20549138, 1764323475, 1778173134, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1771900396, 1772628456, 100, 0, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1771692518, 1768546437, 100, 7, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1770993474, 1767110829, 100, 5, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 5, 100.0, 100.0, 1697999991, 1741517213, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 2, 67.19, 9.97, 50.0, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 2, 72.69, 3.07, 44.61, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 1, 55.98, 5.36, 55.24, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 2, 610614056, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 1, 945899551, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 110330668, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 245000263, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 1056017704, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 1351724358, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 0, 320399365, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 0, 532986017, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 2, 1641629800, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 2, 1280172653, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1768962087, 1773206036, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 3, 1, 1770691194, 1766352279, 0);

-- mdl_quiz_attempts (3 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 4, 'finished', 7.12, 1761944875, 1741202910, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 3, 'finished', 78.78, 1768515407, 1729991654, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 2, 'finished', 42.51, 1767164914, 1717744953, 0, '', 0, 0);

-- mdl_grade_grades (3 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 19.15, 25.0, 1, 1, 0, 0, 0, '', 0.0, '2026-02-11', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 29.62, 40.0, 1, 0, 0, 0, 0, '', 0.0, '2026-01-21', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 4.55, 40.0, 1, 0, 1, 0, 0, '', 0.0, '2026-03-06', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (2 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1772525904, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1744440790, 0, 0, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 0, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1767196535, 1736797801, 0, 'Re: Test', 'Test post', 1, 1, '', 4, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1769488560, 1714374216, 0, 'Re: Test', 'Test post', 1, 1, '', 7, 1, 1, 1, 1, 1);

-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT5_AcademicStanding                                    ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: standing_GOOD
-- DT:   DT5_AcademicStanding
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   avgQuizScore = 0.0
--   daysSinceEnrolment = 45.0
--   daysSinceLastPost = 5.0
--   failedItemCount = 0.0
--   finalGrade = 78.0
--   forumPostCount = 4.0
--   gradePassMark = 50.0
--   moduleCompletionPct = 80.0
--   overriddenGradeCount = 0.0
--   quizAttemptCount = 0.0
--   totalAssignments = 2.0
--   unsubmittedCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, confirmed, username, password, firstname, lastname, email, auth, mnethostid, deleted) VALUES (1, 1, 'student1', 'x', 'Alice', 'Smith', 'a@b.com', 'manual', 1, 0);

-- mdl_course (1 row)
INSERT INTO mdl_course (id, fullname, shortname, visible) VALUES (1, 'Test Course', 'TC1', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated) VALUES (1, 1, 'manual', 0, 0, 0, 0, 1770690238);

-- mdl_assign (2 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1775615038, 1776219838, 100, 0, 1770690238, '', 0, 0, 1776824638, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1775615038, 1776219838, 100, 0, 1770690238, '', 0, 0, 1776824638, 0, 0);

-- mdl_grade_items (2 rows)
INSERT INTO mdl_grade_items (id, courseid, itemtype, itemmodule, iteminstance, gradepass, grademax, grademin, timecreated, timemodified, itemname, sortorder, gradetype, hidden, locked, itemnumber, calculation, display, decimals) VALUES (1, 1, 'course', '', 1, 50.0, 100.0, 0.0, 1770690238, 1770690238, 'Course Grade', 1, 1, 0, 0, 0, '', 0, 2);
INSERT INTO mdl_grade_items (id, courseid, itemtype, itemmodule, iteminstance, gradepass, grademax, grademin, timecreated, timemodified, itemname, sortorder, gradetype, hidden, locked, itemnumber, calculation, display, decimals) VALUES (2, 1, 'mod', 'assign', 1, 50.0, 100.0, 0.0, 1770690238, 1770690238, 'Assign 1', 2, 1, 0, 0, 0, '', 0, 2);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'General Discussion', 'general', '', 0, 1770690238, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 1, 0, 1, 1770690238, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, enrolid, userid, status, timestart, timeend) VALUES (1, 1, 1, 0, 1771122238, 1783650238);

-- mdl_assign_submission (2 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 1, 1, 1774319038, 1774146238, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 1, 1, 1774491838, 1774319038, 0);

-- mdl_assign_grades (2 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grade, grader, timemodified, timecreated, attemptnumber) VALUES (1, 1, 1, 72.0, 2, 1774578238, 1774578238, 1);
INSERT INTO mdl_assign_grades (id, assignment, userid, grade, grader, timemodified, timecreated, attemptnumber) VALUES (2, 2, 1, 65.0, 2, 1774664638, 1774664638, 1);

-- mdl_grade_grades (2 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, finalgrade, rawgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 78.0, 78.0, 0, 0, 0, 1774578238, 1774578238, '', 1.0, 0, '', '', 0, '', 0, 100.0, 0.0, 0, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, finalgrade, rawgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 72.0, 72.0, 0, 0, 0, 1774578238, 1774578238, '', 1.0, 0, '', '', 0, '', 0, 100.0, 0.0, 0, 0);

-- mdl_forum_discussions (1 row)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, timemodified, firstpost, usermodified, timestart, timeend, pinned) VALUES (1, 1, 1, 'Week 1 Discussion', 1, 1774405438, 1, 1, 0, 0, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (1, 1, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (2, 2, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (3, 3, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (4, 4, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (5, 5, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (6, 6, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (7, 7, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (8, 8, 1, 1, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (9, 9, 1, 0, 1774751038, 1);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, timemodified, viewed) VALUES (10, 10, 1, 0, 1774751038, 1);

-- mdl_forum_posts (4 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1774578238, 1774578238, 0, 'Post 1', 'Good content', 1, 1, '', 0, 0, 0, 0, 10, 50);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1774491838, 1774491838, 0, 'Post 2', 'Good content', 1, 1, '', 0, 0, 0, 0, 10, 50);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1774405438, 1774405438, 0, 'Post 3', 'Good content', 1, 1, '', 0, 0, 0, 0, 10, 50);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (4, 1, 1, 0, 1774319038, 1774319038, 0, 'Post 4', 'Good content', 1, 1, '', 0, 0, 0, 0, 10, 50);

-- ═══════════════════════════════════════════════════════════
-- Rule: standing_SATISFACTORY
-- DT:   DT5_AcademicStanding
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 2.0
--   avgQuizScore = 95.11
--   daysSinceEnrolment = 331.0
--   daysSinceLastPost = 40.0
--   failedItemCount = 1.0
--   finalGrade = 60.0
--   forumPostCount = 3.0
--   gradePassMark = 54.71
--   moduleCompletionPct = 62.5
--   overriddenGradeCount = 1.0
--   quizAttemptCount = 1.0
--   totalAssignments = 3.0
--   unsubmittedCount = 1.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 1, 1606842542, 1725126604, 1730389285, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1717196852, 1755721750, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 32359668, 1746940925, 1754994535, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1769680384, 1772900595, 100, 5, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1772734960, 1772113455, 100, 7, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1773621016, 1772189199, 100, 10, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 5, 100.0, 100, 1689445109, 1741247074, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 84.39, 1.28, 50.0, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 1, 52.45, 8.49, 53.38, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 83.25, 2.1, 54.71, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (8 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 137345310, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 705381469, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 393462611, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 0, 1466873523, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 2, 1257055133, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 572143764, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 2, 1057449409, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 1585957103, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1746373765, 1810522590, 0, 0, 0);

-- mdl_assign_submission (2 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 3, 1, 1773102616, 1769442974, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 2, 0, 1773448216, 1771008187, 0);

-- mdl_assign_grades (2 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 44.76, 4, 1723859780, 1728493245);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 24.7, 6, 1716185425, 1737786236);

-- mdl_quiz_attempts (2 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 2, 'abandoned', 70.83, 1768851412, 1731808823, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 5, 'finished', 95.11, 1770933714, 1727611277, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 21.79, 40.0, 1, 0, 0, 0, 0, '', 0.0, '2026-03-19', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 26.96, 60.0, 0, 0, 0, 0, 0, '', 0.0, '2025-12-01', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 76.95, 60.0, 0, 0, 1, 0, 0, '', 0.0, '2025-10-25', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 64.66, 60.0, 0, 0, 0, 0, 0, '', 0.0, '2026-03-20', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (3 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1743931188, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1768158801, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1762618162, 0, 1, 0);

-- mdl_course_modules_completion (8 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);

-- mdl_forum_posts (4 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1768892617, 1710290771, 0, 'Re: Test', 'Test post', 1, 1, '', 1, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1767770853, 1715966175, 0, 'Re: Test', 'Test post', 1, 1, '', 3, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1772879336, 1717717508, 0, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (4, 1, 1, 0, 1771484267, 1716637588, 0, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 0, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: standing_PROBATION
-- DT:   DT5_AcademicStanding
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   avgQuizScore = 14.55
--   daysSinceEnrolment = 238.0
--   daysSinceLastPost = 105.0
--   failedItemCount = 4.0
--   finalGrade = 57.5
--   forumPostCount = 1.0
--   gradePassMark = 57.99
--   moduleCompletionPct = 75.0
--   overriddenGradeCount = 2.0
--   quizAttemptCount = 2.0
--   totalAssignments = 3.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 1, 1, 1687538386, 1717391397, 1732732604, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1683013348, 1754824937, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 50116992, 1772109877, 1786200105, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1775190202, 1774632708, 100, 7, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1772688802, 1767088384, 100, 1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1771827596, 1769547214, 100, -1, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 4, 100.0, 100, 1697932161, 1740893581, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 82.19, 4.34, 57.74, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 1, 94.67, 8.86, 57.99, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 72.19, 6.18, 55.05, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (8 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 1229112596, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 1057132415, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 2, 881311963, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 1744329600, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 1513771059, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 1, 1423482606, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 946052796, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 0, 0, 76899147, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1754421532, 1804264839, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 3, 0, 1769738626, 1771175972, 0);

-- mdl_assign_grades (3 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 55.22, 10, 1739809966, 1710559646);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 72.11, 4, 1733382763, 1730750974);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 49.22, 6, 1737253458, 1720835231);

-- mdl_quiz_attempts (2 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 2, 'finished', 5.72, 1769668778, 1730045796, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 3, 'finished', 23.38, 1760460093, 1724107650, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 56.43, 36.02, 1, 0, 0, 0, 0, '', 0.0, '2026-01-06', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 70.96, 57.5, 0, 0, 0, 0, 0, '', 0.0, '2025-11-11', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 79.21, 0.01, 1, 1, 1, 0, 0, '', 0.0, '2025-10-07', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 33.33, 49.55, 0, 1, 1, 0, 0, '', 0.0, '2026-01-23', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (3 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1773653460, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1742747322, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1754242663, 0, 0, 0);

-- mdl_course_modules_completion (8 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (3 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1765853052, 1718632136, 0, 'Re: Test', 'Test post', 1, 1, '', 0, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1767284574, 1718084585, 0, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1768513287, 1740531330, 0, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 1, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: standing_SUSPENSION_RISK
-- DT:   DT5_AcademicStanding
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   avgQuizScore = 14.59
--   daysSinceEnrolment = 191.0
--   daysSinceLastPost = 9999.0
--   failedItemCount = 3.0
--   finalGrade = 35.3
--   forumPostCount = 0.0
--   gradePassMark = 55.7
--   moduleCompletionPct = 12.5
--   overriddenGradeCount = 2.0
--   quizAttemptCount = 2.0
--   totalAssignments = 2.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 0, 1658935600, 1714482586, 1736858318, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1685401500, 1751861265, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 27046258, 1769394721, 1749147196, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1770713852, 1775010100, 100, 9, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1774778040, 1772831308, 100, 8, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1773475115, 1769821827, 100, 1, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 9, 100.0, 100.0, 1706756407, 1742018294, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 0, 94.55, 9.41, 47.67, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 2, 96.77, 0.35, 49.8, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 64.29, 3.41, 55.7, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (8 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 0, 1, 1662242013, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 1351856512, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 2, 212049041, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 0, 1612703084, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 0, 1, 1613790324, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 0, 1, 57729244, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 1501647035, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 786004228, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1758457385, 1780176194, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 0, 0, 1770041797, 1770163801, 0);

-- mdl_assign_grades (3 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 91, 10, 1730726814, 1726515460);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 9.66, 0, 1721065996, 1713307641);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 4.72, 5, 1730375211, 1728714300);

-- mdl_quiz_attempts (3 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 5, 'inprogress', 70.33, 1771640434, 1719413077, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 3, 'finished', 3.84, 1771348778, 1722730643, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 2, 'finished', 25.34, 1742723192, 1720675249, 0, '', 0, 0);

-- mdl_grade_grades (3 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 2.76, 25.83, 1, 1, 1, 0, 0, '', 0.0, '2026-02-14', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 73.84, 35.3, 1, 0, 0, 0, 0, '', 0.0, '2026-03-26', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 64.14, 0.0, 0, 0, 1, 0, 0, '', 0.0, '2026-01-23', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (4 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1770012243, 1774185474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1752953984, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1767846734, 1774876674, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (4, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1748072014, 0, 0, 0);

-- mdl_course_modules_completion (8 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (3 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1771285302, 1730867765, 0, 'Re: Test', 'Test post', 1, 1, '', 0, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1765962227, 1727592698, 0, 'Re: Test', 'Test post', 1, 1, '', 6, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1771362941, 1729007001, 0, 'Re: Test', 'Test post', 1, 1, '', 6, 1, 1, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: standing_INTEGRITY_HOLD
-- DT:   DT5_AcademicStanding
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 1.0
--   avgQuizScore = 71.41
--   daysSinceEnrolment = 20.0
--   daysSinceLastPost = 9999.0
--   failedItemCount = 1.0
--   finalGrade = 68.26
--   forumPostCount = 0.0
--   gradePassMark = 58.26
--   moduleCompletionPct = 50.0
--   overriddenGradeCount = 3.0
--   quizAttemptCount = 2.0
--   totalAssignments = 3.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 1, 1727300749, 1722952599, 1720826985, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1720102603, 1743737238, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 42356498, 1765009312, 1800948105, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1773320800, 1767914184, 100, 9, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1773402229, 1768483952, 100, 10, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1777258854, 1767331211, 100, -1, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 7, 100.0, 100.0, 1693362745, 1740740542, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 80.99, 2.41, 58.26, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 0, 73.06, 2.54, 45.11, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 1, 95.06, 6.78, 43.16, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (8 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 1693528122, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 1244625266, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 2, 282204711, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 701623981, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 0, 431203546, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 785673065, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 0, 551839046, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 1603223987, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1773282087, 1824300116, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 2, 0, 1770726568, 1771818690, 0);

-- mdl_assign_grades (3 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 36.86, 2, 1718395506, 1728024584);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 40.62, 10, 1736794140, 1716243306);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 16.17, 1, 1730652750, 1739422128);

-- mdl_quiz_attempts (2 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 5, 'finished', 80.0, 1770705157, 1734391942, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 2, 'finished', 62.82, 1773185273, 1731255600, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 94.52, 35.0, 1, 1, 1, 0, 0, '', 0.0, '2025-12-06', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 84.53, 48.26, 1, 1, 0, 0, 0, '', 0.0, '2026-01-31', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 38.14, 68.26, 1, 1, 0, 0, 0, '', 0.0, '2025-10-15', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 39.58, 68.26, 0, 1, 1, 0, 0, '', 0.0, '2026-02-02', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (3 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1768575558, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1750918431, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1754412356, 0, 1, 0);

-- mdl_course_modules_completion (8 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (3 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1770708319, 1722986694, 0, 'Re: Test', 'Test post', 1, 1, '', 10, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1766713546, 1732845357, 0, 'Re: Test', 'Test post', 1, 1, '', 3, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1766014595, 1730990143, 0, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 1, 1, 1, 1);

-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT6_InstructorWorkload                                  ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: workload_CRITICAL_BACKLOG
-- DT:   DT6_InstructorWorkload
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   daysSinceLastInstructorPost = 18.0
--   enrolledStudentCount = 26.0
--   maxDaysUngraded = 38.0
--   missingFeedbackCount = 6.0
--   totalAssignments = 4.0
--   totalForumDiscussions = 10.0
--   unansweredDiscussionCount = 10.0
--   ungradedSubmissionCount = 10.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (26 rows)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 1, 1665176156, 1731986460, 1723901735, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (2, 'user2', 0, 0, 0, 1594046654, 1720414380, 1726731339, 'test2@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (3, 'user3', 0, 0, 0, 1728354168, 1714753730, 1723242390, 'test3@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (4, 'user4', 1, 1, 1, 1741720573, 1735108015, 1734582221, 'test4@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (5, 'user5', 0, 1, 0, 1715415694, 1730859460, 1723895696, 'test5@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (6, 'user6', 1, 0, 1, 1642380486, 1725079067, 1725123116, 'test6@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (7, 'user7', 0, 1, 0, 1682663326, 1728470842, 1740457504, 'test7@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (8, 'user8', 1, 0, 1, 1658113961, 1716570518, 1714300599, 'test8@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (9, 'user9', 1, 0, 0, 1589790698, 1711898733, 1736602045, 'test9@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (10, 'user10', 1, 0, 0, 1735610346, 1717087156, 1712503774, 'test10@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (11, 'user11', 0, 0, 0, 1672254632, 1736185097, 1715152696, 'test11@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (12, 'user12', 0, 1, 0, 1618952097, 1728328222, 1718612159, 'test12@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (13, 'user13', 0, 0, 0, 1619438260, 1710700229, 1722222216, 'test13@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (14, 'user14', 0, 1, 0, 1630831458, 1719105856, 1711959819, 'test14@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (15, 'user15', 0, 1, 0, 1601118830, 1726181762, 1725243220, 'test15@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (16, 'user16', 1, 0, 1, 1719305769, 1717635576, 1730841160, 'test16@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (17, 'user17', 0, 1, 1, 1592419536, 1712242561, 1726273565, 'test17@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (18, 'user18', 1, 1, 0, 1715663142, 1734105821, 1740726094, 'test18@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (19, 'user19', 1, 0, 0, 1670523833, 1730612674, 1715178857, 'test19@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (20, 'user20', 0, 0, 1, 1741190236, 1728601388, 1734097482, 'test20@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (21, 'user21', 1, 1, 1, 1705850905, 1727165079, 1730516352, 'test21@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (22, 'user22', 1, 0, 0, 1732055523, 1734388973, 1739242703, 'test22@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (23, 'user23', 0, 1, 1, 1645393377, 1724086879, 1721574257, 'test23@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (24, 'user24', 1, 1, 1, 1609582010, 1720688982, 1724521423, 'test24@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (25, 'user25', 1, 1, 1, 1625031298, 1733247489, 1741171838, 'test25@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (26, 'user26', 1, 0, 0, 1606972421, 1713329883, 1724692971, 'test26@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1733142514, 1747877500, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 39357005, 1760888387, 1776839533, 0, 0, 5);

-- mdl_assign (4 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1773397485, 1772641128, 100, 5, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1774772906, 1770796519, 100, 5, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1771488707, 1773421306, 100, 7, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (4, 1, 'Assignment 4', 0, 1772575903, 1770694760, 100, 0, 0, '', 1, 0, 0, 0, 0);

-- mdl_forum (10 rows)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (2, 1, 'Forum 2', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (3, 1, 'Forum 3', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (4, 1, 'Forum 4', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (5, 1, 'Forum 5', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (6, 1, 'Forum 6', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (7, 1, 'Forum 7', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (8, 1, 'Forum 8', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (9, 1, 'Forum 9', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (10, 1, 'Forum 10', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (4 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 1007000363, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 650301929, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 2, 120628710, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 159323231, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (26 rows)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 25, 1764526588, 1782388276, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (2, 2, 1, 1, 1753909456, 1832812272, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (3, 3, 1, 1, 1771173012, 1835646702, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (4, 4, 1, 0, 1774538739, 1793487956, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (5, 5, 1, 1, 1753843962, 1781137990, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (6, 6, 1, 0, 1747236557, 1818258301, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (7, 7, 1, 1, 1749569083, 1831045126, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (8, 8, 1, 0, 1753792550, 1830917523, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (9, 9, 1, 1, 1745899585, 1825363071, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (10, 10, 1, 1, 1761308273, 1789362753, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (11, 11, 1, 1, 1770403375, 1811831244, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (12, 12, 1, 0, 1762479152, 1836535265, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (13, 13, 1, 1, 1743016181, 1786292991, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (14, 14, 1, 1, 1765623332, 1825349910, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (15, 15, 1, 1, 1772966342, 1796990720, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (16, 16, 1, 1, 1742249550, 1786359394, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (17, 17, 1, 0, 1761047256, 1818299125, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (18, 18, 1, 1, 1744379573, 1783706520, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (19, 19, 1, 0, 1745123550, 1824256186, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (20, 20, 1, 0, 1754667663, 1802359955, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (21, 21, 1, 1, 1753483245, 1784749031, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (22, 22, 1, 1, 1752501488, 1822610959, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (23, 23, 1, 1, 1768110951, 1812276032, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (24, 24, 1, 0, 1771684719, 1777715992, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (25, 25, 1, 0, 1747326473, 1824814808, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (26, 26, 1, 0, 1764659311, 1779660317, 0, 0, 0);

-- mdl_assign_submission (12 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 2, 12, 2, 1, 1771855886, 1770979092, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 3, 'submitted', 0, 0, 1772545812, 1766723762, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 3, 4, 'submitted', 0, 0, 1772459412, 1769348592, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (4, 4, 5, 'submitted', 1, 1, 1772373012, 1771309653, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (5, 1, 6, 'submitted', 0, 0, 1772286612, 1773029866, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (6, 2, 7, 'submitted', 1, 0, 1772200212, 1774739923, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (7, 3, 8, 'submitted', 1, 1, 1772113812, 1772466422, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (8, 4, 9, 'submitted', 0, 1, 1772027412, 1773518070, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (9, 1, 10, 'submitted', 0, 1, 1771941012, 1772589764, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (10, 2, 11, 'submitted', 3, 1, 1771854612, 1772599988, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (11, 3, 12, 'submitted', 0, 1, 1771768212, 1773523819, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (12, 4, 13, 'submitted', 2, 0, 1771681812, 1767580762, 0);

-- mdl_assign_grades (7 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 2, 1, 0, 9, 1723638466, 1727782865);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 1, 3, 1, -1.0, 7, 1711463489, 1712110513);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 1, 4, 1, -1.0, 4, 1712776265, 1731833017);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (4, 1, 5, 1, -1.0, 1, 1730837857, 1730135610);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (5, 1, 6, 1, -1.0, 7, 1729674223, 1728801370);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (6, 1, 7, 1, -1.0, 0, 1725292158, 1740704254);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (7, 1, 8, 1, -1.0, 10, 1716517868, 1720990247);

-- mdl_forum_discussions (10 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1758867769, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 2, 'Test Discussion', 1, 0, 0, 0, 0, 1757161721, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 3, 'Test Discussion', 1, 0, 1, 0, 0, 1775008064, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (4, 1, 4, 'Test Discussion', 1, 0, 0, 0, 0, 1743358065, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (5, 1, 5, 'Test Discussion', 1, 0, 1, 0, 0, 1756789222, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (6, 1, 6, 'Test Discussion', 1, 0, 1, 0, 0, 1754555510, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (7, 1, 7, 'Test Discussion', 1, 0, 1, 0, 0, 1755760698, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (8, 1, 8, 'Test Discussion', 1, 0, 0, 0, 0, 1768526735, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (9, 1, 9, 'Test Discussion', 1, 0, 0, 0, 0, 1753107260, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (10, 1, 10, 'Test Discussion', 1, 0, 1, 0, 0, 1751579064, 0, 1, 0);

-- mdl_forum_posts (3 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1773409812, 1735516601, 0, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1773409812, 1741211071, 0, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1773409812, 1731247523, 0, 'Re: Test', 'Test post', 1, 1, '', 5, 1, 0, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: workload_HIGH_GRADING
-- DT:   DT6_InstructorWorkload
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   daysSinceLastInstructorPost = 16.0
--   enrolledStudentCount = 26.0
--   maxDaysUngraded = 11.0
--   missingFeedbackCount = 2.0
--   totalAssignments = 4.0
--   totalForumDiscussions = 10.0
--   unansweredDiscussionCount = 10.0
--   ungradedSubmissionCount = 9.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (26 rows)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 1, 1605565905, 1729701740, 1729311049, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (2, 'user2', 1, 0, 0, 1660888608, 1737153344, 1729498968, 'test2@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (3, 'user3', 1, 1, 1, 1620431216, 1710773364, 1740200590, 'test3@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (4, 'user4', 0, 1, 1, 1661580092, 1719531625, 1738097766, 'test4@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (5, 'user5', 1, 1, 0, 1677383250, 1717843962, 1722296804, 'test5@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (6, 'user6', 0, 0, 0, 1702651062, 1720395684, 1741737600, 'test6@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (7, 'user7', 0, 0, 0, 1613303042, 1718403453, 1718073924, 'test7@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (8, 'user8', 0, 0, 1, 1704827917, 1737815235, 1732296869, 'test8@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (9, 'user9', 0, 0, 1, 1693846403, 1724413310, 1733992367, 'test9@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (10, 'user10', 1, 0, 0, 1706731289, 1740687901, 1715232425, 'test10@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (11, 'user11', 1, 0, 1, 1627583902, 1735937723, 1727972449, 'test11@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (12, 'user12', 0, 1, 1, 1696149417, 1710201600, 1729742299, 'test12@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (13, 'user13', 0, 1, 1, 1666734017, 1739076846, 1721957098, 'test13@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (14, 'user14', 0, 1, 1, 1695215250, 1740286926, 1741528413, 'test14@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (15, 'user15', 0, 1, 1, 1715756954, 1731563990, 1721670136, 'test15@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (16, 'user16', 0, 0, 0, 1730437672, 1721364776, 1711132026, 'test16@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (17, 'user17', 0, 0, 0, 1646134085, 1724300176, 1738210336, 'test17@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (18, 'user18', 1, 1, 0, 1709468160, 1711511131, 1733096414, 'test18@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (19, 'user19', 0, 1, 0, 1729218903, 1713451312, 1722171173, 'test19@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (20, 'user20', 1, 1, 0, 1718794935, 1736826261, 1714943184, 'test20@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (21, 'user21', 0, 0, 0, 1725778485, 1730543388, 1718692081, 'test21@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (22, 'user22', 1, 0, 0, 1613824784, 1723509097, 1739650382, 'test22@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (23, 'user23', 1, 0, 0, 1736916772, 1714460126, 1722364096, 'test23@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (24, 'user24', 0, 0, 1, 1655079627, 1712545779, 1711978481, 'test24@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (25, 'user25', 0, 0, 0, 1729416917, 1714869676, 1735127769, 'test25@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (26, 'user26', 1, 1, 1, 1651966258, 1733484291, 1741737600, 'test26@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 0, 1692972147, 1746889665, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 39095749, 1745513552, 1749054392, 0, 0, 5);

-- mdl_assign (4 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1774146929, 1767186851, 100, 4, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1776989239, 1770622896, 100, 6, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1776187597, 1773555006, 100, -1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (4, 1, 'Assignment 4', 1, 1770456183, 1773831721, 100, 7, 0, '', 1, 0, 0, 0, 0);

-- mdl_forum (10 rows)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (2, 1, 'Forum 2', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (3, 1, 'Forum 3', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (4, 1, 'Forum 4', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (5, 1, 'Forum 5', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (6, 1, 'Forum 6', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (7, 1, 'Forum 7', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (8, 1, 'Forum 8', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (9, 1, 'Forum 9', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (10, 1, 'Forum 10', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (4 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 703283641, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 1621062591, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 1473519416, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 333731544, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (26 rows)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 18, 1746332274, 1833873167, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (2, 2, 1, 0, 1767990409, 1822462911, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (3, 3, 1, 1, 1753820285, 1814452440, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (4, 4, 1, 1, 1758170809, 1792554171, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (5, 5, 1, 1, 1774116093, 1798683686, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (6, 6, 1, 1, 1751383650, 1781802980, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (7, 7, 1, 1, 1755218394, 1826508388, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (8, 8, 1, 0, 1744656725, 1783955975, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (9, 9, 1, 1, 1769590616, 1833133444, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (10, 10, 1, 1, 1748860480, 1787528188, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (11, 11, 1, 0, 1770263506, 1824034981, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (12, 12, 1, 0, 1754326117, 1822319218, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (13, 13, 1, 0, 1765817053, 1810513080, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (14, 14, 1, 1, 1756848776, 1813955861, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (15, 15, 1, 1, 1745824332, 1816900016, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (16, 16, 1, 1, 1752473789, 1784419021, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (17, 17, 1, 0, 1768097369, 1791024462, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (18, 18, 1, 1, 1755636755, 1829790100, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (19, 19, 1, 0, 1766609716, 1776282391, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (20, 20, 1, 0, 1764433277, 1833677388, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (21, 21, 1, 1, 1743364664, 1778296539, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (22, 22, 1, 0, 1764519227, 1781125907, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (23, 23, 1, 0, 1762559310, 1814425720, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (24, 24, 1, 1, 1770489847, 1816198855, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (25, 25, 1, 1, 1755267092, 1797578320, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (26, 26, 1, 1, 1745416684, 1832483581, 0, 0, 0);

-- mdl_assign_submission (11 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 2, 7, 4, 0, 1774004521, 1772546514, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 3, 'submitted', 0, 1, 1774004521, 1771131520, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 3, 4, 'submitted', 1, 1, 1774004521, 1773237129, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (4, 4, 5, 'submitted', 2, 0, 1774004521, 1772936319, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (5, 1, 6, 'submitted', 2, 0, 1774004521, 1773336483, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (6, 2, 7, 'submitted', 3, 1, 1774004521, 1769698361, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (8, 4, 9, 'submitted', 4, 0, 1774004521, 1772846164, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (9, 1, 10, 'submitted', 0, 0, 1774004521, 1774526976, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (10, 2, 11, 'submitted', 2, 0, 1774004521, 1774207967, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (11, 3, 12, 'submitted', 2, 0, 1774004521, 1774187152, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (12, 4, 13, 'submitted', 1, 0, 1774004521, 1771426713, 0);

-- mdl_assign_grades (7 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 2, 1, 63, 4, 1741164275, 1721771576);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 1, 3, 1, 5, 8, 1714148579, 1726336420);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 1, 4, 1, 89, 4, 1729561507, 1740146671);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (4, 1, 5, 1, 6, 1, 1741199761, 1737405880);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (5, 1, 6, 1, -1.0, 3, 1725238260, 1735686695);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (6, 1, 7, 1, -1.0, 6, 1740647624, 1736660546);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (7, 1, 8, 1, 7, 5, 1731570943, 1716843696);

-- mdl_forum_discussions (10 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1764580451, 1774185474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 2, 'Test Discussion', 1, 0, 0, 0, 0, 1752428306, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 3, 'Test Discussion', 1, 0, 0, 0, 0, 1771138772, 1774185474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (4, 1, 4, 'Test Discussion', 1, 0, 1, 0, 0, 1770808633, 1774185474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (5, 1, 5, 'Test Discussion', 1, 0, 0, 0, 0, 1762985771, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (6, 1, 6, 'Test Discussion', 1, 0, 0, 0, 0, 1743966466, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (7, 1, 7, 'Test Discussion', 1, 0, 0, 0, 0, 1763466571, 1806327062, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (8, 1, 8, 'Test Discussion', 1, 0, 1, 0, 0, 1743674182, 0, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (9, 1, 9, 'Test Discussion', 1, 0, 1, 0, 0, 1760258971, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (10, 1, 10, 'Test Discussion', 1, 0, 0, 0, 0, 1745951659, 1774185474, 0, 0);

-- mdl_forum_posts (3 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1773580674, 1719775140, 0, 'Re: Test', 'Test post', 1, 1, '', 1, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1773409812, 1719062700, 1, 'Re: Test', 'Test post', 1, 1, '', 2, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1773580674, 1741534010, 0, 'Re: Test', 'Test post', 1, 1, '', 4, 1, 0, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: workload_NORMAL
-- DT:   DT6_InstructorWorkload
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   daysSinceLastInstructorPost = 19.0
--   enrolledStudentCount = 26.0
--   maxDaysUngraded = 0.0
--   missingFeedbackCount = 0.0
--   totalAssignments = 2.0
--   totalForumDiscussions = 6.0
--   unansweredDiscussionCount = 8.0
--   ungradedSubmissionCount = 3.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (26 rows)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 1, 1586867425, 1722608142, 1726317123, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (2, 'user2', 1, 1, 1, 1717828901, 1712477315, 1723266092, 'test2@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (3, 'user3', 0, 1, 0, 1682658608, 1714857732, 1716487993, 'test3@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (4, 'user4', 1, 0, 1, 1649406022, 1728084459, 1725317274, 'test4@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (5, 'user5', 0, 1, 0, 1594324480, 1711133785, 1718155690, 'test5@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (6, 'user6', 1, 1, 0, 1640073661, 1731280941, 1716650174, 'test6@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (7, 'user7', 1, 1, 1, 1724613888, 1712250412, 1730358629, 'test7@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (8, 'user8', 0, 1, 0, 1603025942, 1722832929, 1738238408, 'test8@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (9, 'user9', 0, 1, 0, 1637117422, 1738132538, 1726004384, 'test9@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (10, 'user10', 0, 0, 0, 1713202659, 1740866356, 1739900450, 'test10@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (11, 'user11', 0, 0, 0, 1691489362, 1721527792, 1732818037, 'test11@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (12, 'user12', 1, 1, 0, 1661773286, 1739431912, 1740206768, 'test12@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (13, 'user13', 1, 0, 1, 1684785797, 1736038813, 1737627823, 'test13@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (14, 'user14', 1, 0, 1, 1685134104, 1728704943, 1720913841, 'test14@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (15, 'user15', 0, 0, 0, 1599629568, 1711472692, 1735492110, 'test15@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (16, 'user16', 0, 0, 0, 1701061547, 1736785927, 1715335918, 'test16@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (17, 'user17', 1, 1, 0, 1684846690, 1731730941, 1718654653, 'test17@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (18, 'user18', 1, 0, 1, 1674283785, 1720424442, 1724845616, 'test18@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (19, 'user19', 1, 1, 0, 1653876121, 1717093443, 1739566710, 'test19@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (20, 'user20', 1, 1, 0, 1626919972, 1721701965, 1731269606, 'test20@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (21, 'user21', 0, 0, 0, 1656762885, 1713859578, 1726601619, 'test21@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (22, 'user22', 1, 0, 1, 1695146508, 1714073377, 1740759412, 'test22@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (23, 'user23', 1, 0, 0, 1596045961, 1735568815, 1734264955, 'test23@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (24, 'user24', 1, 0, 0, 1590550452, 1713838319, 1730874427, 'test24@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (25, 'user25', 1, 0, 0, 1689834034, 1721114101, 1720091420, 'test25@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (26, 'user26', 0, 1, 0, 1675745909, 1728504411, 1741737600, 'test26@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1717643411, 1744699679, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 47826519, 1759204023, 1765149956, 0, 0, 5);

-- mdl_assign (4 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1775081414, 1774234838, 56, 4, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1769939584, 1770994474, 62, 6, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1772673605, 1770604213, 35, 1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (4, 1, 'Assignment 4', 0, 1772103324, 1773067081, 70, 6, 0, '', 1, 0, 0, 0, 0);

-- mdl_forum (10 rows)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (2, 1, 'Forum 2', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (3, 1, 'Forum 3', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (4, 1, 'Forum 4', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (5, 1, 'Forum 5', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (6, 1, 'Forum 6', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (7, 1, 'Forum 7', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (8, 1, 'Forum 8', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (9, 1, 'Forum 9', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (10, 1, 'Forum 10', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (4 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 0, 2, 1138207324, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 0, 0, 2556856, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 222523857, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 0, 905543832, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (26 rows)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1775036357, 1834086522, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (2, 2, 1, 0, 1756542462, 1817357194, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (3, 3, 1, 1, 1746245958, 1807672408, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (4, 4, 1, 0, 1750800202, 1781384941, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (5, 5, 1, 0, 1761356436, 1808027401, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (6, 6, 1, 0, 1745148771, 1816732836, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (7, 7, 1, 0, 1766018418, 1779383227, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (8, 8, 1, 1, 1762867092, 1830826066, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (9, 9, 1, 0, 1750952800, 1808607923, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (10, 10, 1, 1, 1761319328, 1823271284, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (11, 11, 1, 1, 1760463455, 1812131790, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (12, 12, 1, 0, 1769638087, 1788056014, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (13, 13, 1, 0, 1744546054, 1793114199, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (14, 14, 1, 1, 1773401201, 1799778450, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (15, 15, 1, 1, 1763384481, 1805666127, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (16, 16, 1, 1, 1742563074, 1799227193, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (17, 17, 1, 1, 1770035005, 1799361908, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (18, 18, 1, 0, 1749717426, 1790962160, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (19, 19, 1, 0, 1773130106, 1831290205, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (20, 20, 1, 1, 1764142355, 1788492023, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (21, 21, 1, 1, 1766582550, 1818280248, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (22, 22, 1, 1, 1750639502, 1818103692, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (23, 23, 1, 1, 1765970791, 1786503295, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (24, 24, 1, 1, 1772213840, 1811145315, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (25, 25, 1, 1, 1769578596, 1825134414, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (26, 26, 1, 0, 1764087186, 1831185445, 0, 0, 0);

-- mdl_assign_submission (7 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 2, 'submitted', 3, 0, 1774876825, 1770715247, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 3, 4, 'submitted', 0, 1, 1774933808, 1772837757, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 1, 6, 'submitted', 0, 0, 1774933808, 1774963652, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (4, 1, 6, 'submitted', 0, 1, 1774933808, 1774963652, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (5, 1, 6, 'submitted', 4, 1, 1774933808, 1772780377, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (7, 2, 11, 'submitted', 3, 0, 1774933808, 1773891764, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (8, 2, 11, 'submitted', 3, 0, 1774933808, 1773891764, 0);

-- mdl_assign_grades (6 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 2, 1, 85, 2, 1729417058, 1723982265);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 1, 3, 1, 74, 4, 1733609887, 1727663438);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 1, 5, 1, 34, 8, 1723303560, 1715522341);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (4, 1, 6, 1, 44, 8, 1740794787, 1740030949);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (5, 1, 6, 1, 43, 8, 1740794787, 1740030949);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (6, 1, 8, 1, 22, 5, 1736294178, 1716439871);

-- mdl_forum_discussions (8 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1755325044, 1823075295, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 2, 'Test Discussion', 1, 0, 1, 0, 0, 1754522471, 1774185474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 4, 'Test Discussion', 1, 0, 1, 0, 0, 1744899758, 1775740674, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (4, 1, 4, 'Test Discussion', 1, 0, 1, 0, 0, 1744187674, 1776691074, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (5, 1, 6, 'Test Discussion', 1, 0, 1, 0, 0, 1748828354, 1806692577, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (6, 1, 6, 'Test Discussion', 1, 0, 0, 0, 0, 1749173954, 1779160170, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (7, 1, 7, 'Test Discussion', 1, 0, 0, 0, 0, 1751473097, 1792883327, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (8, 1, 9, 'Test Discussion', 1, 0, 1, 0, 0, 1742437916, 1777209474, 1, 0);

-- mdl_forum_posts (3 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1772872749, 1741737600, 1, 'Re: Test', 'Test post', 1, 1, '', 1, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1773321474, 1716653027, 1, 'Re: Test', 'Test post', 1, 1, '', 5, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1766043512, 1741737600, 0, 'Re: Test', 'Test post', 1, 1, '', 1, 1, 0, 1, 1, 1);

-- ═══════════════════════════════════════════════════════════
-- Rule: workload_FORUM_UNRESPONSIVE
-- DT:   DT6_InstructorWorkload
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   daysSinceLastInstructorPost = 19.0
--   enrolledStudentCount = 26.0
--   maxDaysUngraded = 22.0
--   missingFeedbackCount = 1.0
--   totalAssignments = 2.0
--   totalForumDiscussions = 10.0
--   unansweredDiscussionCount = 12.0
--   ungradedSubmissionCount = 3.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (26 rows)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 1, 1602670158, 1732609058, 1732319990, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (2, 'user2', 0, 0, 1, 1703840740, 1728649188, 1719683718, 'test2@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (3, 'user3', 0, 1, 1, 1645716420, 1736516559, 1724859699, 'test3@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (4, 'user4', 1, 1, 0, 1690347142, 1725154135, 1718116937, 'test4@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (5, 'user5', 1, 1, 1, 1584057600, 1718764701, 1736262050, 'test5@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (6, 'user6', 0, 0, 1, 1707170259, 1714506232, 1710997831, 'test6@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (7, 'user7', 0, 1, 1, 1591566266, 1739167159, 1733231322, 'test7@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (8, 'user8', 1, 1, 0, 1704661193, 1722085996, 1725353760, 'test8@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (9, 'user9', 0, 1, 1, 1601155516, 1726398932, 1721093841, 'test9@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (10, 'user10', 1, 0, 0, 1609475751, 1731316196, 1722064405, 'test10@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (11, 'user11', 0, 0, 0, 1598913940, 1728356250, 1726215372, 'test11@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (12, 'user12', 1, 0, 1, 1616156255, 1728820768, 1728132234, 'test12@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (13, 'user13', 0, 0, 0, 1620590179, 1741737600, 1710201600, 'test13@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (14, 'user14', 0, 0, 0, 1642763344, 1741440478, 1739953008, 'test14@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (15, 'user15', 0, 1, 0, 1702181989, 1737917297, 1733766161, 'test15@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (16, 'user16', 0, 1, 0, 1632149641, 1712307390, 1722689408, 'test16@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (17, 'user17', 1, 1, 1, 1728723820, 1727769922, 1729473795, 'test17@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (18, 'user18', 0, 0, 0, 1685470480, 1737816838, 1721020373, 'test18@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (19, 'user19', 0, 0, 1, 1662082376, 1710201600, 1727929910, 'test19@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (20, 'user20', 1, 1, 0, 1615203075, 1713797153, 1730809576, 'test20@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (21, 'user21', 0, 0, 1, 1723742660, 1714175328, 1738254302, 'test21@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (22, 'user22', 0, 0, 1, 1585214570, 1720953946, 1734103241, 'test22@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (23, 'user23', 1, 0, 1, 1718676943, 1738758641, 1716763547, 'test23@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (24, 'user24', 0, 0, 0, 1701176111, 1733219966, 1711875488, 'test24@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (25, 'user25', 1, 0, 0, 1590339595, 1720974412, 1729787230, 'test25@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (26, 'user26', 0, 1, 1, 1641992960, 1731006855, 1741343333, 'test26@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1703771426, 1762009509, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 30688293, 1759827516, 1754113034, 0, 0, 5);

-- mdl_assign (4 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1772915985, 1774505205, 100, 8, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1768643597, 1768894864, 37, 6, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1773882648, 1767261184, 37, 0, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (4, 1, 'Assignment 4', 0, 1772413133, 1770867302, 97, 5, 0, '', 1, 0, 0, 0, 0);

-- mdl_forum (10 rows)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (2, 1, 'Forum 2', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (3, 1, 'Forum 3', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (4, 1, 'Forum 4', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (5, 1, 'Forum 5', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (6, 1, 'Forum 6', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (7, 1, 'Forum 7', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (8, 1, 'Forum 8', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (9, 1, 'Forum 9', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (10, 1, 'Forum 10', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (4 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 1420939529, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 1, 727084354, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 0, 1, 533952754, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 0, 0, 1241235799, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (26 rows)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1774664500, 1788780683, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (2, 2, 1, 1, 1754693905, 1814493277, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (3, 3, 1, 1, 1760734579, 1807623452, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (4, 4, 1, 1, 1762898066, 1779636564, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (5, 5, 1, 0, 1767823794, 1821298582, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (6, 6, 1, 1, 1774750900, 1830004584, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (7, 7, 1, 1, 1751747342, 1824743426, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (8, 8, 1, 0, 1760660792, 1778047283, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (9, 9, 1, 1, 1761153529, 1826399774, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (10, 10, 1, 0, 1767397665, 1804525761, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (11, 11, 1, 1, 1742939924, 1788679249, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (12, 12, 1, 0, 1774846577, 1795588471, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (13, 13, 1, 1, 1744781940, 1797714950, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (14, 14, 1, 0, 1771082751, 1824875282, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (15, 15, 1, 1, 1749006690, 1809062655, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (16, 16, 1, 1, 1753200616, 1778204417, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (17, 17, 1, 1, 1759443959, 1812687556, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (18, 18, 1, 0, 1752645446, 1817216221, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (19, 19, 1, 0, 1743217865, 1785222083, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (20, 20, 1, 0, 1764806851, 1791541667, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (21, 21, 1, 1, 1771017464, 1827718697, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (22, 22, 1, 0, 1765099160, 1825074378, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (23, 23, 1, 1, 1756632987, 1791212014, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (24, 24, 1, 0, 1748401048, 1832781468, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (25, 25, 1, 1, 1744156405, 1805495100, 0, 0, 0);
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (26, 26, 1, 1, 1762724523, 1784733566, 0, 0, 0);

-- mdl_assign_submission (8 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 2, 'submitted', 4, 0, 1773104333, 1766584211, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 1, 6, 'submitted', 0, 1, 1773104333, 1773631465, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 1, 6, 'submitted', 1, 0, 1773104333, 1772583315, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (4, 1, 6, 'submitted', 1, 0, 1773104333, 1772583315, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (5, 1, 6, 'submitted', 1, 1, 1773104333, 1772583315, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (6, 3, 8, 'submitted', 3, 0, 1773104333, 1770325180, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (7, 3, 8, 'submitted', 3, 1, 1773104333, 1770325180, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (8, 3, 12, 'submitted', 2, 1, 1773104333, 1769280960, 0);

-- mdl_assign_grades (7 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 2, 1, 66, 0, 1735149829, 1729600895);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 1, 4, 1, 0, 8, 1730832089, 1723843456);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 1, 4, 1, 0, 1, 1733071507, 1726872991);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (4, 1, 5, 1, 73, 5, 1729734890, 1723352637);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (5, 1, 6, 1, 20, 7, 1726703094, 1736361656);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (6, 1, 8, 1, -1.0, 8, 1715741754, 1728582677);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (7, 1, 8, 1, 54, 0, 1733413258, 1726754298);

-- mdl_forum_discussions (12 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1766180873, 1782786630, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 2, 'Test Discussion', 1, 0, 0, 0, 0, 1768458982, 1793216098, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 3, 'Test Discussion', 1, 0, 1, 0, 0, 1755443118, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (4, 1, 4, 'Test Discussion', 1, 0, 1, 0, 0, 1771692033, 1836129894, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (5, 1, 5, 'Test Discussion', 1, 0, 0, 0, 0, 1748161830, 1774271874, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (6, 1, 6, 'Test Discussion', 1, 0, 1, 0, 0, 1745891455, 1788942113, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (7, 1, 7, 'Test Discussion', 1, 0, 0, 0, 0, 1756044867, 1774531074, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (8, 1, 8, 'Test Discussion', 1, 0, 0, 0, 0, 1758489434, 1824448951, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (9, 1, 9, 'Test Discussion', 1, 0, 1, 0, 0, 1751980460, 1829344923, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (10, 1, 10, 'Test Discussion', 1, 0, 1, 0, 0, 1748883688, 1774185474, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (11, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1756414115, 1833834515, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (12, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1755107581, 1782800125, 1, 0);

-- mdl_forum_posts (4 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1773237012, 1714716517, 1, 'Re: Test', 'Test post', 1, 1, '', 0, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1772284674, 1727076305, 0, 'Re: Test', 'Test post', 1, 1, '', 7, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1773323412, 1713792161, 0, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (4, 1, 1, 0, 1770118018, 1741737600, 0, 'Re: Test', 'Test post', 1, 1, '', 2, 1, 0, 1, 1, 1);

-- UNCOVERED: workload_FEEDBACK_PENDING  (see header for reason)

-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT7_FraudRiskFlag                                       ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: fraud_HIGH_RISK_OVERRIDE_PATTERN
-- DT:   DT7_FraudRiskFlag
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 2.0
--   avgAssignGrade = 41.0
--   avgQuizScore = 25.13
--   daysSinceEnrolment = 50.0
--   finalGrade = 74.52
--   forumPostCount = 1.0
--   gradePassMark = 47.42
--   lessonGrade = 13.0
--   maxAttemptNumber = 4.0
--   moduleCompletionCount = 3.0
--   moduleCompletionPct = 33.33
--   overriddenGradeCount = 4.0
--   quizAttemptCount = 3.0
--   submittedLate = 0.0
--   totalAssignments = 3.0
--   unsubmittedCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 0, 0, 1705436048, 1734533311, 1710201600, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 1, 1725843858, 1761827344, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 20785556, 1753970263, 1800803493, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1771940260, 1772079450, 100, 1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1775587596, 1768501467, 100, 9, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1775578531, 1767088384, 94, -1, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 8, 100.0, 71, 1696166702, 1742741879, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 79.21, 7.18, 47.42, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 1681917452, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 547462855, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 981604707, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 1541379317, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 468534729, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 0, 2, 787231279, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 2, 1255867689, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 2, 372479048, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 0, 1277304667, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1770614036, 1809415510, 0, 0, 0);

-- mdl_assign_submission (3 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 4, 1, 1767720028, 1773270372, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 0, 0, 1771554914, 1767906727, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 3, 1, 'submitted', 4, 0, 1768751194, 1771134660, 0);

-- mdl_assign_grades (2 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 56, 4, 1733892753, 1738050083);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 26, 4, 1720370022, 1713196815);

-- mdl_quiz_attempts (3 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 2, 'finished', 49.22, 1765464858, 1718995891, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 5, 'finished', 0.1, 1767913672, 1737331707, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 2, 'finished', 26.06, 1761169949, 1710201600, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 79.9, 74.52, 1, 0, 0, 0, 0, '', 0.0, '2025-11-11', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 1, 1, 97.99, 29.97, 1, 0, 1, 0, 0, '', 0.0, '2026-03-04', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 1, 1, 88.65, 15.92, 1, 1, 1, 0, 0, '', 0.0, '2025-11-16', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 42.97, 34.54, 1, 0, 0, 0, 0, '', 0.0, '2025-12-27', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (3 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1744347794, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1773468875, 1827682255, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1762235644, 1774185474, 0, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (1 row)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1771878121, 1721615580, 0, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 0, 1, 1, 1);

-- mdl_lesson_grades (1 row)
INSERT INTO mdl_lesson_grades (id, lessonid, userid, grade, late, completed) VALUES (1, 1, 1, 13, 0, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: fraud_MEDIUM_RISK_RAPID_COMPLETION
-- DT:   DT7_FraudRiskFlag
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   avgAssignGrade = 28.37
--   avgQuizScore = 29.02
--   daysSinceEnrolment = 2.0
--   finalGrade = 78.44
--   forumPostCount = 1.0
--   gradePassMark = 54.39
--   lessonGrade = 30.12
--   maxAttemptNumber = 4.0
--   moduleCompletionCount = 9.0
--   moduleCompletionPct = 100.0
--   overriddenGradeCount = 3.0
--   quizAttemptCount = 4.0
--   submittedLate = 0.0
--   totalAssignments = 3.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 0, 1740485547, 1732468727, 1714947148, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 1, 1722692686, 1765449455, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 39932540, 1765829196, 1802093862, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1775078396, 1773729325, 100, 4, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1775301727, 1772984156, 100, 10, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1775099632, 1772712576, 100, 5, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 10, 100.0, 100.0, 1734709542, 1743562467, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 52.18, 3.64, 54.39, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 180120452, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 1, 964905668, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 196953391, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 750728226, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 114368302, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 803076184, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 175246342, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 0, 60532291, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 0, 1534815736, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1774837287, 1811694099, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 4, 1, 1766110531, 1771888053, 0);

-- mdl_assign_grades (3 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 30.2, 3, 1721668234, 1735909536);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 48.11, 3, 1714817527, 1715400697);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 6.79, 1, 1727236839, 1736067863);

-- mdl_quiz_attempts (4 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 1, 'finished', 4, 1772732104, 1735914616, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 5, 'finished', 13.1, 1764348984, 1715377463, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 2, 'finished', 18.08, 1769652694, 1736075349, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (4, 1, 1, 5, 'finished', 80.9, 1760805960, 1734400485, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 61.06, 75.24, 1, 0, 0, 0, 0, '', 0.0, '2026-01-12', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 1, 1, 96.56, 78.44, 0, 1, 1, 0, 0, '', 0.0, '2025-12-04', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 1, 1, 76.94, 77.81, 1, 0, 0, 0, 0, '', 0.0, '2025-10-29', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 13.84, 25.0, 1, 1, 0, 0, 0, '', 0.0, '2025-11-20', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (2 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1772440207, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1750632056, 0, 0, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1772808852, 1715218645, 0, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1766737376, 1736245631, 0, 'Re: Test', 'Test post', 1, 1, '', 4, 1, 0, 1, 1, 1);

-- mdl_lesson_grades (1 row)
INSERT INTO mdl_lesson_grades (id, lessonid, userid, grade, late, completed) VALUES (1, 1, 1, 30.12, 0, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: fraud_MEDIUM_RISK_IDENTITY
-- DT:   DT7_FraudRiskFlag
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 1.0
--   avgAssignGrade = 29.71
--   avgQuizScore = 118.92
--   daysSinceEnrolment = 50.0
--   finalGrade = 73.9
--   forumPostCount = 0.0
--   gradePassMark = 53.22
--   lessonGrade = 0.0
--   maxAttemptNumber = 2.0
--   moduleCompletionCount = 9.0
--   moduleCompletionPct = 90.0
--   overriddenGradeCount = 3.0
--   quizAttemptCount = 3.0
--   submittedLate = 1.0
--   totalAssignments = 1.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 1, 1, 1, 1591414023, 1735405448, 1729550436, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1719193185, 1772366961, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 2625139, 1768014067, 1797765550, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1770690100, 1769653300, 100, 4, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1775473261, 1772859213, 100, 10, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1773714100, 1772634219, 94, 10, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 4, 51.35, 100.0, 1701789757, 1742441419, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 2, 98.51, 9.11, 53.22, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 2, 1157672668, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 0, 2, 1001031928, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 0, 1, 1179967112, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 0, 1, 854027007, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 1138203202, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 1085328669, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 0, 960415034, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 743876748, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 0, 1191774787, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1770612757, 1795730379, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 2, 1, 1771246382, 1772977611, 0);

-- mdl_assign_grades (5 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 12, 0, 1717577094, 1721032055);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 11, 2, 1733421936, 1725782735);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 6.6, 8, 1735079876, 1713631341);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (4, 1, 1, 1, 63.03, 8, 1726939991, 1739257247);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (5, 1, 1, 1, 55.9, 4, 1739449605, 1739850459);

-- mdl_quiz_attempts (6 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 5, 'inprogress', 60.26, 1767570640, 1739000548, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 3, 'finished', 11.19, 1759301887, 1727310834, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 3, 'inprogress', 29.53, 1762873947, 1726477575, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (4, 1, 1, 3, 'abandoned', 94.72, 1767564536, 1733454616, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (5, 1, 1, 3, 'finished', 75.22, 1762228095, 1711465142, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (6, 1, 1, 5, 'finished', 96.79, 1765936115, 1714920429, 0, '', 0, 0);

-- mdl_grade_grades (3 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 50.18, 73.9, 1, 0, 0, 0, 0, '', 0.0, '2025-12-10', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 1, 1, 68.21, 33.53, 1, 0, 1, 0, 0, '', 0.0, '2025-12-11', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 60.04, 70.16, 1, 1, 1, 0, 0, '', 0.0, '2025-11-02', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (3 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1773652002, 1774185474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1765220843, 1778695278, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1747660076, 1774185474, 1, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 1, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (1 row)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1766695305, 1741394838, 0, 'Re: Test', 'Test post', 1, 1, '', 4, 1, 1, 1, 1, 1);

-- mdl_lesson_grades (1 row)
INSERT INTO mdl_lesson_grades (id, lessonid, userid, grade, late, completed) VALUES (1, 1, 1, 0.0, 0, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: fraud_LOW_RISK_NORMAL
-- DT:   DT7_FraudRiskFlag
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 1.0
--   avgAssignGrade = 50.67
--   avgQuizScore = 79.33
--   daysSinceEnrolment = 17.0
--   finalGrade = 68.11
--   forumPostCount = 2.0
--   gradePassMark = 44.45
--   lessonGrade = 67.0
--   maxAttemptNumber = 0.0
--   moduleCompletionCount = 7.0
--   moduleCompletionPct = 77.78
--   overriddenGradeCount = 0.0
--   quizAttemptCount = 3.0
--   submittedLate = 0.0
--   totalAssignments = 2.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 1, 1741737600, 1725040129, 1718920471, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1694569862, 1753895092, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 1562872, 1771010920, 1763526700, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1775161878, 1772297777, 100, -1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1770266734, 1770951744, 100, 5, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1771944095, 1773802402, 100, 1, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 10, 41.27, 100.0, 1719312091, 1744056243, 0, '', 1, 0, '', '');

-- mdl_grade_items (1 row)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 85.28, 3.81, 44.45, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (9 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 0, 1, 272705134, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 1016647789, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 1, 632767894, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 1379624748, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 0, 901265967, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 1731813609, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 0, 289737400, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 1042783528, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 2, 1401514937, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1773463957, 1833244757, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 0, 1, 1773434026, 1767301972, 0);

-- mdl_assign_grades (3 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 43, 7, 1738808772, 1715180355);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 76, 6, 1727156423, 1726117186);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 33, 2, 1739003207, 1740561216);

-- mdl_quiz_attempts (4 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 4, 'finished', 33.32, 1749142347, 1736242389, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 4, 'overdue', 21.65, 1758428165, 1727635559, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 5, 'finished', 30.59, 1771257825, 1741737600, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (4, 1, 1, 4, 'finished', 34.31, 1761440651, 1739586582, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 78.7, 2.62, 0, 1, 1, 0, 0, '', 0.0, '2026-01-25', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 1, 1, 66.76, 13.21, 0, 1, 0, 0, 0, '', 0.0, '2025-10-06', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 1, 1, 57.75, 68.11, 0, 0, 0, 0, 0, '', 0.0, '2025-11-14', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 59.54, 58.38, 0, 0, 0, 0, 0, '', 0.0, '2025-10-31', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (2 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1757955181, 1774617474, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1742044674, 1774617474, 0, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1772571236, 1712961302, 0, 'Re: Test', 'Test post', 1, 1, '', 6, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1771185055, 1714105881, 0, 'Re: Test', 'Test post', 1, 1, '', 10, 1, 0, 1, 1, 1);

-- mdl_lesson_grades (1 row)
INSERT INTO mdl_lesson_grades (id, lessonid, userid, grade, late, completed) VALUES (1, 1, 1, 67, 1, 0);

-- UNCOVERED: fraud_PLAGIARISM_RESUBMIT  (see header for reason)

-- ╔══════════════════════════════════════════════════════════╗
-- ║  DT8_ReEnrolmentEligibility                              ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════
-- Rule: reenrol_ELIGIBLE_STRONG
-- DT:   DT8_ReEnrolmentEligibility
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   badgeCount = 2.0
--   competencyProficient = 1.0
--   daysSinceEnrolment = 231.0
--   daysUntilEnrolExpiry = 267.0
--   failedItemCount = 2.0
--   finalGrade = 86.78
--   forumPostCount = 1.0
--   gradePassMark = 45.32
--   moduleCompletionPct = 90.0
--   overriddenGradeCount = 2.0
--   quizAttemptCount = 0.0
--   timecompleted = 1772428436.0
--   totalAssignments = 3.0
--   unsubmittedCount = 0.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 0, 1688823159, 1735771773, 1711178204, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 0, 1731921165, 1760466161, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1739771848, '2026-01-18', 1, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1700648348, '2025-11-22', 1, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 4, 0, 0, 0);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 38461060, 1766748042, 1763174422, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1771208500, 1771801052, 52, 1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1776366299, 1770476796, 38, 1, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1772047037, 1769394390, 100, 9, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 8, 72.75, 27, 1738112352, 1742244660, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 2, 54.77, 3.48, 43.99, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 2, 80.62, 1.25, 45.32, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 0, 77.88, 8.28, 44.0, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 1, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 1148120203, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 1744329600, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 1340456838, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 2, 799337786, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 0, 1, 580101226, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 2, 314836473, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 0, 0, 1284791877, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 0, 2, 781759239, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 0, 744892051, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1755048596, 1798103348, 0, 0, 0);

-- mdl_assign_submission (3 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 0, 1, 1767204893, 1770127264, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 2, 1, 1767204893, 1766628202, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (3, 3, 1, 'submitted', 0, 1, 1768003122, 1766077967, 0);

-- mdl_assign_grades (2 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 20, 6, 1714150203, 1725477113);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 24, 6, 1728070269, 1723435953);

-- mdl_quiz_attempts (1 row)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 1, 'inprogress', 25.87, 1773468322, 1737009139, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 35.83, 86.78, 0, 1, 0, 0, 0, '', 0.0, '2025-11-04', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 23.57, 2.92, 1, 0, 1, 0, 0, '', 0.0, '2025-12-09', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 13.74, 6.39, 1, 1, 0, 0, 0, '', 0.0, '2026-01-27', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 94.35, 49.44, 0, 1, 0, 0, 0, '', 0.0, '2025-10-22', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (4 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1742980784, 1790573755, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1743205070, 1833956789, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (3, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1760927708, 1794370695, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (4, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1753097276, 1774271874, 0, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 1772428436);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (3 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1772208848, 1739206260, 0, 'Re: Test', 'Test post', 1, 1, '', 1, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1770170378, 1728995201, 1, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (3, 1, 1, 0, 1771008518, 1712510361, 1, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 0, 1, 1, 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1739771848, '2026-01-18', 1, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1700648348, '2025-11-22', 1, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 4, 0, 0, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: reenrol_ELIGIBLE_CONDITIONAL
-- DT:   DT8_ReEnrolmentEligibility
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   badgeCount = 1.0
--   competencyProficient = 1.0
--   daysSinceEnrolment = 181.0
--   daysUntilEnrolExpiry = 712.0
--   failedItemCount = 0.0
--   finalGrade = 100.0
--   forumPostCount = 2.0
--   gradePassMark = 55.79
--   moduleCompletionPct = 80.0
--   overriddenGradeCount = 2.0
--   quizAttemptCount = 1.0
--   timecompleted = 0.0
--   totalAssignments = 2.0
--   unsubmittedCount = 1.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 0, 1585679726, 1740214232, 1728978314, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1679463215, 1749166207, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_badge_issued (1 row)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1721697924, '2026-01-03', 1, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 0, 0, 0, 0);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 37741762, 1743304376, 1740530469, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1777456384, 1770104131, 0, 0, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1769685004, 1771760534, 100, 4, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1773734830, 1769496481, 21, 7, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 10, 100.0, 100.0, 1696472146, 1742483169, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 2, 77.27, 5.03, 49.85, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 0, 76.14, 1.72, 55.79, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 75.66, 3.91, 55.47, NULL, 1, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 0, 547308074, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 640265296, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 0, 2, 1411316464, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 1224161969, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 2, 691046030, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 0, 1, 603118236, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 390153093, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 1744329600, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 0, 616743785, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 1, 265757032, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1759330207, 1836596379, 0, 0, 0);

-- mdl_assign_submission (2 rows)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 2, 1, 1769669281, 1771083891, 0);
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (2, 2, 1, 'submitted', 3, 0, 1766890556, 1773955669, 0);

-- mdl_assign_grades (4 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 48.66, 10, 1719790835, 1735488202);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 79.12, 7, 1719921684, 1739608576);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 20.77, 6, 1738627839, 1721065790);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (4, 1, 1, 1, 77, 0, 1724781203, 1714161426);

-- mdl_quiz_attempts (3 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 5, 'overdue', 1.36, 1758728256, 1710201600, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 5, 'finished', 75.23, 1766979981, 1731757076, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (3, 1, 1, 1, 'overdue', 40.87, 1768443705, 1739448973, 0, '', 0, 0);

-- mdl_grade_grades (5 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 60.12, 100.0, 0, 1, 0, 0, 0, '', 0.0, '2026-01-29', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 26.35, 100.0, 0, 1, 1, 0, 0, '', 0.0, '2025-12-27', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 78.25, 70.73, 1, 1, 0, 0, 0, '', 0.0, '2025-10-18', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 93.75, 66.56, 1, 1, 1, 0, 0, '', 0.0, '2026-01-20', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (5, 1, 1, 65.45, 77.58, 0, 0, 1, 0, 0, '', 0.0, '2026-01-05', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (2 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1758085368, 1810590379, 1, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1750816907, 1802842977, 1, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 0, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1767284136, 1738854249, 0, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 0, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1766852863, 1718791179, 0, 'Re: Test', 'Test post', 1, 1, '', 5, 1, 0, 1, 1, 1);

-- mdl_badge_issued (1 row)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1721697924, '2026-01-03', 1, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 0, 0, 0, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: reenrol_DEFERRED_INCOMPLETE
-- DT:   DT8_ReEnrolmentEligibility
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 0.0
--   badgeCount = 2.0
--   competencyProficient = 1.0
--   daysSinceEnrolment = 288.0
--   daysUntilEnrolExpiry = -20.0
--   failedItemCount = 2.0
--   finalGrade = 60.0
--   forumPostCount = 1.0
--   gradePassMark = 50.0
--   moduleCompletionPct = 60.0
--   overriddenGradeCount = 3.0
--   quizAttemptCount = 2.0
--   timecompleted = 0.0
--   totalAssignments = 3.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 1, 1, 1600917267, 1713921373, 1738276181, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 1, 0, 1721075378, 1755381793, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1712155873, '2025-11-20', 1, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1739972399, '2025-11-09', 0, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 5, 0, 0, 0);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 19546932, 1756447541, 1739250580, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1771251686, 1772661534, 100, 9, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1774071690, 1770113347, 100, 0, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1772955747, 1774414419, 100, 6, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 7, 100.0, 100.0, 1715307962, 1741985540, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 0, 85.8, 9.44, 50.0, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 0, 89.56, 8.86, 46.31, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 69.91, 8.15, 49.47, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 1419313226, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 1, 957596807, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 1481258645, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 1, 960203638, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 2, 757115353, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 1, 1373249886, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 0, 1441356425, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 1101843835, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 0, 306616566, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 0, 271076913, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 1, 1750116670, 1773206036, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 0, 1, 1772067648, 1770060219, 0);

-- mdl_assign_grades (3 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 74.48, 5, 1736659941, 1712468522);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 33.83, 10, 1731282405, 1713679982);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 76.92, 5, 1714678083, 1711689258);

-- mdl_quiz_attempts (2 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 2, 'finished', 2, 1769515741, 1725791757, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 4, 'finished', 63.17, 1771643345, 1714726501, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 75.33, 60.0, 1, 0, 1, 0, 0, '', 0.0, '2026-01-22', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 12.45, 36.8, 1, 1, 1, 0, 0, '', 0.0, '2026-01-05', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 97.37, 49.62, 1, 1, 1, 0, 0, '', 0.0, '2026-03-11', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 72.71, 7.89, 0, 1, 1, 0, 0, '', 0.0, '2026-03-06', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (2 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 1, 0, 0, 1767649540, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1759810399, 0, 1, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 0, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1769143625, 1720750624, 0, 'Re: Test', 'Test post', 1, 1, '', 10, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1767898568, 1714008303, 0, 'Re: Test', 'Test post', 1, 1, '', 0, 1, 0, 1, 1, 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1712155873, '2025-11-20', 1, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1739972399, '2025-11-09', 0, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 5, 0, 0, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: reenrol_BLOCKED_INTEGRITY
-- DT:   DT8_ReEnrolmentEligibility
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 1.0
--   badgeCount = 2.0
--   competencyProficient = 1.0
--   daysSinceEnrolment = 30.0
--   daysUntilEnrolExpiry = 94.0
--   failedItemCount = 4.0
--   finalGrade = 38.43
--   forumPostCount = 0.0
--   gradePassMark = 58.98
--   moduleCompletionPct = 70.0
--   overriddenGradeCount = 2.0
--   quizAttemptCount = 2.0
--   timecompleted = 0.0
--   totalAssignments = 3.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 1, 1724192780, 1724317413, 1722629404, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1694066161, 1771500356, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1725252027, '2025-12-09', 1, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1716459205, '2025-11-29', 0, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 5, 0, 0, 0);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 1, 23522852, 1761809847, 1793142803, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 1, 1773682934, 1773512874, 100, 2, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 0, 1772056597, 1772107223, 100, 7, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 1, 1771843008, 1768674007, 100, -1, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 10, 100.0, 100.0, 1707090334, 1743882397, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 1, 58.94, 5.59, 50.0, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 2, 67.22, 7.05, 54.72, NULL, 0, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 61.49, 7.83, 58.98, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 23000415, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 2, 1726383386, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 1, 0, 72175527, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 363961740, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 1, 513799693, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 0, 186493504, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 1, 758335883, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 1, 1258597575, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 2, 32999355, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 0, 1180241233, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1772418087, 1783170217, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 0, 0, 1774524830, 1765925370, 0);

-- mdl_assign_grades (3 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 36.88, 3, 1733279222, 1737188998);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 30.91, 5, 1713777939, 1715395107);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 42.03, 9, 1718712102, 1718969470);

-- mdl_quiz_attempts (2 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 3, 'finished', 61.19, 1769447342, 1723537948, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 2, 'finished', 41.32, 1771178461, 1728910298, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 21.45, 35.0, 1, 0, 0, 0, 0, '', 0.0, '2025-12-23', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 96.46, 0.53, 0, 0, 1, 0, 0, '', 0.0, '2025-10-30', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 43.54, 6.41, 0, 1, 0, 0, 0, '', 0.0, '2025-10-28', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 3.78, 38.43, 1, 1, 0, 0, 0, '', 0.0, '2026-02-16', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (2 rows)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1755705845, 0, 0, 0);
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (2, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1758928229, 0, 1, 0);

-- mdl_course_modules_completion (10 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (6, 6, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 1, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1768656514, 1714127770, 0, 'Re: Test', 'Test post', 1, 1, '', 8, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1773154042, 1728250642, 0, 'Re: Test', 'Test post', 1, 1, '', 9, 1, 1, 1, 1, 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1725252027, '2025-12-09', 1, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1716459205, '2025-11-29', 0, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 2, NULL, 1, 5, 0, 0, 0);

-- ═══════════════════════════════════════════════════════════
-- Rule: reenrol_BLOCKED_NON_ENGAGEMENT
-- DT:   DT8_ReEnrolmentEligibility
-- Triggered: True
-- Derived attribute values when triggered:
--   assignPenaltyActive = 1.0
--   badgeCount = 2.0
--   competencyProficient = 0.0
--   daysSinceEnrolment = 180.0
--   daysUntilEnrolExpiry = 569.0
--   failedItemCount = 3.0
--   finalGrade = 57.05
--   forumPostCount = 0.0
--   gradePassMark = 57.21
--   moduleCompletionPct = 20.0
--   overriddenGradeCount = 2.0
--   quizAttemptCount = 0.0
--   timecompleted = 0.0
--   totalAssignments = 2.0
--   unsubmittedCount = 2.0
-- ═══════════════════════════════════════════════════════════

-- mdl_user (1 row)
INSERT INTO mdl_user (id, username, confirmed, suspended, deleted, firstaccess, lastaccess, lastlogin, email, firstname, lastname, password, lang, theme, timezone, timecreated, timemodified, mnethostid, auth) VALUES (1, 'user1', 0, 0, 1, 1671038441, 1710403175, 1711759252, 'test1@test.com', 'Test', 'User', 'x', '', '', '99', 0, 0, 1, 'manual');

-- mdl_course (1 row)
INSERT INTO mdl_course (id, shortname, fullname, visible, enablecompletion, startdate, enddate, timecreated, timemodified, category, format, numsections, lang, newsitems, summary, summaryformat) VALUES (1, 'COURSE1', 'Test Course 1', 0, 1, 1720041760, 1749166555, 0, 0, 1, '', 10, '', 5, '', 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1696684450, '2025-11-02', 0, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1688533736, '2026-01-17', 0, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 4, NULL, 0, 4, 0, 0, 0);

-- mdl_enrol (1 row)
INSERT INTO mdl_enrol (id, courseid, enrol, status, enrolperiod, enrolstartdate, enrolenddate, timecreated, timemodified, roleid) VALUES (1, 1, '', 0, 40987427, 1771386798, 1779449171, 0, 0, 5);

-- mdl_assign (3 rows)
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (1, 1, 'Assignment 1', 0, 1771640500, 1767475816, 99, 0, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (2, 1, 'Assignment 2', 1, 1777456384, 1771779026, 88, 3, 0, '', 1, 0, 0, 0, 0);
INSERT INTO mdl_assign (id, course, name, nosubmissions, duedate, cutoffdate, grade, maxattempts, timemodified, intro, introformat, allowsubmissionsfromdate, gradingduedate, teamsubmission, preventlatesubmissions) VALUES (3, 1, 'Assignment 3', 0, 1769048500, 1773740883, 86, 1, 0, '', 1, 0, 0, 0, 0);

-- mdl_quiz (1 row)
INSERT INTO mdl_quiz (id, course, name, attempts, sumgrades, grade, timeopen, timeclose, timemodified, intro, introformat, timelimit, preferredbehaviour, overduehandling) VALUES (1, 1, 'Quiz 1', 2, 54.63, 93, 1702480621, 1741664747, 0, '', 1, 0, '', '');

-- mdl_grade_items (3 rows)
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (1, 1, '', 'course', 'quiz', 1, 2, 97.87, 5.72, 54.72, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (2, 1, '', 'course', 'quiz', 1, 0, 69.44, 5.26, 45.35, NULL, 1, 0, 0, 0, '', 0, 2, 1);
INSERT INTO mdl_grade_items (id, courseid, itemname, itemtype, itemmodule, iteminstance, gradetype, grademax, grademin, gradepass, hidden, locked, timecreated, timemodified, itemnumber, calculation, display, decimals, sortorder) VALUES (3, 1, '', 'course', 'quiz', 1, 2, 96.26, 6.15, 57.21, NULL, 0, 0, 0, 0, '', 0, 2, 1);

-- mdl_forum (1 row)
INSERT INTO mdl_forum (id, course, name, type, intro, introformat, timemodified, maxbytes, maxattachments, forcesubscribe, trackingtype, rsstype, rssarticles, assessed, assesstimestart, assesstimefinish, scale, grade_forum, grade_forum_notify) VALUES (1, 1, 'Forum 1', '', '', 1, 0, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0.0, 0);

-- mdl_course_modules (10 rows)
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (1, 1, 1, 1, 1, 1, 172679937, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (2, 1, 1, 2, 1, 0, 156861937, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (3, 1, 1, 3, 0, 2, 425232742, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (4, 1, 1, 4, 1, 2, 920752097, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (5, 1, 1, 5, 1, 0, 490056115, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (6, 1, 1, 6, 1, 2, 679806217, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (7, 1, 1, 7, 1, 2, 1211974193, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (8, 1, 1, 8, 1, 2, 601232307, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (9, 1, 1, 9, 1, 1, 703502052, 1, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO mdl_course_modules (id, course, module, instance, visible, completion, completionexpected, section, added, score, indent, groupmode, groupingid, showdescription, deletioninprogress, availability, lang) VALUES (10, 1, 1, 10, 1, 2, 260633812, 1, 0, 0, 0, 0, 0, 0, 0, '', '');

-- mdl_user_enrolments (1 row)
INSERT INTO mdl_user_enrolments (id, userid, enrolid, status, timestart, timeend, timecreated, timemodified, modifierid) VALUES (1, 1, 1, 0, 1759445799, 1824220161, 0, 0, 0);

-- mdl_assign_submission (1 row)
INSERT INTO mdl_assign_submission (id, assignment, userid, status, attemptnumber, latest, timemodified, timecreated, groupid) VALUES (1, 1, 1, 'submitted', 1, 1, 1769163972, 1772149862, 0);

-- mdl_assign_grades (4 rows)
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (1, 1, 1, 1, 0.09, 9, 1719198285, 1719391657);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (2, 2, 1, 1, 69.11, 0, 1739722015, 1713079466);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (3, 3, 1, 1, 68.26, 6, 1737316210, 1735009730);
INSERT INTO mdl_assign_grades (id, assignment, userid, grader, grade, attemptnumber, timemodified, timecreated) VALUES (4, 1, 1, 1, 1.72, 2, 1736327309, 1723298051);

-- mdl_quiz_attempts (2 rows)
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (1, 1, 1, 3, 'overdue', 94.91, 1761166969, 1727858479, 0, '', 0, 0);
INSERT INTO mdl_quiz_attempts (id, quiz, userid, attempt, state, sumgrades, timestart, timefinish, timemodified, layout, currentpage, preview) VALUES (2, 1, 1, 5, 'overdue', 41.32, 1756993438, 1725925009, 0, '', 0, 0);

-- mdl_grade_grades (4 rows)
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (1, 1, 1, 6.29, 29.73, 1, 0, 0, 0, 0, '', 0.0, '2025-12-14', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (2, 2, 1, 28.05, 14.0, 0, 0, 1, 0, 0, '', 0.0, '2025-12-26', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (3, 3, 1, 5.78, 7.49, 1, 1, 1, 0, 0, '', 0.0, '2025-10-16', '', '', 1, '', 1, 0.0, 0.0, 1, 0);
INSERT INTO mdl_grade_grades (id, itemid, userid, rawgrade, finalgrade, overridden, excluded, hidden, timecreated, timemodified, aggregationstatus, aggregationweight, locktime, exportfeedback, feedback, feedbackformat, information, informationformat, rawgrademax, rawgrademin, rawscaleid, usermodified) VALUES (4, 1, 1, 86.28, 57.05, 0, 1, 1, 0, 0, '', 0.0, '2026-02-02', '', '', 1, '', 1, 0.0, 0.0, 1, 0);

-- mdl_forum_discussions (1 row)
INSERT INTO mdl_forum_discussions (id, course, forum, name, userid, firstpost, assessed, timemodified, usermodified, timestart, timeend, pinned, timelocked) VALUES (1, 1, 1, 'Test Discussion', 1, 0, 0, 0, 0, 1755916922, 1774185474, 1, 0);

-- mdl_course_modules_completion (9 rows)
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (1, 1, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (2, 2, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (3, 3, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (4, 4, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (5, 5, 1, 1, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (7, 7, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (8, 8, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (9, 9, 1, 0, 1, NULL, 0);
INSERT INTO mdl_course_modules_completion (id, coursemoduleid, userid, completionstate, viewed, overrideby, timemodified) VALUES (10, 10, 1, 0, 1, NULL, 0);

-- mdl_forum_posts (2 rows)
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (1, 1, 1, 0, 1768207445, 1726421687, 1, 'Re: Test', 'Test post', 1, 1, '', 0, 1, 1, 1, 1, 1);
INSERT INTO mdl_forum_posts (id, discussion, userid, parent, created, modified, mailed, subject, message, messageformat, messagetrust, attachment, totalscore, mailnow, deleted, privatereplyto, wordcount, charcount) VALUES (2, 1, 1, 0, 1772954286, 1730811488, 0, 'Re: Test', 'Test post', 1, 1, '', 6, 1, 1, 1, 1, 1);

-- mdl_badge_issued (2 rows)
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (1, 1, 1, 1696684450, '2025-11-02', 0, 1);
INSERT INTO mdl_badge_issued (id, badgeid, userid, dateissued, dateexpire, visible, issuernotified) VALUES (2, 1, 1, 1688533736, '2026-01-17', 0, 1);

-- mdl_competency_usercomp (1 row)
INSERT INTO mdl_competency_usercomp (id, userid, competencyid, status, reviewerid, proficiency, grade, timecreated, timemodified, usermodified) VALUES (1, 1, 1, 4, NULL, 0, 4, 0, 0, 0);
