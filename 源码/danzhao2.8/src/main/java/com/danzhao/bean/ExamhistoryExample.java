package com.danzhao.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ExamhistoryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ExamhistoryExample() {
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

        public Criteria andEhidIsNull() {
            addCriterion("ehId is null");
            return (Criteria) this;
        }

        public Criteria andEhidIsNotNull() {
            addCriterion("ehId is not null");
            return (Criteria) this;
        }

        public Criteria andEhidEqualTo(Integer value) {
            addCriterion("ehId =", value, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidNotEqualTo(Integer value) {
            addCriterion("ehId <>", value, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidGreaterThan(Integer value) {
            addCriterion("ehId >", value, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidGreaterThanOrEqualTo(Integer value) {
            addCriterion("ehId >=", value, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidLessThan(Integer value) {
            addCriterion("ehId <", value, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidLessThanOrEqualTo(Integer value) {
            addCriterion("ehId <=", value, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidIn(List<Integer> values) {
            addCriterion("ehId in", values, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidNotIn(List<Integer> values) {
            addCriterion("ehId not in", values, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidBetween(Integer value1, Integer value2) {
            addCriterion("ehId between", value1, value2, "ehid");
            return (Criteria) this;
        }

        public Criteria andEhidNotBetween(Integer value1, Integer value2) {
            addCriterion("ehId not between", value1, value2, "ehid");
            return (Criteria) this;
        }

        public Criteria andStartIsNull() {
            addCriterion("start is null");
            return (Criteria) this;
        }

        public Criteria andStartIsNotNull() {
            addCriterion("start is not null");
            return (Criteria) this;
        }

        public Criteria andStartEqualTo(Date value) {
            addCriterion("start =", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartNotEqualTo(Date value) {
            addCriterion("start <>", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartGreaterThan(Date value) {
            addCriterion("start >", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartGreaterThanOrEqualTo(Date value) {
            addCriterion("start >=", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartLessThan(Date value) {
            addCriterion("start <", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartLessThanOrEqualTo(Date value) {
            addCriterion("start <=", value, "start");
            return (Criteria) this;
        }

        public Criteria andStartIn(List<Date> values) {
            addCriterion("start in", values, "start");
            return (Criteria) this;
        }

        public Criteria andStartNotIn(List<Date> values) {
            addCriterion("start not in", values, "start");
            return (Criteria) this;
        }

        public Criteria andStartBetween(Date value1, Date value2) {
            addCriterion("start between", value1, value2, "start");
            return (Criteria) this;
        }

        public Criteria andStartNotBetween(Date value1, Date value2) {
            addCriterion("start not between", value1, value2, "start");
            return (Criteria) this;
        }

        public Criteria andEndIsNull() {
            addCriterion("end is null");
            return (Criteria) this;
        }

        public Criteria andEndIsNotNull() {
            addCriterion("end is not null");
            return (Criteria) this;
        }

        public Criteria andEndEqualTo(Date value) {
            addCriterion("end =", value, "end");
            return (Criteria) this;
        }

        public Criteria andEndNotEqualTo(Date value) {
            addCriterion("end <>", value, "end");
            return (Criteria) this;
        }

        public Criteria andEndGreaterThan(Date value) {
            addCriterion("end >", value, "end");
            return (Criteria) this;
        }

        public Criteria andEndGreaterThanOrEqualTo(Date value) {
            addCriterion("end >=", value, "end");
            return (Criteria) this;
        }

        public Criteria andEndLessThan(Date value) {
            addCriterion("end <", value, "end");
            return (Criteria) this;
        }

        public Criteria andEndLessThanOrEqualTo(Date value) {
            addCriterion("end <=", value, "end");
            return (Criteria) this;
        }

        public Criteria andEndIn(List<Date> values) {
            addCriterion("end in", values, "end");
            return (Criteria) this;
        }

        public Criteria andEndNotIn(List<Date> values) {
            addCriterion("end not in", values, "end");
            return (Criteria) this;
        }

        public Criteria andEndBetween(Date value1, Date value2) {
            addCriterion("end between", value1, value2, "end");
            return (Criteria) this;
        }

        public Criteria andEndNotBetween(Date value1, Date value2) {
            addCriterion("end not between", value1, value2, "end");
            return (Criteria) this;
        }

        public Criteria andErIsNull() {
            addCriterion("er is null");
            return (Criteria) this;
        }

        public Criteria andErIsNotNull() {
            addCriterion("er is not null");
            return (Criteria) this;
        }

        public Criteria andErEqualTo(Integer value) {
            addCriterion("er =", value, "er");
            return (Criteria) this;
        }

        public Criteria andErNotEqualTo(Integer value) {
            addCriterion("er <>", value, "er");
            return (Criteria) this;
        }

        public Criteria andErGreaterThan(Integer value) {
            addCriterion("er >", value, "er");
            return (Criteria) this;
        }

        public Criteria andErGreaterThanOrEqualTo(Integer value) {
            addCriterion("er >=", value, "er");
            return (Criteria) this;
        }

        public Criteria andErLessThan(Integer value) {
            addCriterion("er <", value, "er");
            return (Criteria) this;
        }

        public Criteria andErLessThanOrEqualTo(Integer value) {
            addCriterion("er <=", value, "er");
            return (Criteria) this;
        }

        public Criteria andErIn(List<Integer> values) {
            addCriterion("er in", values, "er");
            return (Criteria) this;
        }

        public Criteria andErNotIn(List<Integer> values) {
            addCriterion("er not in", values, "er");
            return (Criteria) this;
        }

        public Criteria andErBetween(Integer value1, Integer value2) {
            addCriterion("er between", value1, value2, "er");
            return (Criteria) this;
        }

        public Criteria andErNotBetween(Integer value1, Integer value2) {
            addCriterion("er not between", value1, value2, "er");
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