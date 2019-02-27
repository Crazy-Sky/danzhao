package com.danzhao.bean;

import java.util.ArrayList;
import java.util.List;

public class ExaminationExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ExaminationExample() {
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

        public Criteria andExatidIsNull() {
            addCriterion("exatId is null");
            return (Criteria) this;
        }

        public Criteria andExatidIsNotNull() {
            addCriterion("exatId is not null");
            return (Criteria) this;
        }

        public Criteria andExatidEqualTo(Integer value) {
            addCriterion("exatId =", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidNotEqualTo(Integer value) {
            addCriterion("exatId <>", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidGreaterThan(Integer value) {
            addCriterion("exatId >", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidGreaterThanOrEqualTo(Integer value) {
            addCriterion("exatId >=", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidLessThan(Integer value) {
            addCriterion("exatId <", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidLessThanOrEqualTo(Integer value) {
            addCriterion("exatId <=", value, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidIn(List<Integer> values) {
            addCriterion("exatId in", values, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidNotIn(List<Integer> values) {
            addCriterion("exatId not in", values, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidBetween(Integer value1, Integer value2) {
            addCriterion("exatId between", value1, value2, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatidNotBetween(Integer value1, Integer value2) {
            addCriterion("exatId not between", value1, value2, "exatid");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentIsNull() {
            addCriterion("exatSimpleContent is null");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentIsNotNull() {
            addCriterion("exatSimpleContent is not null");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentEqualTo(String value) {
            addCriterion("exatSimpleContent =", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentNotEqualTo(String value) {
            addCriterion("exatSimpleContent <>", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentGreaterThan(String value) {
            addCriterion("exatSimpleContent >", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentGreaterThanOrEqualTo(String value) {
            addCriterion("exatSimpleContent >=", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentLessThan(String value) {
            addCriterion("exatSimpleContent <", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentLessThanOrEqualTo(String value) {
            addCriterion("exatSimpleContent <=", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentLike(String value) {
            addCriterion("exatSimpleContent like", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentNotLike(String value) {
            addCriterion("exatSimpleContent not like", value, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentIn(List<String> values) {
            addCriterion("exatSimpleContent in", values, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentNotIn(List<String> values) {
            addCriterion("exatSimpleContent not in", values, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentBetween(String value1, String value2) {
            addCriterion("exatSimpleContent between", value1, value2, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExatsimplecontentNotBetween(String value1, String value2) {
            addCriterion("exatSimpleContent not between", value1, value2, "exatsimplecontent");
            return (Criteria) this;
        }

        public Criteria andExattypeIsNull() {
            addCriterion("exatType is null");
            return (Criteria) this;
        }

        public Criteria andExattypeIsNotNull() {
            addCriterion("exatType is not null");
            return (Criteria) this;
        }

        public Criteria andExattypeEqualTo(Integer value) {
            addCriterion("exatType =", value, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeNotEqualTo(Integer value) {
            addCriterion("exatType <>", value, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeGreaterThan(Integer value) {
            addCriterion("exatType >", value, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("exatType >=", value, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeLessThan(Integer value) {
            addCriterion("exatType <", value, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeLessThanOrEqualTo(Integer value) {
            addCriterion("exatType <=", value, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeIn(List<Integer> values) {
            addCriterion("exatType in", values, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeNotIn(List<Integer> values) {
            addCriterion("exatType not in", values, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeBetween(Integer value1, Integer value2) {
            addCriterion("exatType between", value1, value2, "exattype");
            return (Criteria) this;
        }

        public Criteria andExattypeNotBetween(Integer value1, Integer value2) {
            addCriterion("exatType not between", value1, value2, "exattype");
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