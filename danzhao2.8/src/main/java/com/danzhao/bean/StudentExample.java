package com.danzhao.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StudentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StudentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andStuidIsNull() {
            addCriterion("stuId is null");
            return (Criteria) this;
        }

        public Criteria andStuidIsNotNull() {
            addCriterion("stuId is not null");
            return (Criteria) this;
        }

        public Criteria andStuidEqualTo(Integer value) {
            addCriterion("stuId =", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidNotEqualTo(Integer value) {
            addCriterion("stuId <>", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidGreaterThan(Integer value) {
            addCriterion("stuId >", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidGreaterThanOrEqualTo(Integer value) {
            addCriterion("stuId >=", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidLessThan(Integer value) {
            addCriterion("stuId <", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidLessThanOrEqualTo(Integer value) {
            addCriterion("stuId <=", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidIn(List<Integer> values) {
            addCriterion("stuId in", values, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidNotIn(List<Integer> values) {
            addCriterion("stuId not in", values, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidBetween(Integer value1, Integer value2) {
            addCriterion("stuId between", value1, value2, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidNotBetween(Integer value1, Integer value2) {
            addCriterion("stuId not between", value1, value2, "stuid");
            return (Criteria) this;
        }

        public Criteria andStunumberIsNull() {
            addCriterion("stuNumber is null");
            return (Criteria) this;
        }

        public Criteria andStunumberIsNotNull() {
            addCriterion("stuNumber is not null");
            return (Criteria) this;
        }

        public Criteria andStunumberEqualTo(String value) {
            addCriterion("stuNumber =", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberNotEqualTo(String value) {
            addCriterion("stuNumber <>", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberGreaterThan(String value) {
            addCriterion("stuNumber >", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberGreaterThanOrEqualTo(String value) {
            addCriterion("stuNumber >=", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberLessThan(String value) {
            addCriterion("stuNumber <", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberLessThanOrEqualTo(String value) {
            addCriterion("stuNumber <=", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberLike(String value) {
            addCriterion("stuNumber like", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberNotLike(String value) {
            addCriterion("stuNumber not like", value, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberIn(List<String> values) {
            addCriterion("stuNumber in", values, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberNotIn(List<String> values) {
            addCriterion("stuNumber not in", values, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberBetween(String value1, String value2) {
            addCriterion("stuNumber between", value1, value2, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunumberNotBetween(String value1, String value2) {
            addCriterion("stuNumber not between", value1, value2, "stunumber");
            return (Criteria) this;
        }

        public Criteria andStunameIsNull() {
            addCriterion("stuName is null");
            return (Criteria) this;
        }

        public Criteria andStunameIsNotNull() {
            addCriterion("stuName is not null");
            return (Criteria) this;
        }

        public Criteria andStunameEqualTo(String value) {
            addCriterion("stuName =", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameNotEqualTo(String value) {
            addCriterion("stuName <>", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameGreaterThan(String value) {
            addCriterion("stuName >", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameGreaterThanOrEqualTo(String value) {
            addCriterion("stuName >=", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameLessThan(String value) {
            addCriterion("stuName <", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameLessThanOrEqualTo(String value) {
            addCriterion("stuName <=", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameLike(String value) {
            addCriterion("stuName like", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameNotLike(String value) {
            addCriterion("stuName not like", value, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameIn(List<String> values) {
            addCriterion("stuName in", values, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameNotIn(List<String> values) {
            addCriterion("stuName not in", values, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameBetween(String value1, String value2) {
            addCriterion("stuName between", value1, value2, "stuname");
            return (Criteria) this;
        }

        public Criteria andStunameNotBetween(String value1, String value2) {
            addCriterion("stuName not between", value1, value2, "stuname");
            return (Criteria) this;
        }

        public Criteria andStusexIsNull() {
            addCriterion("stuSex is null");
            return (Criteria) this;
        }

        public Criteria andStusexIsNotNull() {
            addCriterion("stuSex is not null");
            return (Criteria) this;
        }

        public Criteria andStusexEqualTo(String value) {
            addCriterion("stuSex =", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexNotEqualTo(String value) {
            addCriterion("stuSex <>", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexGreaterThan(String value) {
            addCriterion("stuSex >", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexGreaterThanOrEqualTo(String value) {
            addCriterion("stuSex >=", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexLessThan(String value) {
            addCriterion("stuSex <", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexLessThanOrEqualTo(String value) {
            addCriterion("stuSex <=", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexLike(String value) {
            addCriterion("stuSex like", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexNotLike(String value) {
            addCriterion("stuSex not like", value, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexIn(List<String> values) {
            addCriterion("stuSex in", values, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexNotIn(List<String> values) {
            addCriterion("stuSex not in", values, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexBetween(String value1, String value2) {
            addCriterion("stuSex between", value1, value2, "stusex");
            return (Criteria) this;
        }

        public Criteria andStusexNotBetween(String value1, String value2) {
            addCriterion("stuSex not between", value1, value2, "stusex");
            return (Criteria) this;
        }

        public Criteria andStutel1IsNull() {
            addCriterion("stuTel1 is null");
            return (Criteria) this;
        }

        public Criteria andStutel1IsNotNull() {
            addCriterion("stuTel1 is not null");
            return (Criteria) this;
        }

        public Criteria andStutel1EqualTo(String value) {
            addCriterion("stuTel1 =", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1NotEqualTo(String value) {
            addCriterion("stuTel1 <>", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1GreaterThan(String value) {
            addCriterion("stuTel1 >", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1GreaterThanOrEqualTo(String value) {
            addCriterion("stuTel1 >=", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1LessThan(String value) {
            addCriterion("stuTel1 <", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1LessThanOrEqualTo(String value) {
            addCriterion("stuTel1 <=", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1Like(String value) {
            addCriterion("stuTel1 like", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1NotLike(String value) {
            addCriterion("stuTel1 not like", value, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1In(List<String> values) {
            addCriterion("stuTel1 in", values, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1NotIn(List<String> values) {
            addCriterion("stuTel1 not in", values, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1Between(String value1, String value2) {
            addCriterion("stuTel1 between", value1, value2, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel1NotBetween(String value1, String value2) {
            addCriterion("stuTel1 not between", value1, value2, "stutel1");
            return (Criteria) this;
        }

        public Criteria andStutel2IsNull() {
            addCriterion("stuTel2 is null");
            return (Criteria) this;
        }

        public Criteria andStutel2IsNotNull() {
            addCriterion("stuTel2 is not null");
            return (Criteria) this;
        }

        public Criteria andStutel2EqualTo(String value) {
            addCriterion("stuTel2 =", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2NotEqualTo(String value) {
            addCriterion("stuTel2 <>", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2GreaterThan(String value) {
            addCriterion("stuTel2 >", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2GreaterThanOrEqualTo(String value) {
            addCriterion("stuTel2 >=", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2LessThan(String value) {
            addCriterion("stuTel2 <", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2LessThanOrEqualTo(String value) {
            addCriterion("stuTel2 <=", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2Like(String value) {
            addCriterion("stuTel2 like", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2NotLike(String value) {
            addCriterion("stuTel2 not like", value, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2In(List<String> values) {
            addCriterion("stuTel2 in", values, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2NotIn(List<String> values) {
            addCriterion("stuTel2 not in", values, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2Between(String value1, String value2) {
            addCriterion("stuTel2 between", value1, value2, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel2NotBetween(String value1, String value2) {
            addCriterion("stuTel2 not between", value1, value2, "stutel2");
            return (Criteria) this;
        }

        public Criteria andStutel3IsNull() {
            addCriterion("stuTel3 is null");
            return (Criteria) this;
        }

        public Criteria andStutel3IsNotNull() {
            addCriterion("stuTel3 is not null");
            return (Criteria) this;
        }

        public Criteria andStutel3EqualTo(String value) {
            addCriterion("stuTel3 =", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3NotEqualTo(String value) {
            addCriterion("stuTel3 <>", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3GreaterThan(String value) {
            addCriterion("stuTel3 >", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3GreaterThanOrEqualTo(String value) {
            addCriterion("stuTel3 >=", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3LessThan(String value) {
            addCriterion("stuTel3 <", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3LessThanOrEqualTo(String value) {
            addCriterion("stuTel3 <=", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3Like(String value) {
            addCriterion("stuTel3 like", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3NotLike(String value) {
            addCriterion("stuTel3 not like", value, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3In(List<String> values) {
            addCriterion("stuTel3 in", values, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3NotIn(List<String> values) {
            addCriterion("stuTel3 not in", values, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3Between(String value1, String value2) {
            addCriterion("stuTel3 between", value1, value2, "stutel3");
            return (Criteria) this;
        }

        public Criteria andStutel3NotBetween(String value1, String value2) {
            addCriterion("stuTel3 not between", value1, value2, "stutel3");
            return (Criteria) this;
        }

        public Criteria andKtypeIsNull() {
            addCriterion("kType is null");
            return (Criteria) this;
        }

        public Criteria andKtypeIsNotNull() {
            addCriterion("kType is not null");
            return (Criteria) this;
        }

        public Criteria andKtypeEqualTo(String value) {
            addCriterion("kType =", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeNotEqualTo(String value) {
            addCriterion("kType <>", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeGreaterThan(String value) {
            addCriterion("kType >", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeGreaterThanOrEqualTo(String value) {
            addCriterion("kType >=", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeLessThan(String value) {
            addCriterion("kType <", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeLessThanOrEqualTo(String value) {
            addCriterion("kType <=", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeLike(String value) {
            addCriterion("kType like", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeNotLike(String value) {
            addCriterion("kType not like", value, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeIn(List<String> values) {
            addCriterion("kType in", values, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeNotIn(List<String> values) {
            addCriterion("kType not in", values, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeBetween(String value1, String value2) {
            addCriterion("kType between", value1, value2, "ktype");
            return (Criteria) this;
        }

        public Criteria andKtypeNotBetween(String value1, String value2) {
            addCriterion("kType not between", value1, value2, "ktype");
            return (Criteria) this;
        }

        public Criteria andZgtypeIsNull() {
            addCriterion("zgType is null");
            return (Criteria) this;
        }

        public Criteria andZgtypeIsNotNull() {
            addCriterion("zgType is not null");
            return (Criteria) this;
        }

        public Criteria andZgtypeEqualTo(String value) {
            addCriterion("zgType =", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeNotEqualTo(String value) {
            addCriterion("zgType <>", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeGreaterThan(String value) {
            addCriterion("zgType >", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeGreaterThanOrEqualTo(String value) {
            addCriterion("zgType >=", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeLessThan(String value) {
            addCriterion("zgType <", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeLessThanOrEqualTo(String value) {
            addCriterion("zgType <=", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeLike(String value) {
            addCriterion("zgType like", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeNotLike(String value) {
            addCriterion("zgType not like", value, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeIn(List<String> values) {
            addCriterion("zgType in", values, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeNotIn(List<String> values) {
            addCriterion("zgType not in", values, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeBetween(String value1, String value2) {
            addCriterion("zgType between", value1, value2, "zgtype");
            return (Criteria) this;
        }

        public Criteria andZgtypeNotBetween(String value1, String value2) {
            addCriterion("zgType not between", value1, value2, "zgtype");
            return (Criteria) this;
        }

        public Criteria andSchoolnameIsNull() {
            addCriterion("schoolName is null");
            return (Criteria) this;
        }

        public Criteria andSchoolnameIsNotNull() {
            addCriterion("schoolName is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolnameEqualTo(String value) {
            addCriterion("schoolName =", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameNotEqualTo(String value) {
            addCriterion("schoolName <>", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameGreaterThan(String value) {
            addCriterion("schoolName >", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameGreaterThanOrEqualTo(String value) {
            addCriterion("schoolName >=", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameLessThan(String value) {
            addCriterion("schoolName <", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameLessThanOrEqualTo(String value) {
            addCriterion("schoolName <=", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameLike(String value) {
            addCriterion("schoolName like", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameNotLike(String value) {
            addCriterion("schoolName not like", value, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameIn(List<String> values) {
            addCriterion("schoolName in", values, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameNotIn(List<String> values) {
            addCriterion("schoolName not in", values, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameBetween(String value1, String value2) {
            addCriterion("schoolName between", value1, value2, "schoolname");
            return (Criteria) this;
        }

        public Criteria andSchoolnameNotBetween(String value1, String value2) {
            addCriterion("schoolName not between", value1, value2, "schoolname");
            return (Criteria) this;
        }

        public Criteria andStustatusIsNull() {
            addCriterion("stuStatus is null");
            return (Criteria) this;
        }

        public Criteria andStustatusIsNotNull() {
            addCriterion("stuStatus is not null");
            return (Criteria) this;
        }

        public Criteria andStustatusEqualTo(Integer value) {
            addCriterion("stuStatus =", value, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusNotEqualTo(Integer value) {
            addCriterion("stuStatus <>", value, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusGreaterThan(Integer value) {
            addCriterion("stuStatus >", value, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("stuStatus >=", value, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusLessThan(Integer value) {
            addCriterion("stuStatus <", value, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusLessThanOrEqualTo(Integer value) {
            addCriterion("stuStatus <=", value, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusIn(List<Integer> values) {
            addCriterion("stuStatus in", values, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusNotIn(List<Integer> values) {
            addCriterion("stuStatus not in", values, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusBetween(Integer value1, Integer value2) {
            addCriterion("stuStatus between", value1, value2, "stustatus");
            return (Criteria) this;
        }

        public Criteria andStustatusNotBetween(Integer value1, Integer value2) {
            addCriterion("stuStatus not between", value1, value2, "stustatus");
            return (Criteria) this;
        }

        public Criteria andDeptidIsNull() {
            addCriterion("deptid is null");
            return (Criteria) this;
        }

        public Criteria andDeptidIsNotNull() {
            addCriterion("deptid is not null");
            return (Criteria) this;
        }

        public Criteria andDeptidEqualTo(Integer value) {
            addCriterion("deptid =", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidNotEqualTo(Integer value) {
            addCriterion("deptid <>", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidGreaterThan(Integer value) {
            addCriterion("deptid >", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidGreaterThanOrEqualTo(Integer value) {
            addCriterion("deptid >=", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidLessThan(Integer value) {
            addCriterion("deptid <", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidLessThanOrEqualTo(Integer value) {
            addCriterion("deptid <=", value, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidIn(List<Integer> values) {
            addCriterion("deptid in", values, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidNotIn(List<Integer> values) {
            addCriterion("deptid not in", values, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidBetween(Integer value1, Integer value2) {
            addCriterion("deptid between", value1, value2, "deptid");
            return (Criteria) this;
        }

        public Criteria andDeptidNotBetween(Integer value1, Integer value2) {
            addCriterion("deptid not between", value1, value2, "deptid");
            return (Criteria) this;
        }

        public Criteria andProfidIsNull() {
            addCriterion("profid is null");
            return (Criteria) this;
        }

        public Criteria andProfidIsNotNull() {
            addCriterion("profid is not null");
            return (Criteria) this;
        }

        public Criteria andProfidEqualTo(Integer value) {
            addCriterion("profid =", value, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidNotEqualTo(Integer value) {
            addCriterion("profid <>", value, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidGreaterThan(Integer value) {
            addCriterion("profid >", value, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidGreaterThanOrEqualTo(Integer value) {
            addCriterion("profid >=", value, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidLessThan(Integer value) {
            addCriterion("profid <", value, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidLessThanOrEqualTo(Integer value) {
            addCriterion("profid <=", value, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidIn(List<Integer> values) {
            addCriterion("profid in", values, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidNotIn(List<Integer> values) {
            addCriterion("profid not in", values, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidBetween(Integer value1, Integer value2) {
            addCriterion("profid between", value1, value2, "profid");
            return (Criteria) this;
        }

        public Criteria andProfidNotBetween(Integer value1, Integer value2) {
            addCriterion("profid not between", value1, value2, "profid");
            return (Criteria) this;
        }

        public Criteria andStupwdIsNull() {
            addCriterion("stuPwd is null");
            return (Criteria) this;
        }

        public Criteria andStupwdIsNotNull() {
            addCriterion("stuPwd is not null");
            return (Criteria) this;
        }

        public Criteria andStupwdEqualTo(String value) {
            addCriterion("stuPwd =", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdNotEqualTo(String value) {
            addCriterion("stuPwd <>", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdGreaterThan(String value) {
            addCriterion("stuPwd >", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdGreaterThanOrEqualTo(String value) {
            addCriterion("stuPwd >=", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdLessThan(String value) {
            addCriterion("stuPwd <", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdLessThanOrEqualTo(String value) {
            addCriterion("stuPwd <=", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdLike(String value) {
            addCriterion("stuPwd like", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdNotLike(String value) {
            addCriterion("stuPwd not like", value, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdIn(List<String> values) {
            addCriterion("stuPwd in", values, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdNotIn(List<String> values) {
            addCriterion("stuPwd not in", values, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdBetween(String value1, String value2) {
            addCriterion("stuPwd between", value1, value2, "stupwd");
            return (Criteria) this;
        }

        public Criteria andStupwdNotBetween(String value1, String value2) {
            addCriterion("stuPwd not between", value1, value2, "stupwd");
            return (Criteria) this;
        }

        public Criteria andExamnumberIsNull() {
            addCriterion("examNumber is null");
            return (Criteria) this;
        }

        public Criteria andExamnumberIsNotNull() {
            addCriterion("examNumber is not null");
            return (Criteria) this;
        }

        public Criteria andExamnumberEqualTo(String value) {
            addCriterion("examNumber =", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberNotEqualTo(String value) {
            addCriterion("examNumber <>", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberGreaterThan(String value) {
            addCriterion("examNumber >", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberGreaterThanOrEqualTo(String value) {
            addCriterion("examNumber >=", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberLessThan(String value) {
            addCriterion("examNumber <", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberLessThanOrEqualTo(String value) {
            addCriterion("examNumber <=", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberLike(String value) {
            addCriterion("examNumber like", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberNotLike(String value) {
            addCriterion("examNumber not like", value, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberIn(List<String> values) {
            addCriterion("examNumber in", values, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberNotIn(List<String> values) {
            addCriterion("examNumber not in", values, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberBetween(String value1, String value2) {
            addCriterion("examNumber between", value1, value2, "examnumber");
            return (Criteria) this;
        }

        public Criteria andExamnumberNotBetween(String value1, String value2) {
            addCriterion("examNumber not between", value1, value2, "examnumber");
            return (Criteria) this;
        }

        public Criteria andIdcardIsNull() {
            addCriterion("IDCard is null");
            return (Criteria) this;
        }

        public Criteria andIdcardIsNotNull() {
            addCriterion("IDCard is not null");
            return (Criteria) this;
        }

        public Criteria andIdcardEqualTo(String value) {
            addCriterion("IDCard =", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotEqualTo(String value) {
            addCriterion("IDCard <>", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardGreaterThan(String value) {
            addCriterion("IDCard >", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardGreaterThanOrEqualTo(String value) {
            addCriterion("IDCard >=", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardLessThan(String value) {
            addCriterion("IDCard <", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardLessThanOrEqualTo(String value) {
            addCriterion("IDCard <=", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardLike(String value) {
            addCriterion("IDCard like", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotLike(String value) {
            addCriterion("IDCard not like", value, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardIn(List<String> values) {
            addCriterion("IDCard in", values, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotIn(List<String> values) {
            addCriterion("IDCard not in", values, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardBetween(String value1, String value2) {
            addCriterion("IDCard between", value1, value2, "idcard");
            return (Criteria) this;
        }

        public Criteria andIdcardNotBetween(String value1, String value2) {
            addCriterion("IDCard not between", value1, value2, "idcard");
            return (Criteria) this;
        }

        public Criteria andEridIsNull() {
            addCriterion("erId is null");
            return (Criteria) this;
        }

        public Criteria andEridIsNotNull() {
            addCriterion("erId is not null");
            return (Criteria) this;
        }

        public Criteria andEridEqualTo(Integer value) {
            addCriterion("erId =", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridNotEqualTo(Integer value) {
            addCriterion("erId <>", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridGreaterThan(Integer value) {
            addCriterion("erId >", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridGreaterThanOrEqualTo(Integer value) {
            addCriterion("erId >=", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridLessThan(Integer value) {
            addCriterion("erId <", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridLessThanOrEqualTo(Integer value) {
            addCriterion("erId <=", value, "erid");
            return (Criteria) this;
        }

        public Criteria andEridIn(List<Integer> values) {
            addCriterion("erId in", values, "erid");
            return (Criteria) this;
        }

        public Criteria andEridNotIn(List<Integer> values) {
            addCriterion("erId not in", values, "erid");
            return (Criteria) this;
        }

        public Criteria andEridBetween(Integer value1, Integer value2) {
            addCriterion("erId between", value1, value2, "erid");
            return (Criteria) this;
        }

        public Criteria andEridNotBetween(Integer value1, Integer value2) {
            addCriterion("erId not between", value1, value2, "erid");
            return (Criteria) this;
        }

        public Criteria andTesttimeIsNull() {
            addCriterion("testTime is null");
            return (Criteria) this;
        }

        public Criteria andTesttimeIsNotNull() {
            addCriterion("testTime is not null");
            return (Criteria) this;
        }

        public Criteria andTesttimeEqualTo(String value) {
            addCriterion("testTime =", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeNotEqualTo(String value) {
            addCriterion("testTime <>", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeGreaterThan(String value) {
            addCriterion("testTime >", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeGreaterThanOrEqualTo(String value) {
            addCriterion("testTime >=", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeLessThan(String value) {
            addCriterion("testTime <", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeLessThanOrEqualTo(String value) {
            addCriterion("testTime <=", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeLike(String value) {
            addCriterion("testTime like", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeNotLike(String value) {
            addCriterion("testTime not like", value, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeIn(List<String> values) {
            addCriterion("testTime in", values, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeNotIn(List<String> values) {
            addCriterion("testTime not in", values, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeBetween(String value1, String value2) {
            addCriterion("testTime between", value1, value2, "testtime");
            return (Criteria) this;
        }

        public Criteria andTesttimeNotBetween(String value1, String value2) {
            addCriterion("testTime not between", value1, value2, "testtime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeIsNull() {
            addCriterion("teststarttime is null");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeIsNotNull() {
            addCriterion("teststarttime is not null");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeEqualTo(Date value) {
            addCriterion("teststarttime =", value, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeNotEqualTo(Date value) {
            addCriterion("teststarttime <>", value, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeGreaterThan(Date value) {
            addCriterion("teststarttime >", value, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeGreaterThanOrEqualTo(Date value) {
            addCriterion("teststarttime >=", value, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeLessThan(Date value) {
            addCriterion("teststarttime <", value, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeLessThanOrEqualTo(Date value) {
            addCriterion("teststarttime <=", value, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeIn(List<Date> values) {
            addCriterion("teststarttime in", values, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeNotIn(List<Date> values) {
            addCriterion("teststarttime not in", values, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeBetween(Date value1, Date value2) {
            addCriterion("teststarttime between", value1, value2, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTeststarttimeNotBetween(Date value1, Date value2) {
            addCriterion("teststarttime not between", value1, value2, "teststarttime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeIsNull() {
            addCriterion("testendtime is null");
            return (Criteria) this;
        }

        public Criteria andTestendtimeIsNotNull() {
            addCriterion("testendtime is not null");
            return (Criteria) this;
        }

        public Criteria andTestendtimeEqualTo(Date value) {
            addCriterion("testendtime =", value, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeNotEqualTo(Date value) {
            addCriterion("testendtime <>", value, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeGreaterThan(Date value) {
            addCriterion("testendtime >", value, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("testendtime >=", value, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeLessThan(Date value) {
            addCriterion("testendtime <", value, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeLessThanOrEqualTo(Date value) {
            addCriterion("testendtime <=", value, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeIn(List<Date> values) {
            addCriterion("testendtime in", values, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeNotIn(List<Date> values) {
            addCriterion("testendtime not in", values, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeBetween(Date value1, Date value2) {
            addCriterion("testendtime between", value1, value2, "testendtime");
            return (Criteria) this;
        }

        public Criteria andTestendtimeNotBetween(Date value1, Date value2) {
            addCriterion("testendtime not between", value1, value2, "testendtime");
            return (Criteria) this;
        }

        public Criteria andExatidIsNull() {
            addCriterion("exatid is null");
            return (Criteria) this;
        }

        public Criteria andExatidIsNotNull() {
            addCriterion("exatid is not null");
            return (Criteria) this;
        }

        public Criteria andExatidEqualTo(Integer value) {
            addCriterion("exatid =", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidNotEqualTo(Integer value) {
            addCriterion("exatid <>", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidGreaterThan(Integer value) {
            addCriterion("exatid >", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidGreaterThanOrEqualTo(Integer value) {
            addCriterion("exatid >=", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidLessThan(Integer value) {
            addCriterion("exatid <", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidLessThanOrEqualTo(Integer value) {
            addCriterion("exatid <=", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidIn(List<Integer> values) {
            addCriterion("exatid in", values, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidNotIn(List<Integer> values) {
            addCriterion("exatid not in", values, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidBetween(Integer value1, Integer value2) {
            addCriterion("exatid between", value1, value2, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidNotBetween(Integer value1, Integer value2) {
            addCriterion("exatid not between", value1, value2, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatid2IsNull() {
            addCriterion("exatid2 is null");
            return (Criteria) this;
        }

        public Criteria andExatid2IsNotNull() {
            addCriterion("exatid2 is not null");
            return (Criteria) this;
        }

        public Criteria andExatid2EqualTo(Integer value) {
            addCriterion("exatid2 =", value, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2NotEqualTo(Integer value) {
            addCriterion("exatid2 <>", value, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2GreaterThan(Integer value) {
            addCriterion("exatid2 >", value, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2GreaterThanOrEqualTo(Integer value) {
            addCriterion("exatid2 >=", value, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2LessThan(Integer value) {
            addCriterion("exatid2 <", value, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2LessThanOrEqualTo(Integer value) {
            addCriterion("exatid2 <=", value, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2In(List<Integer> values) {
            addCriterion("exatid2 in", values, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2NotIn(List<Integer> values) {
            addCriterion("exatid2 not in", values, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2Between(Integer value1, Integer value2) {
            addCriterion("exatid2 between", value1, value2, "exatid2");
            return (Criteria) this;
        }

        public Criteria andExatid2NotBetween(Integer value1, Integer value2) {
            addCriterion("exatid2 not between", value1, value2, "exatid2");
            return (Criteria) this;
        }

        public Criteria andTotalscoreIsNull() {
            addCriterion("totalscore is null");
            return (Criteria) this;
        }

        public Criteria andTotalscoreIsNotNull() {
            addCriterion("totalscore is not null");
            return (Criteria) this;
        }

        public Criteria andTotalscoreEqualTo(Float value) {
            addCriterion("totalscore =", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreNotEqualTo(Float value) {
            addCriterion("totalscore <>", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreGreaterThan(Float value) {
            addCriterion("totalscore >", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreGreaterThanOrEqualTo(Float value) {
            addCriterion("totalscore >=", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreLessThan(Float value) {
            addCriterion("totalscore <", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreLessThanOrEqualTo(Float value) {
            addCriterion("totalscore <=", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreIn(List<Float> values) {
            addCriterion("totalscore in", values, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreNotIn(List<Float> values) {
            addCriterion("totalscore not in", values, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreBetween(Float value1, Float value2) {
            addCriterion("totalscore between", value1, value2, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreNotBetween(Float value1, Float value2) {
            addCriterion("totalscore not between", value1, value2, "totalscore");
            return (Criteria) this;
        }

        public Criteria andEhIsNull() {
            addCriterion("eh is null");
            return (Criteria) this;
        }

        public Criteria andEhIsNotNull() {
            addCriterion("eh is not null");
            return (Criteria) this;
        }

        public Criteria andEhEqualTo(Integer value) {
            addCriterion("eh =", value, "eh");
            return (Criteria) this;
        }

        public Criteria andEhNotEqualTo(Integer value) {
            addCriterion("eh <>", value, "eh");
            return (Criteria) this;
        }

        public Criteria andEhGreaterThan(Integer value) {
            addCriterion("eh >", value, "eh");
            return (Criteria) this;
        }

        public Criteria andEhGreaterThanOrEqualTo(Integer value) {
            addCriterion("eh >=", value, "eh");
            return (Criteria) this;
        }

        public Criteria andEhLessThan(Integer value) {
            addCriterion("eh <", value, "eh");
            return (Criteria) this;
        }

        public Criteria andEhLessThanOrEqualTo(Integer value) {
            addCriterion("eh <=", value, "eh");
            return (Criteria) this;
        }

        public Criteria andEhIn(List<Integer> values) {
            addCriterion("eh in", values, "eh");
            return (Criteria) this;
        }

        public Criteria andEhNotIn(List<Integer> values) {
            addCriterion("eh not in", values, "eh");
            return (Criteria) this;
        }

        public Criteria andEhBetween(Integer value1, Integer value2) {
            addCriterion("eh between", value1, value2, "eh");
            return (Criteria) this;
        }

        public Criteria andEhNotBetween(Integer value1, Integer value2) {
            addCriterion("eh not between", value1, value2, "eh");
            return (Criteria) this;
        }

        public Criteria andRoleidIsNull() {
            addCriterion("roleId is null");
            return (Criteria) this;
        }

        public Criteria andRoleidIsNotNull() {
            addCriterion("roleId is not null");
            return (Criteria) this;
        }

        public Criteria andRoleidEqualTo(Integer value) {
            addCriterion("roleId =", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidNotEqualTo(Integer value) {
            addCriterion("roleId <>", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidGreaterThan(Integer value) {
            addCriterion("roleId >", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidGreaterThanOrEqualTo(Integer value) {
            addCriterion("roleId >=", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidLessThan(Integer value) {
            addCriterion("roleId <", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidLessThanOrEqualTo(Integer value) {
            addCriterion("roleId <=", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidIn(List<Integer> values) {
            addCriterion("roleId in", values, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidNotIn(List<Integer> values) {
            addCriterion("roleId not in", values, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidBetween(Integer value1, Integer value2) {
            addCriterion("roleId between", value1, value2, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidNotBetween(Integer value1, Integer value2) {
            addCriterion("roleId not between", value1, value2, "roleid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}