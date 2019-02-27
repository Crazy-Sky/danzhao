package com.danzhao.bean;

import java.util.ArrayList;
import java.util.List;

public class LevelrightExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public LevelrightExample() {
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

        public Criteria andLevelrightidIsNull() {
            addCriterion("levelrightid is null");
            return (Criteria) this;
        }

        public Criteria andLevelrightidIsNotNull() {
            addCriterion("levelrightid is not null");
            return (Criteria) this;
        }

        public Criteria andLevelrightidEqualTo(Integer value) {
            addCriterion("levelrightid =", value, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidNotEqualTo(Integer value) {
            addCriterion("levelrightid <>", value, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidGreaterThan(Integer value) {
            addCriterion("levelrightid >", value, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidGreaterThanOrEqualTo(Integer value) {
            addCriterion("levelrightid >=", value, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidLessThan(Integer value) {
            addCriterion("levelrightid <", value, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidLessThanOrEqualTo(Integer value) {
            addCriterion("levelrightid <=", value, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidIn(List<Integer> values) {
            addCriterion("levelrightid in", values, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidNotIn(List<Integer> values) {
            addCriterion("levelrightid not in", values, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidBetween(Integer value1, Integer value2) {
            addCriterion("levelrightid between", value1, value2, "levelrightid");
            return (Criteria) this;
        }

        public Criteria andLevelrightidNotBetween(Integer value1, Integer value2) {
            addCriterion("levelrightid not between", value1, value2, "levelrightid");
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

        public Criteria andLevelnameIsNull() {
            addCriterion("levelname is null");
            return (Criteria) this;
        }

        public Criteria andLevelnameIsNotNull() {
            addCriterion("levelname is not null");
            return (Criteria) this;
        }

        public Criteria andLevelnameEqualTo(String value) {
            addCriterion("levelname =", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameNotEqualTo(String value) {
            addCriterion("levelname <>", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameGreaterThan(String value) {
            addCriterion("levelname >", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameGreaterThanOrEqualTo(String value) {
            addCriterion("levelname >=", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameLessThan(String value) {
            addCriterion("levelname <", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameLessThanOrEqualTo(String value) {
            addCriterion("levelname <=", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameLike(String value) {
            addCriterion("levelname like", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameNotLike(String value) {
            addCriterion("levelname not like", value, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameIn(List<String> values) {
            addCriterion("levelname in", values, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameNotIn(List<String> values) {
            addCriterion("levelname not in", values, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameBetween(String value1, String value2) {
            addCriterion("levelname between", value1, value2, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelnameNotBetween(String value1, String value2) {
            addCriterion("levelname not between", value1, value2, "levelname");
            return (Criteria) this;
        }

        public Criteria andLevelvalueIsNull() {
            addCriterion("levelvalue is null");
            return (Criteria) this;
        }

        public Criteria andLevelvalueIsNotNull() {
            addCriterion("levelvalue is not null");
            return (Criteria) this;
        }

        public Criteria andLevelvalueEqualTo(Integer value) {
            addCriterion("levelvalue =", value, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueNotEqualTo(Integer value) {
            addCriterion("levelvalue <>", value, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueGreaterThan(Integer value) {
            addCriterion("levelvalue >", value, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueGreaterThanOrEqualTo(Integer value) {
            addCriterion("levelvalue >=", value, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueLessThan(Integer value) {
            addCriterion("levelvalue <", value, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueLessThanOrEqualTo(Integer value) {
            addCriterion("levelvalue <=", value, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueIn(List<Integer> values) {
            addCriterion("levelvalue in", values, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueNotIn(List<Integer> values) {
            addCriterion("levelvalue not in", values, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueBetween(Integer value1, Integer value2) {
            addCriterion("levelvalue between", value1, value2, "levelvalue");
            return (Criteria) this;
        }

        public Criteria andLevelvalueNotBetween(Integer value1, Integer value2) {
            addCriterion("levelvalue not between", value1, value2, "levelvalue");
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